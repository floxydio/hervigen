import 'package:flutter/foundation.dart';
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
              GestureDetector(
                onTap: () {
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
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        maxRadius: 25,
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Text("Profil saya"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                              if (kDebugMode) {
                                print(widget.idUser);
                              }
                              if (kDebugMode) {
                                print(motivasiController.text);
                              }
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
              ),
              dataMotivasi!.isEmpty
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                      child: ListView.builder(
                          physics: const ScrollPhysics(),
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 15.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                leading: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${i + 1}"),
                                  ],
                                ),
                                title: Text(dataMotivasi![i]["isi_motivasi"]),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          AlertDialog alert = AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Text(
                                                    "Edit motivasi kamu"),
                                                Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 10.0, bottom: 10.0),
                                                  child: TextFormField(
                                                    initialValue:
                                                        motivasiController.text,
                                                    maxLines: 8,
                                                    onChanged: (value) {
                                                      setState(() {});
                                                    },
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                    ),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      ServiceApi()
                                                          .editMotivation(
                                                              motivasiController
                                                                  .text,
                                                              widget.idUser);
                                                    },
                                                    child: const Text("Ubah"))
                                              ],
                                            ),
                                          );

                                          // show the dialog
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return alert;
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.edit),
                                      ),
                                      const SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            ServiceApi().deleteMotivation(
                                                widget.idUser);
                                          });
                                        },
                                        child: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
            ]),
          ),
        ),
      ),
    );
  }
}
