import 'package:flutter/material.dart';
import 'package:hervigen/service/service_api.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController motivasiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ServiceApi().motivasiList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.4,
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
                        ServiceApi()
                            .sendMotivation(motivasiController.text)
                            .then((value) => ServiceApi().motivasiList());
                      });
                    },
                    child: const Text("Post"))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
