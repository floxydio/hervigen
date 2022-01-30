import 'package:flutter/material.dart';
import 'package:hervigen/Service/Font_Style.dart';
import 'package:hervigen/Service/Service_Api.dart';

class MyProfile extends StatefulWidget {
  final dynamic idUser;
  final String? email;
  final String? profesi;
  final String? password;
  final String? nama;
  const MyProfile(
      {Key? key,
      this.idUser,
      this.email,
      this.profesi,
      this.password,
      this.nama})
      : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController profesiController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vigenesia", style: boardWhiteStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              maxRadius: 25.0,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [],
            ),
            ElevatedButton(
                onPressed: () {
                  ServiceApi()
                      .editProfile("670", "Dio", "Makan", "ds@d.com", "123");
                },
                child: const Text("Edit"))
          ],
        ),
      ),
    );
  }
}
