import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? nama;
  final String? ic;
  final String? noPhone;
  final String? emel;
  final String? pwd;
  final String? confirmPwd;
  final String? jantina;
  final String? dobirth;
  final String? pekerjaan;
  final String? warganegara;
  final String? bangsa;
  final String? alamat;
  final String? negeri;
  final String? bandar;
  final String? poskod;
  late String? dateTime;
  late String? uid;

  UserModel(
      {this.nama,
      this.ic,
      this.noPhone,
      this.emel,
      this.pwd,
      this.confirmPwd,
      this.jantina,
      this.dobirth,
      this.pekerjaan,
      this.warganegara,
      this.bangsa,
      this.alamat,
      this.negeri,
      this.bandar,
      this.poskod,
      this.dateTime,
      this.uid});

  toJson() {
    return {
      "Nama": nama,
      "NoIC": ic,
      "NoTelefon": noPhone,
      "Emel": emel,
      "Password": pwd,
      "ConfirmPassword": confirmPwd,
      "Jantina": jantina,
      "TarikhLahir": dobirth,
      "Pekerjaan": pekerjaan,
      "Warganegara": warganegara,
      "Bangsa": bangsa,
      "Alamat": alamat,
      "Negeri": negeri,
      "Bandar": bandar,
      "Poskod": poskod,
      "CreatedAt": dateTime,
      "UserID": uid,
    };
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : nama = json['Nama'],
        ic = json['NoIC'],
        noPhone = json['NoTelefon'],
        emel = json['Emel'],
        pwd = json['Password'],
        confirmPwd = json['ConfirmPassword'],
        jantina = json['Jantina'],
        dobirth = json['TarikhLahir'],
        pekerjaan = json['Pekerjaan'],
        warganegara = json['Warganegara'],
        bangsa = json['Bangsa'],
        alamat = json['Alamat'],
        negeri = json['Negeri'],
        bandar = json['Bandar'],
        poskod = json['Poskod'],
        dateTime = json['CreatedAt'],
        uid = json['UserID'];
}

class FirebaseUserModel {
  Future<List<Map<String, dynamic>>> fetchDataList(String userId) async {
    final collection = FirebaseFirestore.instance.collection('User');
    final querySnapshot =
        await collection.where('UserID', isEqualTo: userId).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<UserModel> fetchData(String userId) async {
    print(userId);
    final collection = FirebaseFirestore.instance.collection('User');
    final querySnapshot =
        await collection.where('UserID', isEqualTo: userId).get();
    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> userData = querySnapshot.docs.first.data();
      UserModel userModel = UserModel.fromJson(userData);
      print('${userModel.nama}');
      return userModel;
    } else {
      throw Exception('User not found');
    }
  }
}
