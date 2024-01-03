// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, body_might_complete_normally_catch_error, unnecessary_null_comparison

import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import '../model/aduanModel.dart';
import '../widget/alert_dialog.dart';

final _storageRef = firebase_storage.FirebaseStorage.instance.ref();
final db = FirebaseFirestore.instance;

Future<void> createAduan(BuildContext context, AduanModel aduan,
    {List<File>? images}) async {
  if (images == null || images.isEmpty) {
    throw Exception('No image selected!');
  }

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('loadingImg'.tr()),
            ],
          ),
        ),
      );
    },
  );

  aduan.imageUrl = [];
  for (var image in images) {
    File imageFile = File(image.path);
    final fileName = imageFile.path.split('/').last;
    final destination = 'images/$fileName';

    try {
      await _storageRef.child(destination).putFile(imageFile);
      final downloadURL = await _storageRef.child(destination).getDownloadURL();

      aduan.imageUrl!.add(downloadURL);

      print('Image upload success!');
    } catch (e) {
      print('Upload failed : $e');
    }
  }
// add default data for aduan model
  Random randomNum = Random();
  final currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
  User? user = FirebaseAuth.instance.currentUser;

  aduan.noRujukan = 'NRJ${randomNum.nextInt(1000).toString()}';
  aduan.status = 'Belum Disemak';
  aduan.date = currentDate;
  aduan.time = currentTime;
  aduan.userId = user?.uid;
  aduan.imageId = 'IMG${randomNum.nextInt(1000).toString()}';
  aduan.aduanId = 'ADN${randomNum.nextInt(1000).toString()}';

  Navigator.pop(context);

  await db.collection("Aduan").add(aduan.toJson()).whenComplete(() {
    print('Berjaya!');
    showSuccessDialog(context, 'aduanSuccess'.tr());
  }).catchError((error) {
    print("Error! Something went wrong.");
    print(error.toString());
    showErrorDialog(context, error.toString());
    return Future<DocumentReference<Map<String, dynamic>>>.error(error);
  });
}

class FetchAduanCont {
  final model = FirebaseAduanModel();
  Future<List<Map<String, dynamic>>> fetchAduan() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance
          .collection('Aduan')
          .where('UserID', isEqualTo: userId)
          .get();
      List<Map<String, dynamic>> documents = snapshot.docs.map((doc) => doc.data()).toList();
      return documents;
    } else {
      print('No user is signed in!');
      return [];
    }
  }

  void searchFilter(
      {required String enteredKeyword,
      required List<Map<String, dynamic>> userAduan,
      required Function(List<Map<String, dynamic>>) onResult}) async {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = userAduan;
      print('No data');
    } else {
      results = userAduan
          .where((tajuk) => tajuk["Tajuk"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      print('Has Data');
    }
    onResult(results);
  }

  Future<List<String>> fetchImages(String aduanId) async {
    if (aduanId != null) {
      DocumentSnapshot<Map<String, dynamic>> doc = await db
          .collection('Aduan')
          .where('AduanID', isEqualTo: aduanId)
          .get()
          .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.docs.isNotEmpty) {
          return snapshot.docs.first;
        } else {
          throw ('Document does not exist');
        }
      }).catchError((e) {
        print(e);
        throw e;
      });
      AduanModel aduan = AduanModel.fromJson(doc.data()!);
      String? imageId = aduan.imageId;
      if (imageId != null) {
        print(aduanId);
        print(imageId);
        return model.fetchImagesFromFirestore(aduanId, imageId);
      } else {
        throw Exception("Image ID is null");
      }
    } else {
      print('Aduan ID not valid!');
      return [];
    }
  }
}
