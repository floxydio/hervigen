import 'package:flutter/material.dart';
import 'package:hervigen/service/font_style.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({ Key? key }) : super(key: key);

  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(icon: const Icon(Icons.arrow_left_sharp),
        color: Colors.white,
        iconSize: 40,
        onPressed: () {},),
        centerTitle: true,
        title: Text("Viginesia", style: boardStyle,),
      ),
      body: SafeArea(child: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft, 
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text("Daftar", style: registerTitleStyle,),
          ),
        ],
      )),
      
      
    );
  }
}