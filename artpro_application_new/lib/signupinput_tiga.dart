// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:artpro_application_new/intro_verif.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import './global.dart' as globals;

class SignUpInputT extends StatefulWidget {
  String konten = "";
  SignUpInputT({super.key, required this.konten});

  @override
  State<SignUpInputT> createState() => _SignUpInputTState();
}

class _SignUpInputTState extends State<SignUpInputT> {
  bool k_prt = false;
  bool k_bs = false;
  bool k_sc = false; // senior care
  bool k_supir = false;
  bool k_obog = false;
  bool k_tk = false;
  int count = 0;

  TextEditingController expctr = TextEditingController();
  TextEditingController mingajictr = TextEditingController();
  TextEditingController maxgajictr = TextEditingController();

  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    expctr.dispose();
    mingajictr.dispose();
    maxgajictr.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.konten == "edit") {
      k_prt = globals.kprt == "false" ? false : true;
      k_bs = globals.kbabysitter == "false" ? false : true;
      k_sc = globals.kseniorcare == "false" ? false : true;
      k_supir = globals.ksupir == "false" ? false : true;
      k_obog = globals.kofficeboy == "false" ? false : true;
      k_tk = globals.ktukangkebun == "false" ? false : true;
      expctr.text = globals.pengalaman;
      mingajictr.text = globals.gajiawal;
      maxgajictr.text = globals.gajiakhir;

      if (k_prt == true) {
        count++;
      }
      if (k_bs == true) {
        count++;
      }
      if (k_sc == true) {
        count++;
      }
      if (k_supir == true) {
        count++;
      }
      if (k_obog == true) {
        count++;
      }
      if (k_tk == true) {
        count++;
      }
    }
  }

  void addToGlobal() async {
    setState(() {
      globals.kprt = k_prt.toString();
      globals.kbabysitter = k_bs.toString();
      globals.kseniorcare = k_sc.toString();
      globals.ksupir = k_supir.toString();
      globals.kofficeboy = k_obog.toString();
      globals.ktukangkebun = k_tk.toString();
      globals.pengalaman = expctr.text;
      globals.gajiawal = mingajictr.text;
      globals.gajiakhir = maxgajictr.text;
    });

    if (widget.konten == "daftar") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const IntroVerifikasi()));
    } else {
      var url = "${globals.urlapi}edituserdetailkerjaart";
      var response = await http.put(Uri.parse(url), body: {
        "iduser": globals.iduser,
        "kprt": globals.kprt,
        "kbabysitter": globals.kbabysitter,
        "kseniorcare": globals.kseniorcare,
        "ksupir": globals.ksupir,
        "kofficeboy": globals.kofficeboy,
        "ktukangkebun": globals.ktukangkebun,
        "pengalaman": globals.pengalaman,
        "gajiawal": globals.gajiawal,
        "gajiakhir": globals.gajiakhir
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
          "Form Data Diri",
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
                Text(
                  'Kategori pekerjaan',
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
                    value: k_prt,
                    onChanged: count > 2 && k_prt == false
                        ? null
                        : (value) {
                            setState(() {
                              k_prt = value!;
                              if (k_prt == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Expanded(
                  child: Text(
                    "Pembantu Rumah Tangga",
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
                    value: k_bs,
                    onChanged: count > 2 && k_bs == false
                        ? null
                        : (value) {
                            setState(() {
                              k_bs = value!;
                              if (k_bs == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Baby Sitter",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_sc,
                    onChanged: count > 2 && k_sc == false
                        ? null
                        : (value) {
                            setState(() {
                              k_sc = value!;
                              if (k_sc == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Pendamping Lansia",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_supir,
                    onChanged: count > 2 && k_supir == false
                        ? null
                        : (value) {
                            setState(() {
                              k_supir = value!;
                              if (k_supir == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Supir Pribadi",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_obog,
                    onChanged: count > 2 && k_obog == false
                        ? null
                        : (value) {
                            setState(() {
                              k_obog = value!;
                              if (k_obog == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Office Boy/Office Girl",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_tk,
                    onChanged: count > 2 && k_tk == false
                        ? null
                        : (value) {
                            setState(() {
                              k_tk = value!;
                              if (k_tk == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Tukang Kebun",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Ceritakan pengalaman kerja anda!',
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
            Container(
              child: TextField(
                controller: expctr,
                cursorColor: Color(int.parse(globals.color_primary)),
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.black)),
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 138, 138, 138),
                          width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 138, 138, 138),
                          width: 1.0),
                    ),
                    hintText: "Ceritakan pengalaman di sini ....",
                    contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                maxLines: 7,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Berapa gaji yang diinginkan?',
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
              children: [
                Text(
                  'Rp',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          controller: mingajictr,
                          cursorColor: Color(int.parse(globals.color_primary)),
                          keyboardType: TextInputType.number,
                          onChanged: (string) {
                            string =
                                '${_formatNumber(string.replaceAll(',', ''))}';
                            mingajictr.value = TextEditingValue(
                              text: string,
                              selection: TextSelection.collapsed(
                                  offset: string.length),
                            );
                          },
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 138, 138, 138),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 138, 138, 138),
                                    width: 1.0),
                              ),
                              hintText: "3,500,000",
                              contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '-',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: TextField(
                          controller: maxgajictr,
                          cursorColor: Color(int.parse(globals.color_primary)),
                          keyboardType: TextInputType.number,
                          onChanged: (string) {
                            string =
                                '${_formatNumber(string.replaceAll(',', ''))}';
                            maxgajictr.value = TextEditingValue(
                              text: string,
                              selection: TextSelection.collapsed(
                                  offset: string.length),
                            );
                          },
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 138, 138, 138),
                                    width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 138, 138, 138),
                                    width: 1.0),
                              ),
                              hintText: "5,500,000",
                              contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                )
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
                      if (k_prt == true ||
                          k_bs == true ||
                          k_sc == true ||
                          k_supir == true ||
                          k_obog == true ||
                          k_tk == true) {
                        if (expctr.text != "" &&
                            mingajictr.text != "" &&
                            maxgajictr.text != "") {
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
                                                    color: Color(int.parse(
                                                        globals
                                                            .color_secondary)))),
                                          )),
                                    )
                                  ],
                                );
                              });
                        }
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
