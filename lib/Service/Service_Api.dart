import 'package:dio/dio.dart';

class ServiceApi {
  var BASE_URL = "http://vigenesia.org/";

  var URL = Dio();

  Future<dynamic> signIn(String email, String password) async {
    try {
      var formData = FormData.fromMap({"email": email, "password": password});

      Response response = await URL.post(BASE_URL + "login", data: formData);

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> signUp(
      String nama, String profesi, String email, String password) async {
    try {
      var formData = FormData.fromMap({
        "nama": nama,
        "profesi": profesi,
        "email": email,
        "password": password
      });
      Response response = await URL.post(BASE_URL + "registrasi");

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
