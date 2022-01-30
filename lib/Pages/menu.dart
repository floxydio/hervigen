import 'package:flutter/material.dart';
import 'package:hervigen/Pages/Profile.dart';
import 'package:hervigen/Service/Service_Api.dart';

class Menu extends StatefulWidget {
  final dynamic idUser;
  final String? email;
  final String? profesi;
  final String? password;
  final String? nama;
  const Menu(
      {Key? key,
      this.idUser,
      this.email,
      this.profesi,
      this.password,
      this.nama})
      : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController motivasiController = TextEditingController();
  List? dataMotivasi = [];

  @override
  void initState() {
    ServiceApi().motivasiList().then((value) => {
          dataMotivasi = [],
          setState(() {
            dataMotivasi = value;
          })
        });
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
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => MyProfile(
                                  email: widget.email,
                                  idUser: widget.idUser,
                                  nama: widget.nama,
                                  password: widget.password,
                                  profesi: widget.profesi,
                                )));
                  },
                  child: const Text("Go TO Profile")),
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
                        setState(() {
                          motivasiController.text == "";
                          ServiceApi()
                              .motivasiList()
                              .then((value) => {dataMotivasi = value});
                        });
                      });
                    },
                    child: const Text("Post")),
              ]),
              dataMotivasi!.isEmpty
                  ? const CircularProgressIndicator()
                  : ListView.builder(
                      physics: const ScrollPhysics(),
                      itemCount: 10,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(dataMotivasi![i]["isi_motivasi"]),
                        );
                      })
            ]),
          ),
        ),
      ),
    );
  }
}
