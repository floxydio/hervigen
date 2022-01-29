// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hervigen/Components/MyWidget.dart';
import 'package:hervigen/Service/Font_Style.dart';
import 'package:hervigen/Service/Service_Api.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({Key? key}) : super(key: key);

  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  TextEditingController namaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController profesiController = TextEditingController();

  

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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            MyInput(
              controller: namaController,
              label: "Nama",
            ),
            MyInput(
              controller: usernameController,
              label: "Username",
            ),
            MyInput(
              controller: profesiController,
              label: "Profesi",
            ),
            MyInput(
              controller: passwordController,
              password: true,
              label: "Password",
            ),
            ElevatedButton(
                onPressed: () {
                  ServiceApi().signUp(
                    namaController.text,
                    usernameController.text,
                    profesiController.text,
                    passwordController.text,
                  );
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
