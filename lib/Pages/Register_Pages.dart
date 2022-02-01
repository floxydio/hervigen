import 'package:flutter/material.dart';
import 'package:hervigen/Service/Font_Style.dart';
import 'package:hervigen/pages/login_pages.dart';
import 'package:hervigen/widget/my_widget.dart';
import 'package:hervigen/service/Service_Api.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({Key? key}) : super(key: key);

  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_left_sharp),
          color: Colors.white,
          iconSize: 40,
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          "Viginesia",
          style: boardStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  "Daftar",
                  style: registerTitleStyle,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
                child: Text(
                  "Setiap program menghubungkan data pengguna di program tersebut",
                  style: blueText,
                ),
              ),
              // MyInput => custom widget yang berfungsi sebagai reuseable widget agar penggunaan widget lebih efisien
              // TextField nama
              MyInput(
                controller: namaController,
                label: "Nama",
              ),
              // TextField profesi
              MyInput(
                controller: profesiController,
                label: "Profesi",
              ),
              // TextField email
              MyInput(
                controller: emailController,
                label: "Email",
              ),
              // TextField password
              MyInput(
                controller: passwordController,
                password: true,
                label: "Password",
              ),
              ElevatedButton(
                  onPressed: () {
                    // [post] api register digunakan disini untuk registrasi
                    ServiceApi()
                        .signUp(
                          namaController.text,
                          profesiController.text,
                          emailController.text,
                          passwordController.text,
                        )
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AuthPagesLogin())));
                  },
                  child: const Text("Register"))
            ],
          ),
        ),
      ),
    );
  }
}