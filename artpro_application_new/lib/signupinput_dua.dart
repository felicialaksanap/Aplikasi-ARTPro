import 'package:artpro_application_new/signupinput_tiga.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import './global.dart' as globals;

class SignUpInputD extends StatefulWidget {
  String konten = "";
  SignUpInputD({super.key, required this.konten});

  @override
  State<SignUpInputD> createState() => _SignUpInputDState();
}

class _SignUpInputDState extends State<SignUpInputD> {
  String agama = "";
  String tipekerja = "";
  bool t_menginap = false;
  bool t_warnen = false;
  bool l_hewan = false;
  bool l_mperj = false;
  bool l_spdmotor = false;
  bool l_mobil = false;
  bool l_masak = false;

  TextEditingController beratctr = TextEditingController();
  TextEditingController tinggictr = TextEditingController();
  TextEditingController pendidikanctr = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    beratctr.dispose();
    tinggictr.dispose();
    pendidikanctr.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.konten == "edit") {
      beratctr.text = globals.berat;
      tinggictr.text = globals.tinggi;
      pendidikanctr.text = globals.pendidikanterakhir;
      agama = globals.agama;
      t_menginap = globals.tkmenginap == "false" ? false : true;
      t_warnen = globals.tkwarnen == "false" ? false : true;
      l_hewan = globals.hewan == "false" ? false : true;
      l_mperj = globals.mabukJalan == "false" ? false : true;
      l_spdmotor = globals.spdmotor == "false" ? false : true;
      l_mobil = globals.mobil == "false" ? false : true;
      l_masak = globals.masak == "false" ? false : true;
    }
  }

  void addToGlobal() async {
    setState(() {
      globals.berat = beratctr.text;
      globals.tinggi = tinggictr.text;
      globals.pendidikanterakhir = pendidikanctr.text;
      globals.agama = agama;
      globals.tkmenginap = t_menginap.toString();
      globals.tkwarnen = t_warnen.toString();
      globals.hewan = l_hewan.toString();
      globals.mabukJalan = l_mperj.toString();
      globals.spdmotor = l_spdmotor.toString();
      globals.mobil = l_mobil.toString();
      globals.masak = l_masak.toString();
    });

    if (widget.konten == "daftar") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SignUpInputT(
                    konten: "daftar",
                  )));
    } else {
      var url = "${globals.urlapi}edituserdetailprofileart";
      var response = await http.put(Uri.parse(url), body: {
        "iduser": globals.iduser,
        "pendidikanterakhir": globals.pendidikanterakhir,
        "beratbadan": globals.berat,
        "tinggibadan": globals.tinggi,
        "agama": globals.agama,
        "tkmenginap": globals.tkmenginap,
        "tkwarnen": globals.tkwarnen,
        "hewan": globals.hewan,
        "mabukjalan": globals.mabukJalan,
        "sepedamotor": globals.spdmotor,
        "mobil": globals.mobil,
        "masak": globals.masak
      });

      messagetoBack();
    }
  }

  messagetoBack() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              'Informasi detail profile berhasil diganti, silahkan kembali ke menu profile',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
        ),
        title: Text(
          widget.konten == "edit" ? "Ganti Detail Profile" : "Form Data Diri",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(int.parse(globals.color_primary)),
                  fontWeight: FontWeight.bold)),
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
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Berat Badan (kg)',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          Text(
                            " *",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          )
                        ],
                      ),
                      FormFieldTemplate(beratctr)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Tinggi Badan (cm)',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ),
                          Text(
                            "*",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          )
                        ],
                      ),
                      FormFieldTemplate(tinggictr)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Pendidikan Terakhir',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            FormFieldTemplate(pendidikanctr),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Agama',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: "islam",
                            groupValue: agama,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color(int.parse(globals.color_primary))),
                            onChanged: (value) {
                              setState(() {
                                agama = value.toString();
                              });
                            }),
                        Text(
                          "Islam",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "kristen",
                            groupValue: agama,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color(int.parse(globals.color_primary))),
                            onChanged: (value) {
                              setState(() {
                                agama = value.toString();
                              });
                            }),
                        Text(
                          "Kristen",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "katolik",
                            groupValue: agama,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color(int.parse(globals.color_primary))),
                            onChanged: (value) {
                              setState(() {
                                agama = value.toString();
                              });
                            }),
                        Text(
                          "Katolik",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: "hindu",
                            groupValue: agama,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color(int.parse(globals.color_primary))),
                            onChanged: (value) {
                              setState(() {
                                agama = value.toString();
                              });
                            }),
                        Text(
                          "Hindu",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "buddha",
                            groupValue: agama,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color(int.parse(globals.color_primary))),
                            onChanged: (value) {
                              setState(() {
                                agama = value.toString();
                              });
                            }),
                        Text(
                          "Buddha",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: "konghucu",
                            groupValue: agama,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) =>
                                    Color(int.parse(globals.color_primary))),
                            onChanged: (value) {
                              setState(() {
                                agama = value.toString();
                              });
                            }),
                        Text(
                          "Konghucu",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Tipe Pekerjaan',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            Text(
              '(bisa memilih lebih dari 1)',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 22, 15, 41),
                fontSize: 12,
              )),
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: t_menginap,
                    onChanged: (value) {
                      setState(() {
                        t_menginap = value!;
                      });
                    }),
                Text(
                  "Menginap",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: t_warnen,
                    onChanged: (value) {
                      setState(() {
                        t_warnen = value!;
                      });
                    }),
                Text(
                  "Pulang-pergi / Warnen",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Keterangan Lain',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text(
              '(bisa memilih lebih dari 1)',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 22, 15, 41),
                fontSize: 12,
              )),
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: l_hewan,
                    onChanged: (value) {
                      setState(() {
                        l_hewan = value!;
                      });
                    }),
                Expanded(
                  child: Text(
                    "Tidak takut hewan",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: l_mperj,
                    onChanged: (value) {
                      setState(() {
                        l_mperj = value!;
                      });
                    }),
                Text(
                  "Tidak Mabuk perjalanan",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: l_masak,
                    onChanged: (value) {
                      setState(() {
                        l_masak = value!;
                      });
                    }),
                Text(
                  "Memasak",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: l_spdmotor,
                    onChanged: (value) {
                      setState(() {
                        l_spdmotor = value!;
                      });
                    }),
                Text(
                  "Menyetir sepeda motor",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: l_mobil,
                    onChanged: (value) {
                      setState(() {
                        l_mobil = value!;
                      });
                    }),
                Text(
                  "Menyetir mobil",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (beratctr.text != "" &&
                              tinggictr.text != "" &&
                              pendidikanctr.text != "" &&
                              agama != "" &&
                              t_menginap == true ||
                          t_warnen == true) {
                        addToGlobal();
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  'Silahkan mengisi bagian yang diberi tanda *',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(int.parse(globals
                                                      .color_secondary)))),
                                        )),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      widget.konten == "edit"
                          ? "Ganti Informasi"
                          : "Selanjutnya",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Widget FormFieldTemplate(TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
      textCapitalization: TextCapitalization.characters,
      cursorColor: Color(int.parse(globals.color_primary)),
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 15, color: Colors.black)),
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
          ),
          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
    ),
  );
}
