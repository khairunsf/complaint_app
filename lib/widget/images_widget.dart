// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:complaint_app/controller/aduanController.dart';
import 'package:sizer/sizer.dart';

class ImageListWidget extends StatelessWidget {
  final String aduanId;

  ImageListWidget({Key? key, required this.aduanId}) : super(key: key);

  FetchAduanCont? controller = FetchAduanCont();

  Future<List<String>> fetchImagesForAduan(String aduanId) async {
    if (controller != null) {
      List<String> imageUrls = await controller!.fetchImages(aduanId);
      return imageUrls;
    } else {
      throw Exception('Controller is Null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchImagesForAduan(aduanId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Waiting...');
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.hasData) {
          List<String> imageUrls = snapshot.data!;
          return SizedBox(
            height: 20.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                String imageUrl = imageUrls[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(imageUrl),
                );
              },
            ),
          );
        }
        return Container(); // Placeholder or fallback widget
      },
    );
  }
}
