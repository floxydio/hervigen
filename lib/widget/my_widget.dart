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
    return Container(
      padding: const EdgeInsets.only(bottom: 15.0),
      width: MediaQuery.of(context).size.width / 1.1,
      child: TextFormField(
        controller: controller,
        obscureText: password,
        decoration: InputDecoration(
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          labelText: label,
        ),
      ),
    );
  }
}
