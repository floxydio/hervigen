import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String? label;
  final bool password;
  final TextEditingController? controller;
  const MyInput({
    Key? key,
    this.label,
    this.controller,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      decoration: InputDecoration(
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        labelText: label,
      ),
    );
  }
}
