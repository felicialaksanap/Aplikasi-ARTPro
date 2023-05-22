import 'package:artpro_application_new/customize/custom_slider_thumb_circle.dart';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'global.dart' as globals;

class Penilaian extends StatefulWidget {
  const Penilaian({super.key});

  @override
  State<Penilaian> createState() => _PenilaianState();
}

class _PenilaianState extends State<Penilaian> {
  DateTime date = DateTime.now();
  String tglpost = "";

  String pathsmile = "assets/icons/smile-green.png";
  String pathsmilealt = "assets/icons/smile-alt-green.png";
  String pathdis = "assets/icons/dis-green.png";

  int estval = 0;
  int etval = 0;
  int kebval = 0;
  int kecval = 0;
  int kerval = 0;
  double rating = 0.0;

  TextEditingController komenctr = TextEditingController();

  List<ProfileUser> profART = [];
  List<DetailKerjaART> detKerjaART = [];
  String kategori = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    komenctr.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ProfileUser.getData("2").then((value) {
      setState(() {
        profART.clear();
        profART = value;

        DetailKerjaART.getData("2").then((value) {
          setState(() {
            detKerjaART.clear();
            detKerjaART = value;

            if (detKerjaART[0].kprt == 1) {
              kategori = kategori + "Pembantu rumah tangga, ";
            }
            if (detKerjaART[0].kbabysitter == 1) {
              kategori = kategori + "Babysitter, ";
            }
            if (detKerjaART[0].kseniorcare == 1) {
              kategori = kategori + "Penjaga lansia, ";
            }
            if (detKerjaART[0].ksupir == 1) {
              kategori = kategori + "Supir, ";
            }
            if (detKerjaART[0].kofficeboy == 1) {
              kategori = kategori + "Office boy / girl, ";
            }
            if (detKerjaART[0].ktukangkebun == 1) {
              kategori = kategori + "Tukang kebun, ";
            }
            kategori = kategori.substring(0, kategori.length - 2);
          });
        });
      });
    });
  }

  void calculateRating() {
    setState(() {
      rating = (estval / 5) +
          (etval / 5) +
          (kebval / 5) +
          (kecval / 5) +
          (kerval / 5);
      tglpost = DateFormat('dd-MM-yyyy').format(date);
      addPenilaianToDatabase();
    });
  }

  void addPenilaianToDatabase() async {
    var url = "${globals.urlapi}addpenilaian";
    var response = await http.post(Uri.parse(url), body: {
      "idart": "2",
      "idmajikan": globals.iduser,
      "estetika": estval.toString(),
      "etika": etval.toString(),
      "kebersihan": kebval.toString(),
      "kecepatan": kecval.toString(),
      "kerapian": kerval.toString(),
      "rating": rating.toString(),
      "review": komenctr.text,
      "tglpost": tglpost
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
          "Penilaian",
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(color: Color(int.parse(globals.color_primary)))),
        ),
      ),
      body: profART.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Color(int.parse(globals.color_primary)),
                    strokeWidth: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Memuat data ...",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_primary)))),
                  )
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                                image: NetworkImage(
                                    '${globals.urlapi}getimage?id=${profART[0].iduser}&folder=profpic'),
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profART[0].namalengkap,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                          Text(
                            kategori,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromARGB(255, 138, 138, 138))),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Nilai per Indikator",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        " *",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15,
                                color:
                                    Color(int.parse(globals.color_secondary)))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Estetika",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 15)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "1",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              Radio(
                                  value: 1,
                                  groupValue: estval,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Color(
                                          int.parse(globals.color_primary))),
                                  onChanged: (value) {
                                    setState(() {
                                      estval = value!;
                                    });
                                  }),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "2",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              Radio(
                                  value: 2,
                                  groupValue: estval,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Color(
                                          int.parse(globals.color_primary))),
                                  onChanged: (value) {
                                    setState(() {
                                      estval = value!;
                                    });
                                  }),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "3",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              Radio(
                                  value: 3,
                                  groupValue: estval,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Color(
                                          int.parse(globals.color_primary))),
                                  onChanged: (value) {
                                    setState(() {
                                      estval = value!;
                                    });
                                  }),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "4",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              Radio(
                                  value: 4,
                                  groupValue: estval,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Color(
                                          int.parse(globals.color_primary))),
                                  onChanged: (value) {
                                    setState(() {
                                      estval = value!;
                                    });
                                  }),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "5",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              Radio(
                                  value: 5,
                                  groupValue: estval,
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => Color(
                                          int.parse(globals.color_primary))),
                                  onChanged: (value) {
                                    setState(() {
                                      estval = value!;
                                    });
                                  }),
                            ],
                          )
                        ],
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Etika",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 15)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: etval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  etval = value!;
                                });
                              }),
                          Radio(
                              value: 2,
                              groupValue: etval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  etval = value!;
                                });
                              }),
                          Radio(
                              value: 3,
                              groupValue: etval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  etval = value!;
                                });
                              }),
                          Radio(
                              value: 4,
                              groupValue: etval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  etval = value!;
                                });
                              }),
                          Radio(
                              value: 5,
                              groupValue: etval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  etval = value!;
                                });
                              }),
                        ],
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kebersihan",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 15)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: kebval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kebval = value!;
                                });
                              }),
                          Radio(
                              value: 2,
                              groupValue: kebval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kebval = value!;
                                });
                              }),
                          Radio(
                              value: 3,
                              groupValue: kebval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kebval = value!;
                                });
                              }),
                          Radio(
                              value: 4,
                              groupValue: kebval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kebval = value!;
                                });
                              }),
                          Radio(
                              value: 5,
                              groupValue: kebval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kebval = value!;
                                });
                              }),
                        ],
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kecepatan",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 15)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: kecval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kecval = value!;
                                });
                              }),
                          Radio(
                              value: 2,
                              groupValue: kecval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kecval = value!;
                                });
                              }),
                          Radio(
                              value: 3,
                              groupValue: kecval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kecval = value!;
                                });
                              }),
                          Radio(
                              value: 4,
                              groupValue: kecval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kecval = value!;
                                });
                              }),
                          Radio(
                              value: 5,
                              groupValue: kecval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kecval = value!;
                                });
                              }),
                        ],
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kerapian",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 15)),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: kerval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kerval = value!;
                                });
                              }),
                          Radio(
                              value: 2,
                              groupValue: kerval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kerval = value!;
                                });
                              }),
                          Radio(
                              value: 3,
                              groupValue: kerval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kerval = value!;
                                });
                              }),
                          Radio(
                              value: 4,
                              groupValue: kerval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kerval = value!;
                                });
                              }),
                          Radio(
                              value: 5,
                              groupValue: kerval,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  kerval = value!;
                                });
                              }),
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 1,
                    color: const Color.fromARGB(255, 138, 138, 138),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Komentar & Review",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        " *",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15,
                                color:
                                    Color(int.parse(globals.color_secondary)))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      controller: komenctr,
                      cursorColor: Color(int.parse(globals.color_primary)),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
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
                          hintText: "Tulis komentar & review di sini",
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
                            if (estval != 0 &&
                                etval != 0 &&
                                kebval != 0 &&
                                kecval != 0 &&
                                kerval != 0 &&
                                komenctr.text != "") {
                              calculateRating();
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color(int.parse(
                                                            globals
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
                            "Kirim Penilaian",
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
                  )
                ],
              ),
            ),
    );
  }
}
