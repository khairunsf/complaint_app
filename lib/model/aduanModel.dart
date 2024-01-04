import 'package:cloud_firestore/cloud_firestore.dart';

class AduanModel {
  final String cawangan;
  final String bahagian;
  final String tajuk;
  final String butir;
  final String lokasi;
  final double lat;
  final double long;
  final String? pengakuan;
  late List<String>? imageUrl;
  late String? noRujukan;
  late String? status;
  late String? date;
  late String? time;
  late String? aduanId;
  late String? imageId;
  late String? userId;

  AduanModel(
      {required this.cawangan,
      required this.bahagian,
      required this.tajuk,
      required this.butir,
      required this.lokasi,
      required this.lat,
      required this.long,
      required this.pengakuan,
      this.imageUrl,
      this.noRujukan,
      this.status,
      this.date,
      this.time,
      this.aduanId,
      this.imageId,
      this.userId});

  toJson() {
    return {
      "Cawangan Diadu": cawangan,
      "Bahagian Diadu": bahagian,
      "Tajuk": tajuk,
      "Butir": butir,
      "Lokasi": lokasi,
      "Latitud": lat,
      "Longitud": long,
      "Pengakuan": pengakuan,
      "imageUrl": imageUrl,
      "No Rujukan": noRujukan,
      "Status": status,
      "Tarikh": date,
      "Masa": time,
      "AduanID": aduanId,
      "ImageID": imageId,
      "UserID": userId,
    };
  }

  AduanModel.fromJson(Map<String, dynamic> json)
      : cawangan = json['Cawangan Diadu'],
        bahagian = json['Bahagian Diadu'],
        tajuk = json['Tajuk'],
        butir = json['Butir'],
        lokasi = json['Lokasi'],
        lat = (json['Latitud'] as num).toDouble(),
        long =
            json['Logitud'] != null ? (json['Logitud'] as num).toDouble() : 0.0,
        pengakuan = json['Pengakuan'],
        imageUrl = List<String>.from(json['imageUrl']),
        noRujukan = json['noRujukan'],
        status = json['Status'],
        date = json['Tarikh'],
        time = json['Masa'],
        aduanId = json['AduanID'],
        imageId = json['ImageID'],
        userId = json['UserID'];
}

class FirebaseAduanModel {
  Future<List<Map<String, dynamic>>> fetchData(String aduanId) async {
    final collection = FirebaseFirestore.instance.collection('Aduan');
    final querySnapshot =
        await collection.where('AduanID', isEqualTo: aduanId).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<String>> fetchImagesFromFirestore(
      String aduanId, String imageId) async {
    List<String> imageUrls = [];

    QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('Aduan')
        .where('AduanID', isEqualTo: aduanId)
        .where('ImageID', isEqualTo: imageId)
        .get();

    for (var doc in snapshot.docs) {
      List<String> urls = List<String>.from(doc['imageUrl']);
      imageUrls.addAll(urls);
    }
    return imageUrls;
  }
}
