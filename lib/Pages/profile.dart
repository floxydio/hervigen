import 'package:flutter/material.dart';
import 'package:hervigen/pages/menu.dart';
import 'package:hervigen/service/font_style.dart';
import 'package:hervigen/service/service_api.dart';
import 'package:hervigen/widget/my_widget.dart';

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

  var nama = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vigenesia", style: boardWhiteStyle),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  maxRadius: 25.0,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              MyInput(
                initialValue: widget.nama ?? "",
                onChange: (value) {
                  namaController.text = value;
                },
                label: "Nama",
              ),
              MyInput(
                initialValue: widget.email ?? "",
                label: "Email",
                onChange: (value) {
                  emailController.text = value;
                },
              ),
              MyInput(
                initialValue: widget.profesi ?? "",
                label: "Profesi",
                onChange: (value) {
                  profesiController.text = value;
                },
              ),
              MyInput(
                initialValue: widget.password ?? "",
                label: "Password",
                onChange: (value) {
                  passwordController.text = value;
                },
              ),
              ElevatedButton(
                  onPressed: () {
                      ServiceApi()
                        .editProfile(
                            widget.idUser,
                            namaController.text,
                            profesiController.text,
                            widget.email!,
                            widget.password!)
                        .then((value) => Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const Menu())));
                  },
                  child: const Text("Edit"))
            ],
          ),
        ),
      ),
    );
  }
}
