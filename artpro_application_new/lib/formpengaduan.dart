// ignore_for_file: sort_child_properties_last

import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'global.dart' as globals;

class FormPengaduan extends StatefulWidget {
  const FormPengaduan({super.key});

  @override
  State<FormPengaduan> createState() => _FormPengaduanState();
}

class _FormPengaduanState extends State<FormPengaduan> {
  String namalengkap = "-Pilih-";
  String idart = "";
  String idmajikan = "";
  List<String> menuNama = [];

  DateTime date = DateTime.now();
  String tglpengaduan = "";

  TextEditingController pengaduanctr = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    menuNama.clear();
    menuNama.add("-Pilih-");
    if (globals.status_user == "majikan") {
      if (globals.listDataKontakArt.isNotEmpty) {
        for (int i = 0; i < globals.listDataKontakArt.length; i++) {
          menuNama.add(globals.listDataKontakArt[i].namalengkap);
        }
      } else {
        getKontakART();
      }
    } else {
      if (globals.listDataKontakMajikan.isNotEmpty) {
        for (int i = 0; i < globals.listDataKontakMajikan.length; i++) {
          menuNama.add(globals.listDataKontakMajikan[i].namalengkap);
        }
      } else {
        getKontakMajikan();
      }
    }
  }

  void getKontakART() async {
    await DataKontakART.getData(globals.iduser).then((value) {
      setState(() {
        globals.listDataKontakArt.clear();
        globals.listDataKontakArt = value;

        for (int i = 0; i < globals.listDataKontakArt.length; i++) {
          menuNama.add(globals.listDataKontakArt[i].namalengkap);
        }
      });
    });
  }

  void getKontakMajikan() async {
    await DataKontakMajikan.getData(globals.iduser).then((value) {
      setState(() {
        globals.listDataKontakMajikan.clear();
        globals.listDataKontakMajikan = value;

        for (int i = 0; i < globals.listDataKontakMajikan.length; i++) {
          menuNama.add(globals.listDataKontakMajikan[i].namalengkap);
        }
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pengaduanctr.dispose();
  }

  void sendPengaduanToDbART() async {
    var url = "${globals.urlapi}addpengaduan";
    var response = await http.post(Uri.parse(url), body: {
      "idmajikan": globals.iduser,
      "idart": idart,
      "isipengaduan": pengaduanctr.text,
      "penyelesaian": "-",
      "tglpengaduan": tglpengaduan
    });
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'Penilaian berhasil dikirim',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color:
                                    Color(int.parse(globals.color_secondary)))),
                      )),
                )
              ],
            );
          });
    }
  }

  void sendPengaduanToDbMajikan() async {
    var url = "${globals.urlapi}addpengaduan";
    var response = await http.post(Uri.parse(url), body: {
      "idmajikan": idmajikan,
      "idart": globals.iduser,
      "isipengaduan": pengaduanctr.text,
      "penyelesaian": "-",
      "tglpengaduan": tglpengaduan
    });
    if (response.statusCode == 200) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                'Penilaian berhasil dikirim',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                textAlign: TextAlign.center,
              ),
              actions: [
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color:
                                    Color(int.parse(globals.color_secondary)))),
                      )),
                )
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Form Pengaduan",
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(color: Color(int.parse(globals.color_primary)))),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              globals.status_user == "majikan"
                  ? "Pilih ART :"
                  : "Pilih Majikan : ",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 138, 138, 138)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: namalengkap,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Color(int.parse(globals.color_primary)),
                    ),
                    items: menuNama.map((item) {
                      return DropdownMenuItem(
                        child: Text(
                          item,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.black, fontSize: 15)),
                        ),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        namalengkap = newValue.toString();
                      });
                    },
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Isi Pengaduan: ",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              child: TextField(
                controller: pengaduanctr,
                cursorColor: Color(int.parse(globals.color_primary)),
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.black)),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(int.parse(globals.color_primary)),
                          width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(int.parse(globals.color_primary)),
                          width: 1.0),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    hintText: "Tulis pengaduan di sini",
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138)))),
                maxLines: 7,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (globals.status_user == "majikan") {
                          for (int i = 0;
                              i < globals.listDataKontakArt.length;
                              i++) {
                            if (globals.listDataKontakArt[i].namalengkap ==
                                namalengkap) {
                              idart =
                                  globals.listDataKontakArt[i].idart.toString();
                            }
                          }
                        } else {
                          for (int i = 0;
                              i < globals.listDataKontakMajikan.length;
                              i++) {
                            if (globals.listDataKontakMajikan[i].namalengkap ==
                                namalengkap) {
                              idmajikan = globals
                                  .listDataKontakMajikan[i].idmajikan
                                  .toString();
                            }
                          }
                        }

                        tglpengaduan = DateFormat('dd-MM-yyyy').format(date);
                      });

                      if (namalengkap != "-Pilih-" && pengaduanctr.text != "") {
                        if (globals.status_user == "majikan") {
                          sendPengaduanToDbART();
                        } else {
                          sendPengaduanToDbMajikan();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "Kirim Pengaduan",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
