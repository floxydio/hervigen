import 'package:flutter/material.dart';
import 'package:hervigen/Service/Font_Style.dart';
import 'package:hervigen/Pages/menu.dart';
import 'package:hervigen/Pages/register_pages.dart';
import 'package:hervigen/Service/service_api.dart';
import 'package:hervigen/widget/my_widget.dart';

class AuthPagesLogin extends StatefulWidget {
  const AuthPagesLogin({Key? key}) : super(key: key);

  @override
  _AuthPagesLoginState createState() => _AuthPagesLoginState();
}

class _AuthPagesLoginState extends State<AuthPagesLogin> {
  //digunakan untuk menyimpan email input yang telah diisi pada textfield.
  TextEditingController emailController = TextEditingController();
  //digunakan untuk menyimpan password input yang telah diisi pada textfield.
  TextEditingController passwordController = TextEditingController();

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
                "Vigenesia",
                style: boardStyle,
              ),
            ),
            // MyInput => custom widget yang berfungsi sebagai reuseable widget agar penggunaan widget lebih efisien
            // TextField email
            MyInput(
              controller: emailController,
              label: "Email",
            ),
            // TextField password
            MyInput(
                controller: passwordController,
                label: "Password",
                password: true),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                  onPressed: () {
                    // [post] api login digunakan disini sebagai validasi ke database untuk memastikan apakah data login yang di masukkan benar / salah
                    ServiceApi()
                        .signIn(emailController.text, passwordController.text)
                        .then((value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Menu(
                                      // parameter ini dibawa ke Menu agar kita bisa menggunakan data ini di page tersebut
                                      idUser: value["data"]["iduser"],
                                      email: value["data"]["email"],
                                      nama: value["data"]["nama"],
                                      password: value["data"]["password"],
                                      profesi: value["data"]["profesi"],
                                    ))));
                  },
                  child: const Text("Login")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Belum Punya Akun? ",
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
