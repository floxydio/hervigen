import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ServiceApi {
  // web hosting yang digunakan untuk mengambil api
  var baseURL = "http://vigenesia.org/";

  var dio = Dio();


  // [post] api untuk login
  Future<dynamic> signIn(String email, String password) async {
    Map<String, dynamic> formData = {"email": email, "password": password};

    try {
      Response response = await dio.post(baseURL + "api/login",
          data: formData,
          options: Options(headers: {'Content-type': 'application/json'}));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }

        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // [post] api untuk membuat postingan motivasi
  Future<dynamic> sendMotivation(String motivasi, dynamic idUser) async {
    Map<String, dynamic> formData = {
      "isi_motivasi": motivasi,
      "iduser": idUser
    };
    try {
      Response response = await dio.post(baseURL + "api/dev/POSTmotivasi",
          data: formData,
          options: Options(contentType: Headers.formUrlEncodedContentType));

      if (kDebugMode) {
        print("Respon -> ${response.data} + ${response.statusCode}");
      }

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // [delete] api untuk login
  Future<dynamic> deleteMotivation(dynamic id) async {
    Map<String, dynamic> formData = {"id": id};
    try {
      Response response = await dio.delete(baseURL + "api/dev/DELETEmotivasi",
          data: formData,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // [delete] api untuk menghapus postingan motivasi
  Future<dynamic> editMotivation(String motivasi, dynamic id) async {
    Map<String, dynamic> formData = {"isi_motivasi": motivasi, "id": id};
    try {
      Response response = await dio.put(baseURL + "api/dev/PUTmotivasi",
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ));
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // [get] api untuk menampilkan data postingan motivasi
  Future<List?> motivasiList() async {
    try {
      Response response = await dio.get(baseURL + "api/Get_motivasi");

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // [post] api untuk registrasi login
  Future<dynamic> signUp(
      String nama, String profesi, String email, String password) async {
    var formData = FormData.fromMap({
      "nama": nama,
      "profesi": profesi,
      "email": email,
      "password": password
    });
    try {
      Response response =
          await dio.post(baseURL + "api/registrasi", data: formData);

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // [put] api untuk mengubah data profil
  Future<dynamic> editProfile(dynamic idUser, String nama, String profesi,
      String email, String password) async {
    Map<String, dynamic> formData = {
      "iduser": idUser,
      "nama": nama,
      "profesi": profesi,
      "email": email,
      "password": password
    };
    try {
      Response response = await dio.put(baseURL + "api/PUTprofile",
          data: formData,
          options: Options(contentType: Headers.formUrlEncodedContentType));

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("Respon Edit -> ${response.data}");
        }
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}


