// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ServiceApi {
  var baseURL = "http://vigenesia.org/";

  var dio = Dio();

  Future<dynamic> signIn(String email, String password) async {
    try {
      var formData = FormData.fromMap({"email": email, "password": password});

      Response response = await dio.post(baseURL + "login", data: formData);

      if (response.statusCode == 200) {
        return response.data;
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
