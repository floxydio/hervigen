import 'package:flutter/material.dart';
import 'package:hervigen/pages/menu.dart';
import 'package:hervigen/service/font_style.dart';
import 'package:hervigen/service/service_api.dart';
import 'package:hervigen/widget/my_widget.dart';

class MyProfile extends StatefulWidget {
  // deklarasi parameter agar kita bisa menggunakan data yang dibawa pada screen sebelumnya
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
  //digunakan untuk menyimpan nama input yang telah diisi pada textfield.
  TextEditingController namaController = TextEditingController();
  //digunakan untuk menyimpan email input yang telah diisi pada textfield.
  TextEditingController emailController = TextEditingController();
  //digunakan untuk menyimpan profesi input yang telah diisi pada textfield.
  TextEditingController profesiController = TextEditingController();
  //digunakan untuk menyimpan password input yang telah diisi pada textfield.
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 35.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue,
                      ),
                      child: Center(
                          child: Text("Vigenesia", style: boardWhiteStyle))),
                ),
                // MyInput => custom widget yang berfungsi sebagai reuseable widget agar penggunaan widget lebih efisien
                // TextField nama
                MyInput(
                  initialValue: widget.nama ?? "",
                  onChange: (value) {
                    namaController.text = value;
                  },
                  label: "Nama",
                ),
                // TextField email
                MyInput(
                  initialValue: widget.email ?? "",
                  label: "Email",
                  onChange: (value) {
                    emailController.text = value;
                  },
                ),
                // TextField profesi
                MyInput(
                  initialValue: widget.profesi ?? "",
                  label: "Profesi",
                  onChange: (value) {
                    profesiController.text = value;
                  },
                ),
                // TextField password
                MyInput(
                  initialValue: widget.password ?? "",
                  label: "Password",
                  onChange: (value) {
                    passwordController.text = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                    // [put] api login digunakan disini untuk mengedit profil
                        ServiceApi()
                            .editProfile(
                                widget.idUser,
                                namaController.text,
                                profesiController.text,
                                widget.email!,
                                widget.password!)
                            .then((value) => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => Menu(
                                      // parameter ini dibawa ke Menu agar kita bisa menggunakan data ini di page tersebut
                                          idUser: widget.idUser,
                                          email: widget.email,
                                          nama: widget.nama,
                                          password: widget.password,
                                          profesi: widget.profesi,
                                        ))));
                      });
                    },
                    child: const Text("Edit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
