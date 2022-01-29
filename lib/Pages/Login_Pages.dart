import 'package:flutter/material.dart';

class AuthPagesLogin extends StatefulWidget {
  const AuthPagesLogin({Key? key}) : super(key: key);

  @override
  _AuthPagesLoginState createState() => _AuthPagesLoginState();
}

class _AuthPagesLoginState extends State<AuthPagesLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Login"),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text("USERNAME"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField()),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text("PASSWORD"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField()),
            )
          ],
        ),
      ),
    );
  }
}
