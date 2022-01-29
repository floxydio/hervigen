import 'package:flutter/material.dart';
import 'package:hervigen/pages/login_pages.dart';
import 'package:hervigen/widget/my_widget.dart';
import 'package:hervigen/service/Font_Style.dart';
import 'package:hervigen/service/Service_Api.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({Key? key}) : super(key: key);

  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  TextEditingController namaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController profesiController = TextEditingController();

  //digunakan untuk memberhentikan fungsi controller agar apk tidak berat
  @override
  void dispose() {
    namaController.dispose();
    passwordController.dispose();
    emailController.dispose();
    profesiController.dispose();
    super.dispose();
  }

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
            MyInput(
              controller: namaController,
              label: "Nama",
            ),
            MyInput(
              controller: profesiController,
              label: "Profesi",
            ),
            MyInput(
              controller: emailController,
              label: "Email",
            ),
            MyInput(
              controller: passwordController,
              password: true,
              label: "Password",
            ),
            ElevatedButton(
                onPressed: () {
                  ServiceApi()
                      .signUp(
                        namaController.text,
                        emailController.text,
                        profesiController.text,
                        passwordController.text,
                      )
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AuthPagesLogin())));
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
