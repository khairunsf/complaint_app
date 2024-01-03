// ignore_for_file: use_build_context_synchronously, unnecessary_null_comparison, empty_catches

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:complaint_app/model/userModel.dart';
import 'package:complaint_app/services/auth.dart';
import 'package:complaint_app/widget/alert_dialog.dart';
import 'package:complaint_app/widget/bottombar.dart';

class UserController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final model = FirebaseUserModel();

  Future<void> register(BuildContext context, UserModel user) async {
    try {
      String icNum = '${user.ic!}@i-adu.com';
      final currentDate =
          DateFormat('yyyy-MM-dd,HH:mm:ss').format(DateTime.now());
      user.dateTime = currentDate;

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: icNum, password: user.pwd!);

      user.uid = userCredential.user!.uid; //set uid to UserID field

      db
          .collection('User')
          .doc(userCredential.user!.uid)
          .set(user.toJson())
          .whenComplete(() async {
        print('Success');
        await showSuccessDialog(context, 'registerSuccess'.tr());
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AuthPage()));
      });
    } on FirebaseAuthException catch (e) {
      print(e);
      showErrorDialog(context, 'Register Unsuccessful!');
    }
  }

  Future<void> login(BuildContext context, UserModel user) async {
    try {
      String icNum = '${user.ic!}@i-adu.com';

      await auth.signInWithEmailAndPassword(email: icNum, password: user.pwd!);
      await showSuccessDialog(context, 'loginSuccess'.tr());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const BottomBarWidget()));
    } on FirebaseAuthException catch (e) {
      print(e);
      showErrorDialog(context, 'Login Unsuccessful!');
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      String user = FirebaseAuth.instance.currentUser!.uid;
      print(user);

      await auth.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AuthPage()));
    } catch (e) {
      print(e);
      showErrorDialog(context, 'Logout Unsuccessful');
    }
  }

  Future<UserModel?> fetchUser(userId) async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.uid;
    if (userId != null) {
      print('User ID: ${userId}');
      return model.fetchData(userId);
    } else {
      print('No user is signed in!');
      return null;
    }
  }

  Future<void> updateUser(BuildContext context, UserModel userData) async {
    try {
      User? currentUser = auth.currentUser;
      String? userId = currentUser?.uid;
      if (userId != null) {
        print('Update user ID: ${userId}');
        DocumentSnapshot snapshot =
            await db.collection('User').doc(userId).get();
        Map<String, dynamic> existingData =
            snapshot.data() as Map<String, dynamic>;

        // Compare the existing data with the new data
        Map<String, dynamic> newData = userData.toJson();
        Map<String, dynamic> updatedData = {};
        existingData.forEach((key, value) {
          if (newData.containsKey(key) && newData[key] != value) {
            updatedData[key] = newData[key];
          } else {
            updatedData[key] = value;
          }
        });

        await db
            .collection('User')
            .doc(userId)
            .update(updatedData)
            .whenComplete(() {
          print('Update success');
          showSuccessDialog(context, 'dataUpdated'.tr());
        });
      }
    } catch (e) {
      print('Error: $e');
      showErrorDialog(context, 'Failed to update data.');
    }
  }

  Future<void> updatePwd(BuildContext context, UserModel userModel,
      Map<String, dynamic> fieldsToUpdate) async {
    try {
      String? userId = userModel.uid;
      Map<String, dynamic> updatedData = {};

      // Fetch the existing data from the Firestore document
      DocumentSnapshot snapshot = await db.collection('User').doc(userId).get();
      Map<String, dynamic> existingData =
          snapshot.data() as Map<String, dynamic>;

      // Compare the existing data with the new data
      fieldsToUpdate.forEach((key, value) {
        if (existingData.containsKey(key) && existingData[key] != value) {
          updatedData[key] = value;
        }
      });

      if (updatedData.isNotEmpty) {
        await db
            .collection('User')
            .doc(userId)
            .update(updatedData)
            .whenComplete(() {
          print('Update success');
          showSuccessDialog(context, 'pwdChanged.'.tr());
        });
      } else {
        print('No fields to update');
        // Optionally, show a message indicating that there were no fields to update
      }
    } catch (e) {
      print('Error: $e');
      showErrorDialog(context, 'Failed to update password.');
    }
  }

  Future<void> navigateToAuthPage(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AuthPage()),
    );
  }

  Future<String?> getEmailFromId(String id) async {
    try {
      DocumentSnapshot snapshot = await db.collection('Users').doc(id).get();
      if (snapshot.exists) {
        return snapshot['email'] as String?;
      } else {
        print('Document with the provided ID doesnt exist');
        return null; // Document with the provided ID doesn't exist
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
