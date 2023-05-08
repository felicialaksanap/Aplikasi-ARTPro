// ignore_for_file: sort_child_properties_last

import 'package:artpro_application_new/detailloker.dart';
import 'package:artpro_application_new/mainberanda.dart';
import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:artpro_application_new/tambahloker.dart';
import 'package:artpro_application_new/services/lokerservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import './global.dart' as globals;

class ListLoker extends StatefulWidget {
  const ListLoker({super.key});

  @override
  State<ListLoker> createState() => _ListLokerState();
}

class _ListLokerState extends State<ListLoker> {
  bool inapSelect = false;
  bool warnenSelect = false;
  double curLokasiVal = 0.0;
  bool prtSel = false;
  bool babySel = false;
  bool seniorSel = false;
  bool supirSel = false;
  bool officeSel = false;
  bool gardenerSel = false;
  bool petSelect = false;
  bool motorSel = false;
  bool mobilSel = false;
  bool maPerSel = false;
  bool masakSel = false;

  List<String> kriteria = [];
  String tempkriteria = "";

  List<Loker> listLokerUser = [];
  String kategori = "";

  TextEditingController alasanctr = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (globals.status_user == "majikan") {
      if (globals.idloker.isEmpty) {
        Loker.getDataLokerperUser(globals.iduser).then((value) {
          setState(() {
            listLokerUser = value;
            if (listLokerUser.isNotEmpty) {
              for (int i = 0; i < listLokerUser.length; i++) {
                globals.idloker.add(listLokerUser[i].idloker);
                globals.iduserloker.add(listLokerUser[i].iduser);
                globals.judulloker.add(listLokerUser[i].judulloker);
                globals.gajiawalloker.add(listLokerUser[i].gajiawal);
                globals.gajiakhirloker.add(listLokerUser[i].gajiakhir);
                globals.informasiloker.add(listLokerUser[i].informasi);
                globals.tugasloker.add(listLokerUser[i].tugas);
                globals.kriteria.add(listLokerUser[i].kriteria);
                globals.kprtloker.add(listLokerUser[i].kprt);
                globals.kbabysitterloker.add(listLokerUser[i].kbabysitter);
                globals.kseniorcareloker.add(listLokerUser[i].kseniorcare);
                globals.ksupirloker.add(listLokerUser[i].ksupir);
                globals.kofficeboyloker.add(listLokerUser[i].kofficeboy);
                globals.ktukangkebunloker.add(listLokerUser[i].ktukangkebun);
                globals.tglpost.add(listLokerUser[i].tglpost);
                globals.namamajikan.add(listLokerUser[i].namalengkap);
                globals.jeniskelaminloker.add(listLokerUser[i].jeniskelamin);
                globals.kecamatanloker.add(listLokerUser[i].kecamatan);
                globals.kotaloker.add(listLokerUser[i].kota);
                globals.expandloker.add(listLokerUser[i].expand);

                if (listLokerUser[i].kprt == "true") {
                  kategori = "prt";
                  if (listLokerUser[i].kbabysitter == "true") {
                    kategori = kategori + ", babysitter";
                    if (listLokerUser[i].kseniorcare == "true") {
                      kategori = kategori + ", seniorcare";
                    } else if (listLokerUser[i].ksupir == "true") {
                      kategori = kategori + ", supir";
                    } else if (listLokerUser[i].kofficeboy == "true") {
                      kategori = kategori + ", officeboy";
                    } else if (listLokerUser[i].ktukangkebun == "true") {
                      kategori = kategori + ", tukangkebun";
                    }
                  } else if (listLokerUser[i].kseniorcare == "true") {
                    kategori = kategori + ", seniorcare";
                    if (listLokerUser[i].ksupir == "true") {
                      kategori = kategori + ", supir";
                    } else if (listLokerUser[i].kofficeboy == "true") {
                      kategori = kategori + ", officeboy";
                    } else if (listLokerUser[i].ktukangkebun == "true") {
                      kategori = kategori + ", tukangkebun";
                    }
                  } else if (listLokerUser[i].ksupir == "true") {
                    kategori = kategori + ", supir";
                    if (listLokerUser[i].kofficeboy == "true") {
                      kategori = kategori + ", officeboy";
                    } else if (listLokerUser[i].ktukangkebun == "true") {
                      kategori = kategori + ", tukangkebun";
                    }
                  } else if (listLokerUser[i].kofficeboy == "true") {
                    kategori = kategori + ", officeboy";
                    if (listLokerUser[i].ktukangkebun == "true") {
                      kategori = kategori + ", tukangkebun";
                    }
                  } else if (listLokerUser[i].ktukangkebun == "true") {
                    kategori = kategori + ", tukangkebun";
                  }
                } else if (listLokerUser[i].kbabysitter == "true") {
                  kategori = "babysitter";
                } else if (listLokerUser[i].kseniorcare == "true") {
                  kategori = "seniorcare";
                } else if (listLokerUser[i].ksupir == "true") {
                  kategori = "supir";
                } else if (listLokerUser[i].kofficeboy == "true") {
                  kategori = "officeboy";
                } else if (listLokerUser[i].ktukangkebun == "true") {
                  kategori = "tukangkebun";
                }
                globals.kategori.add(kategori);
                kategori = "";
              }
            }
          });
        });
      }
    } else {
      for (int i = 0; i < MListLoker.isiListLoker.length; i++) {
        for (int j = 0; j < MListLoker.isiListLoker[i].kriteria.length; j++) {
          if (j != MListLoker.isiListLoker[i].kriteria.length - 1) {
            tempkriteria =
                tempkriteria + MListLoker.isiListLoker[i].kriteria[j] + ", ";
          } else {
            tempkriteria =
                tempkriteria + MListLoker.isiListLoker[i].kriteria[j];
          }
        }
        kriteria.add(tempkriteria);
        tempkriteria = "";
      }
    }
  }

  Future<void> addLokerSelesai(int index) async {
    var url = "${globals.urlapi}addlokerselesai";
    var response = await http.post(Uri.parse(url), body: {
      "idloker": globals.idloker[index],
      "iduser": globals.iduserloker[index],
      "judulloker": globals.judulloker[index],
      "gajiawal": globals.gajiawalloker[index],
      "gajiakhir": globals.gajiakhirloker[index],
      "informasi": globals.informasiloker[index],
      "tugas": globals.tugasloker[index],
      "kriteria": globals.kriteria[index],
      "kprt": globals.kprtloker[index],
      "kbabysitter": globals.kbabysitterloker[index],
      "kseniorcare": globals.kseniorcareloker[index],
      "ksupir": globals.ksupirloker[index],
      "kofficeboy": globals.kofficeboyloker[index],
      "ktukangkebun": globals.ktukangkebunloker[index],
      "tglpost": globals.tglpost[index],
      "alasan": alasanctr.text
    });
    if (response.statusCode == 200) {
      var url2 =
          "${globals.urlapi}deletelowongankerja?idloker=${int.parse(globals.idloker[index])}";
      var response2 =
          await http.delete(Uri.parse(url2), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      if (response2.statusCode == 200) {
        setState(() {
          globals.idloker.removeAt(index);
          globals.iduserloker.removeAt(index);
          globals.judulloker.removeAt(index);
          globals.gajiawalloker.removeAt(index);
          globals.gajiakhirloker.removeAt(index);
          globals.informasiloker.removeAt(index);
          globals.tugasloker.removeAt(index);
          globals.kriteria.removeAt(index);
          globals.kprtloker.removeAt(index);
          globals.kbabysitterloker.removeAt(index);
          globals.kseniorcareloker.removeAt(index);
          globals.ksupirloker.removeAt(index);
          globals.kofficeboyloker.removeAt(index);
          globals.ktukangkebunloker.removeAt(index);
          globals.tglpost.removeAt(index);
          globals.namamajikan.removeAt(index);
          globals.jeniskelaminloker.removeAt(index);
          globals.kecamatanloker.removeAt(index);
          globals.kotaloker.removeAt(index);
          globals.expandloker.removeAt(index);
          alasanctr.text = "";
        });
        Navigator.pop(context);
      }
    }
  }

  void arrangeData(int index) {
    String tugas = "";
    String kriteria = "";
    setState(() {
      globals.stringtugas.clear();
      // arrange tugas loker
      for (int i = 0; i < globals.tugasloker[index].length; i++) {
        if (globals.tugasloker[index][i] == "." &&
            globals.tugasloker[index][i + 1] == " ") {
          globals.stringtugas.add(tugas);
        } else if (globals.tugasloker[index][i] == " " &&
            globals.tugasloker[index][i - 1] == ".") {
          tugas = "";
        } else if (i == globals.tugasloker[index].length - 1) {
          tugas = tugas + globals.tugasloker[index][i];
          globals.stringtugas.add(tugas);
          tugas = "";
        } else {
          tugas = tugas + globals.tugasloker[index][i];
        }
      }

      globals.stringkriteria.clear();
      // arrange kriteria
      for (int i = 0; i < globals.kriteria[index].length; i++) {
        if (globals.kriteria[index][i] == "," &&
            globals.kriteria[index][i + 1] == " ") {
          globals.stringkriteria.add(kriteria);
        } else if (globals.kriteria[index][i] == " " &&
            globals.kriteria[index][i - 1] == ",") {
          kriteria = "";
        } else if (i == globals.kriteria[index].length - 1) {
          kriteria = kriteria + globals.kriteria[index][i];
          globals.stringkriteria.add(kriteria);
          kriteria = "";
        } else {
          kriteria = kriteria + globals.kriteria[index][i];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Color(int.parse(globals.color_primary))),
          leading: IconButton(
              onPressed: () {
                setState(() {
                  globals.idloker.clear();
                  globals.iduserloker.clear();
                  globals.judulloker.clear();
                  globals.gajiawalloker.clear();
                  globals.gajiakhirloker.clear();
                  globals.informasiloker.clear();
                  globals.tugasloker.clear();
                  globals.kriteria.clear();
                  globals.kprtloker.clear();
                  globals.kbabysitterloker.clear();
                  globals.kseniorcareloker.clear();
                  globals.ksupirloker.clear();
                  globals.kofficeboyloker.clear();
                  globals.ktukangkebunloker.clear();
                  globals.tglpost.clear();
                  globals.namamajikan.clear();
                  globals.jeniskelaminloker.clear();
                  globals.kecamatanloker.clear();
                  globals.kotaloker.clear();
                  globals.expandloker.clear();
                  globals.kategori.clear();
                  globals.stringtugas.clear();
                  globals.stringkriteria.clear();
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainBeranda()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(int.parse(globals.color_primary)),
              )),
          title: globals.status_user == "majikan"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/logo_theme.png',
                      width: 100,
                    ),
                  ],
                )
              : Container(),
          actions: [
            globals.status_user == "pekerja"
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Builder(builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.filter_list_alt),
                            Text(
                              'Filter',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(
                                          int.parse(globals.color_primary)),
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      );
                    }),
                  )
                : Container()
          ],
        ),
        endDrawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      color: Color(int.parse(globals.color_primary)),
                    ),
                    Positioned(
                      right: 0,
                      top: 5,
                      child: Image.asset(
                        'assets/images/logo_light.png',
                        height: 110,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Jenis Bekerja",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          inapSelect = !inapSelect;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: inapSelect
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: inapSelect ? 2 : 1)),
                        child: Text("Menginap",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          warnenSelect = !warnenSelect;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: warnenSelect
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: warnenSelect ? 2 : 1)),
                        child: Text("Warnen",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    )
                  ],
                ),
                Visibility(
                    visible: warnenSelect == true ? true : false,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Jarak Lokasi",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "0 km",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              Text(
                                "5.250 km",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              valueIndicatorColor:
                                  Color(int.parse(globals.color_secondary)),
                              valueIndicatorTextStyle: GoogleFonts.poppins(
                                  textStyle:
                                      const TextStyle(color: Colors.white))),
                          child: Slider(
                              value: curLokasiVal,
                              max: 5250,
                              divisions: 10,
                              activeColor:
                                  Color(int.parse(globals.color_primary)),
                              thumbColor:
                                  Color(int.parse(globals.color_primary)),
                              inactiveColor: const Color(0x1A246A73),
                              label: curLokasiVal.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  curLokasiVal = value;
                                });
                              }),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Range Gaji(Rp)",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 30,
                      child: TextField(
                        cursorColor: Color(int.parse(globals.color_primary)),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: 'Min',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 217, 217, 217)),
                            ),
                            contentPadding: const EdgeInsets.only(top: 2)),
                      ),
                    ),
                    Text(
                      "  -  ",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      width: 130,
                      height: 30,
                      child: TextField(
                        cursorColor: Color(int.parse(globals.color_primary)),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: 'Max',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 217, 217, 217)),
                            ),
                            contentPadding: const EdgeInsets.only(top: 2)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Kategori",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            prtSel = !prtSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: prtSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: prtSel ? 2 : 1)),
                          child: Text("Pekerja Rumah Tangga",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            babySel = !babySel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: babySel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: babySel ? 2 : 1)),
                          child: Text("Baby Sitter",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            seniorSel = !seniorSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: seniorSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: seniorSel ? 2 : 1)),
                          child: Text("Penjaga Lansia",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            supirSel = !supirSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: supirSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: supirSel ? 2 : 1)),
                          child: Text("Supir Pribadi",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            officeSel = !officeSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: officeSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: officeSel ? 2 : 1)),
                          child: Text("Office Boy / Girl",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gardenerSel = !gardenerSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: gardenerSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: gardenerSel ? 2 : 1)),
                          child: Text("Tukang Kebun",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Lain - Lain",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        petSelect = !petSelect;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: petSelect
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: petSelect ? 2 : 1)),
                      child: Text("Tidak Takut Hewan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        motorSel = !motorSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: motorSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: motorSel ? 2 : 1)),
                      child: Text("Menyetir Sepeda Motor",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mobilSel = !mobilSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: mobilSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: mobilSel ? 2 : 1)),
                      child: Text("Menyetir Mobil",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maPerSel = !maPerSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: maPerSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: maPerSel ? 2 : 1)),
                      child: Text("Tidak Mabuk Perjalanan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        masakSel = !masakSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: masakSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: masakSel ? 2 : 1)),
                      child: Text("Memasak",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: globals.status_user == "pekerja" ? false : true,
                child: Text(
                  "Lowongan kerja yang anda buka :",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: globals.idloker.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              arrangeData(index);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailLoker(
                                            index: index,
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              elevation: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          globals.judulloker[index],
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(int.parse(
                                                      globals.color_primary)))),
                                        ),
                                        Visibility(
                                            visible:
                                                globals.status_user == "majikan"
                                                    ? true
                                                    : false,
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.create_rounded,
                                                    color: Color(int.parse(
                                                        globals.color_primary)),
                                                  ),
                                                  onPressed: () {
                                                    arrangeData(index);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    TambahLoker(
                                                                      konten:
                                                                          "edit",
                                                                      index:
                                                                          index,
                                                                    )));
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Color(int.parse(
                                                        globals
                                                            .color_secondary)),
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    "Berikan alasan kenapa menghapus lowongan kerja ini?",
                                                                    style: GoogleFonts.poppins(
                                                                        textStyle: const TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500)),
                                                                  ),
                                                                ),
                                                                IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  icon: Icon(
                                                                    Icons
                                                                        .cancel_outlined,
                                                                    color: Color(
                                                                        int.parse(
                                                                            globals.color_secondary)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            content: Container(
                                                              child: TextField(
                                                                controller:
                                                                    alasanctr,
                                                                cursorColor: Color(
                                                                    int.parse(
                                                                        globals
                                                                            .color_primary)),
                                                                style: GoogleFonts.poppins(
                                                                    textStyle: const TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black)),
                                                                decoration:
                                                                    const InputDecoration(
                                                                        enabledBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Color.fromARGB(255, 138, 138, 138),
                                                                              width: 1.0),
                                                                        ),
                                                                        focusedBorder:
                                                                            OutlineInputBorder(
                                                                          borderSide: BorderSide(
                                                                              color: Color.fromARGB(255, 138, 138, 138),
                                                                              width: 1.0),
                                                                        ),
                                                                        hintText:
                                                                            "alasan ...",
                                                                        contentPadding: EdgeInsets.fromLTRB(
                                                                            8,
                                                                            4,
                                                                            8,
                                                                            4)),
                                                                maxLines: 5,
                                                              ),
                                                            ),
                                                            actions: [
                                                              Center(
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    addLokerSelesai(
                                                                        index);
                                                                  },
                                                                  child: Text(
                                                                    "Hapus Lowongan Kerja",
                                                                    style: GoogleFonts.poppins(
                                                                        textStyle: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color: Color(int.parse(globals.color_secondary)))),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          );
                                                        });
                                                    // addLokerSelesai(index);
                                                  },
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    Text(
                                      globals.jeniskelaminloker[index] == "P"
                                          ? "Ibu ${globals.namamajikan[index]}"
                                          : "Bapak ${globals.namamajikan[index]}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${globals.kecamatanloker[index]}, ${globals.kotaloker[index]} | 5,3 km",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                    Text(
                                      "Rp ${globals.gajiawalloker[index]} - ${globals.gajiakhirloker[index]} per bulan",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${globals.informasiloker[index]}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 13,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Post pada ${globals.tglpost[index]}",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black)),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                globals.expandloker[index] =
                                                    !globals.expandloker[index];
                                              });
                                            },
                                            icon: globals.expandloker[index] ==
                                                    false
                                                ? Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: Color(int.parse(
                                                        globals.color_primary)),
                                                  )
                                                : Icon(
                                                    Icons
                                                        .keyboard_arrow_up_rounded,
                                                    color: Color(int.parse(
                                                        globals.color_primary)),
                                                  ))
                                      ],
                                    ),
                                    Visibility(
                                        visible:
                                            globals.expandloker[index] == true
                                                ? true
                                                : false,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Kriteria",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              globals.kriteria[index],
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13)),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Kategori Pekerjaan",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              globals.kategori[index],
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(int.parse(
                                                          globals
                                                              .color_primary)))),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: globals.status_user == "pekerja" ? false : true,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TambahLoker(
                            konten: "tambah",
                            index: 0,
                          )));
            },
            backgroundColor: Color(int.parse(globals.color_primary)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
        ));
  }
}
