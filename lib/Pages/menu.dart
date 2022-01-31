import 'package:flutter/material.dart';
import 'package:hervigen/Pages/Profile.dart';
import 'package:hervigen/service/service_api.dart';

class Menu extends StatefulWidget {
  // deklarasi parameter agar kita bisa menggunakan data yang dibawa pada screen sebelumnya
  final dynamic idUser;
  final String? id;
  final String? email;
  final String? profesi;
  final String? password;
  final String? nama;
  const Menu(
      {Key? key,
      this.idUser,
      this.id,
      this.email,
      this.profesi,
      this.password,
      this.nama})
      : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  //digunakan untuk menyimpan motivasi input yang telah diisi pada textfield.
  TextEditingController motivasiController = TextEditingController();
  //digunakan sebagai penampung data yang di dapat pada api di initState
  List? dataMotivasi = [];
  String? motivasiBaru;

  @override
  void initState() {
    //[get] api motivasi di deklarasikan pada initState agar dijalankan pertama kali ketika screen dibuka.
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
                                // parameter ini dibawa ke MyProfile agar kita bisa menggunakan data ini di page tersebut
                                email: widget.email,
                                idUser: widget.idUser,
                                nama: widget.nama,
                                password: widget.password,
                                profesi: widget.profesi,
                              )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width /
                      2, // lebar widget diambil dari lebar layar bagi 2
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
                        width: MediaQuery.of(context).size.width /
                            1.3, // lebar widget diambil dari lebar layar bagi 1.3
                        child: TextFormField(
                          controller:
                              motivasiController, // wajib menggunakan controller agar data input dapat tersimpan
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
                              // [post] api motivasi digunakan disini, agar kita dapat mengirim data motivasi yang telah dibuat ke database
                              ServiceApi().sendMotivation(
                                  motivasiController.text, widget.idUser);
                              setState(() {
                                motivasiController.text == "";
                                // [get] api motivasi agar setelah mengirim data postingan motivasi kita dapat melihat data postingan motivasi terbaru
                                ServiceApi()
                                    .motivasiList()
                                    .then((value) => {dataMotivasi = value});
                              });
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Menu(
                                            // parameter ini dibawa ke Menu agar kita bisa menggunakan data ini di page tersebut
                                            idUser: widget.idUser,
                                            email: widget.email,
                                            nama: widget.nama,
                                            password: widget.password,
                                            profesi: widget.profesi,
                                          )));
                            });
                          },
                          child: const Text("Post")),
                    ]),
              ),
              // boolean condition
              // jika dataMotivasi adalah kosong
              dataMotivasi!.isEmpty
                  // maka kita akan menampilakn CircularProgressIndicator
                  ? const CircularProgressIndicator()
                  // jika ada maka kita akan menampilkan data yang diambil dari [get] api motivasi
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                      child: ListView.builder(
                          physics: const ScrollPhysics(),
                          itemCount: 25,
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
                                    // widget untuk menampilkan nomor urut pada list motivasi
                                    Text("${i + 1}"),
                                  ],
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(dataMotivasi![i]["isi_motivasi"]),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15.0, bottom: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          print(dataMotivasi![i]["id"]);
                                          AlertDialog alert = AlertDialog(
                                            scrollable: true,
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
                                                        dataMotivasi![i]
                                                            ["isi_motivasi"],
                                                    maxLines: 4,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        motivasiBaru = value;
                                                        dataMotivasi![i][
                                                                "isi_motivasi"] =
                                                            motivasiBaru;
                                                      });
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
                                                      setState(() {
                                                        // [put] api motivasi digunakan disini untuk fungsi mengedit motivasi
                                                        ServiceApi()
                                                            .editMotivation(
                                                                motivasiBaru!,
                                                                dataMotivasi![i]
                                                                    ["id"]
                                                                    )
                                                            .then((value) => {
                                                                  motivasiController =
                                                                      value
                                                                });
                                                        Navigator
                                                            .pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (_) =>
                                                                            Menu(
                                                                              // parameter ini dibawa ke Menu agar kita bisa menggunakan data ini di page tersebut
                                                                              idUser: widget.idUser,
                                                                              email: widget.email,
                                                                              nama: widget.nama,
                                                                              password: widget.password,
                                                                              profesi: widget.profesi,
                                                                            )));
                                                      });
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
                                            // [delete] api motivasi digunakan disini untuk fungsi menghapus motivasi
                                            ServiceApi().deleteMotivation(
                                                dataMotivasi![i]["id"]);
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
