// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ServiceApi {
  var baseURL = "http://vigenesia.org/";


  var dio = Dio();

  Future<dynamic> signIn(String email, String password) async {
    Map<String, dynamic> formData = {"email": email, "password": password};

    try {
      Response response = await dio.post(baseURL + "api/login",
          data: formData,
          options: Options(headers: {'Content-type': 'application/json'}));

      if (response.statusCode == 200) {
        print(response.data);

        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> sendMotivation(String motivasi) async {
    Map<String, dynamic> formData = {"isi_motivasi": motivasi};
    try {
      Response response =
          await dio.post(baseURL + "api/dev/POSTmotivasi", data: formData);

      if (kDebugMode) {
        print("Respon -> ${response.data} + ${response.statusCode}");
      }

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> deleteMotivation(String id) async {
    Map<String, dynamic> formData = {"id": id};
    try {
      Response response =
          await dio.delete(baseURL + "api/dev/DELETEmotivasi", data: formData);
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> editMotivation(String motivasi, String id) async {
    Map<String, dynamic> formData = {"isi_motivasi": motivasi, "id": id};
    try {
      Response response = await dio.delete(baseURL + "api/dev/PUTmotivasi",
          data: formData,
          options: Options(
            contentType: Headers.formUrlEncodedContentType,
          ));
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List?> motivasiList() async {
    try {
      Response response = await dio.get(baseURL + "api/Get_motivasi");

      if (response.statusCode == 200) {
        print(response.data);
        return response.data as List;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

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
}
