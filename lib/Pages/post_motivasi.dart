import 'package:flutter/material.dart';
import 'package:hervigen/service/font_style.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MotivasiPost extends StatefulWidget {
  const MotivasiPost({Key? key}) : super(key: key);

  @override
  State<MotivasiPost> createState() => _MotivasiPostState();
}

class _MotivasiPostState extends State<MotivasiPost> {
  TextEditingController motivasiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
           Text("Motivasi", style: boardStyle),
          Padding(
            padding:
                const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
            child: FormBuilderTextField(
                name: "",
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                )),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Posting"))
        ]),
      ),
    );
  }
}
