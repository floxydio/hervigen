import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final Function(String?)? onSaved;
  final ValueChanged? onChange;
  final bool password;
  final TextEditingController? controller;
  const MyInput({
    Key? key,
    this.label,
    this.initialValue,
    this.onSaved,
    this.onChange,
    this.controller,
    this.password = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30.0),
      width: MediaQuery.of(context).size.width / 1.1,
      child: TextFormField(
        onSaved: onSaved,
        controller: controller,
        obscureText: password,
        onChanged: onChange,
        initialValue: initialValue,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: label,
        ),
      ),
    );
  }
}
