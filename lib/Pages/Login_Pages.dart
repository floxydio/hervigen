import 'package:flutter/material.dart';
import 'package:hervigen/Pages/menu.dart';
import 'package:hervigen/Pages/register_pages.dart';
import 'package:hervigen/service/font_style.dart';
import 'package:hervigen/service/service_api.dart';
import 'package:hervigen/widget/my_widget.dart';

class AuthPagesLogin extends StatefulWidget {
  const AuthPagesLogin({Key? key}) : super(key: key);

  @override
  _AuthPagesLoginState createState() => _AuthPagesLoginState();
}

class _AuthPagesLoginState extends State<AuthPagesLogin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //digunakan untuk memberhentikan fungsi controller agar apk tidak berat
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                "Login",
                style: registerTitleStyle,
              ),
            ),
            // widget reusable => agar penggunaan widget lebih efisien
            MyInput(
              controller: usernameController,
              label: "Email",
            ),
            MyInput(
                controller: passwordController,
                label: "Password",
                password: true),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                  onPressed: () {
                    ServiceApi()
                        .signIn(
                            usernameController.text, passwordController.text)
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Menu(
                                      idUser: value["data"]["iduser"],
                                      email: value["data"]["email"],
                                    ))));
                  },
                  child: const Text("Login")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum punya akun? ",
                  style: smallText,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RegisterPages()));
                    },
                    child: Text("Daftar", style: blueText))
              ],
            )
          ],
        ),
      ),
    );
  }
}
