import 'package:flutter/material.dart';
import 'package:hervigen/Service/Font_Style.dart';

class myProfile extends StatefulWidget {
  const myProfile({ Key? key }) : super(key: key);

  @override
  _myProfileState createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vigenesia", style: boardWhiteStyle),
      ),
      body: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              maxRadius: 25.0,
              child: Icon(Icons.person,
              color: Colors.white),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
              Text("Username"),
            
              ],
            )
          ],
        ),
      ),
      
    );
  }
}