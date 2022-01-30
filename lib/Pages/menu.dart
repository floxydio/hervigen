import 'package:flutter/material.dart';
import 'package:hervigen/Service/Service_Api.dart';

class Menu extends StatefulWidget {
  final dynamic idUser;
  final String? email;
  const Menu({Key? key, this.idUser, this.email}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController motivasiController = TextEditingController();

  @override
  void initState() {
    ServiceApi().motivasiList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: TextFormField(
                    controller: motivasiController,
                    decoration: InputDecoration(
                      hintText: "Posting motivasi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        print(widget.idUser);
                        print(motivasiController.text);
                        ServiceApi().sendMotivation(
                            motivasiController.text, widget.idUser);
                      });
                    },
                    child: const Text("Post"))
              ])
            ]),
          ),
        ),
      ),
    );
  }
}
