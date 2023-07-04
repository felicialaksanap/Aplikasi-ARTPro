// ignore_for_file: use_build_context_synchronously

import 'package:artpro_application_new/listartkarir.dart';
import 'package:artpro_application_new/listlokerkarir.dart';
import 'package:artpro_application_new/services/lokerservices.dart';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:developer';
import './global.dart' as globals;
import 'detailart.dart';
import 'detailloker.dart';
import 'modeltemp/modeltemp.dart';

class Karir extends StatefulWidget {
  const Karir({super.key});

  @override
  State<Karir> createState() => _KarirState();
}

class _KarirState extends State<Karir> {
  DateTime? date;
  DateTime curdate = DateTime.now();
  bool finishgetdata = true;

  String tempkategori = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (globals.status_user == "majikan") {
      getKontakART();
    } else if (globals.status_user == "pekerja") {
      getKontakMajikan();
    }
  }

  void getKontakMajikan() {
    DataKontakMajikan.getData(globals.iduser).then((value) {
      setState(() {
        globals.listDataKontakMajikan.clear();
        globals.listDataKontakMajikan = value;
      });
    });
    getLamaran();
  }

  void getLamaran() {
    DataLamaran.getData(globals.iduser).then((value) {
      setState(() {
        if (value.isNotEmpty) {
          globals.listDataLamaran.clear();
          globals.listDataLamaran = value;
        }

        finishgetdata = true;
      });
    });
  }

  void getKontakART() {
    int umur = curdate.year;
    String kategori = "";
    DataKontakART.getData(globals.iduser).then((value) {
      setState(() {
        if (value.isNotEmpty) {
          globals.listDataKontakArt.clear();
          globals.listDataKontakArt = value;

          for (int i = 0; i < globals.listDataKontakArt.length; i++) {
            date =
                convertStringToDate(globals.listDataKontakArt[i].tanggallahir);
            umur = umur - date!.year;

            if (globals.listDataKontakArt[i].kprt == 1) {
              kategori = kategori + "pembantu rumah tangga, ";
            }
            if (globals.listDataKontakArt[i].kbabysitter == 1) {
              kategori = kategori + "baby sitter, ";
            }
            if (globals.listDataKontakArt[i].kseniorcare == 1) {
              kategori = kategori + "penjaga lanjut usia, ";
            }
            if (globals.listDataKontakArt[i].ksupir == 1) {
              kategori = kategori + "supir, ";
            }
            if (globals.listDataKontakArt[i].kofficeboy == 1) {
              kategori = kategori + "office boy, ";
            }
            if (globals.listDataKontakArt[i].ktukangkebun == 1) {
              kategori = kategori + "tukang kebun, ";
            }
            kategori = kategori.substring(0, kategori.length - 2);

            globals.listDataKontakArt[i].umur = umur;
            globals.listDataKontakArt[i].kategori = kategori;

            umur = curdate.year;
            kategori = "";
          }
        }
      });
    });
    getPelamar();
  }

  void getPelamar() {
    int umur = curdate.year;
    String kategori = "";
    DataPelamar.getDataPelamar(globals.iduser).then((value) {
      setState(() {
        if (value.isNotEmpty) {
          globals.listDataPelamar.clear();
          globals.listDataPelamar = value;

          for (int i = 0; i < globals.listDataPelamar.length; i++) {
            date = convertStringToDate(globals.listDataPelamar[i].tanggallahir);
            umur = umur - date!.year;

            if (globals.listDataPelamar[i].kprt == 1) {
              kategori = kategori + "pembantu rumah tangga, ";
            }
            if (globals.listDataPelamar[i].kbabysitter == 1) {
              kategori = kategori + "baby sitter, ";
            }
            if (globals.listDataPelamar[i].kseniorcare == 1) {
              kategori = kategori + "penjaga lanjut usia, ";
            }
            if (globals.listDataPelamar[i].ksupir == 1) {
              kategori = kategori + "supir, ";
            }
            if (globals.listDataPelamar[i].kofficeboy == 1) {
              kategori = kategori + "office boy, ";
            }
            if (globals.listDataPelamar[i].ktukangkebun == 1) {
              kategori = kategori + "tukang kebun, ";
            }
            kategori = kategori.substring(0, kategori.length - 2);

            globals.listDataPelamar[i].umur = umur;
            globals.listDataPelamar[i].kategori = kategori;

            umur = curdate.year;
            kategori = "";
          }
        }

        finishgetdata = true;
      });
    });

    cekStatusPelamar();
  }

  void cekStatusPelamar() {
    int saveidx = 0;
    bool deletelist = false;
    Loker.getAllData().then((value) {
      setState(() {
        for (int i = 0; i < globals.listDataPelamar.length; i++) {
          log("idart ${globals.listDataPelamar[i].idart} - id loker: ${globals.listDataPelamar[i].idloker}");
        }
      });
    });
  }

  DateTime? convertStringToDate(String dateString) {
    try {
      var format = DateFormat('dd-MM-yyyy');
      return format.parse(dateString);
    } catch (e) {
      print('Error converting string to date: $e');
      return null;
    }
  }

  makingPhoneCall(String telephone) async {
    var url = Uri.parse("tel:$telephone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<http.Response> deletelamaran(String idlamaran, int index) async {
    var url = "${globals.urlapi}deletelamaran?idlamar=$idlamaran";
    var response = await http.delete(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      setState(() {
        globals.listDataLamaran.removeAt(index);
        Navigator.pop(context);
        log("idlamar: ${globals.listDataLamaran[index].idlamar}");
      });
    }

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: finishgetdata == false
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
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/logo_theme.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        globals.status_user == "majikan"
                            ? "Lihat Pelamar"
                            : "Lihat Lamaran",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                          onPressed: () {
                            if (globals.status_user == "majikan") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListARTKarir(
                                            konten: "pelamar",
                                          )));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ListLokerKarir()));
                            }
                          },
                          child: Text(
                            'Lihat Semua',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          ))
                    ],
                  ),
                  Visibility(
                      visible: globals.status_user == "majikan" ? true : false,
                      child: globals.listDataPelamar.isNotEmpty
                          ? Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await DataARTbyKategori.getDatabyId(globals
                                            .listDataPelamar[0].idart
                                            .toString())
                                        .then((value) {
                                      setState(() {
                                        globals.listARTbyKategori.clear();
                                        globals.listARTbyKategori = value;

                                        for (int i = 0;
                                            i <
                                                globals
                                                    .listARTbyKategori.length;
                                            i++) {
                                          globals.listARTbyKategori[i]
                                                  .gajiawal =
                                              NumberFormat.decimalPatternDigits(
                                                      locale: 'en-US',
                                                      decimalDigits: 0)
                                                  .format(int.parse(globals
                                                      .listARTbyKategori[i]
                                                      .gajiawal));

                                          globals.listARTbyKategori[i]
                                                  .gajiakhir =
                                              NumberFormat.decimalPatternDigits(
                                                      locale: 'en-US',
                                                      decimalDigits: 0)
                                                  .format(int.parse(globals
                                                      .listARTbyKategori[i]
                                                      .gajiakhir));

                                          // arrange kategori to string
                                          tempkategori = "";
                                          if (globals
                                                  .listARTbyKategori[i].kprt ==
                                              1) {
                                            tempkategori = tempkategori +
                                                "Pembantu Rumah Tangga, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .kbabysitter ==
                                              1) {
                                            tempkategori =
                                                tempkategori + "Babysitter, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .kseniorcare ==
                                              1) {
                                            tempkategori = tempkategori +
                                                "Pendamping Lansia, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .ksupir ==
                                              1) {
                                            tempkategori =
                                                tempkategori + "Supir, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .kofficeboy ==
                                              1) {
                                            tempkategori = tempkategori +
                                                "Office Boy / Girl, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .ktukangkebun ==
                                              1) {
                                            tempkategori =
                                                tempkategori + "Tukang Kebun, ";
                                          }
                                          tempkategori = tempkategori.substring(
                                              0, tempkategori.length - 2);
                                        }

                                        globals.kriteria.clear();

                                        if (globals
                                                .listARTbyKategori[0].hewan ==
                                            1) {
                                          globals.kriteria
                                              .add("Tidak takut hewan");
                                        }
                                        if (globals
                                                .listARTbyKategori[0].masak ==
                                            1) {
                                          globals.kriteria.add("Memasak");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .mabukjalan ==
                                            1) {
                                          globals.kriteria
                                              .add("Tidak mabuk perjalanan");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .sepedamotor ==
                                            1) {
                                          globals.kriteria
                                              .add("Menyetir sepeda motor");
                                        }
                                        if (globals
                                                .listARTbyKategori[0].mobil ==
                                            1) {
                                          globals.kriteria
                                              .add("Menyetir mobil");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .tkmenginap ==
                                            1) {
                                          globals.kriteria.add("Menginap");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .tkwarnen ==
                                            1) {
                                          globals.kriteria.add("Warnen");
                                        }
                                        if (globals
                                                .listARTbyKategori[0].ssingle ==
                                            1) {
                                          globals.kriteria.add("Belum menikah");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .smarried ==
                                            1) {
                                          globals.kriteria.add("Sudah menikah");
                                        }
                                      });
                                    });

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailART(
                                                  index: 0,
                                                  kategori: tempkategori,
                                                  konten: "kontak",
                                                )));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              '${globals.urlapi}getimage?id=${globals.listDataPelamar[0].idart}&folder=profpic',
                                                            ),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    width: 40,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    decoration: BoxDecoration(
                                                        color: Color(int.parse(
                                                            globals
                                                                .color_primary)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                    child: Text(
                                                      globals.listDataPelamar[0]
                                                          .rating
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              textStyle:
                                                                  const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      )),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  globals.listDataPelamar[0]
                                                      .namalengkap,
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                ),
                                                Text(
                                                  "${globals.listDataPelamar[0].umur} thn | ${globals.listDataPelamar[0].kategori}",
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 14,
                                                  )),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "melamar: ",
                                                      style: GoogleFonts.poppins(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        globals
                                                            .listDataPelamar[0]
                                                            .judulloker,
                                                        style: GoogleFonts.poppins(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black)),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                makingPhoneCall(globals
                                                    .listDataPelamar[0]
                                                    .telephone);
                                              },
                                              icon: Icon(
                                                Icons.call,
                                                size: 30,
                                                color: Color(int.parse(
                                                    globals.color_primary)),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                globals.listDataPelamar.length != 1
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await DataARTbyKategori
                                                      .getDatabyId(globals
                                                          .listDataPelamar[1]
                                                          .idart
                                                          .toString())
                                                  .then((value) {
                                                setState(() {
                                                  globals.listARTbyKategori
                                                      .clear();
                                                  globals.listARTbyKategori =
                                                      value;

                                                  for (int i = 0;
                                                      i <
                                                          globals
                                                              .listARTbyKategori
                                                              .length;
                                                      i++) {
                                                    globals.listARTbyKategori[i]
                                                        .gajiawal = NumberFormat
                                                            .decimalPatternDigits(
                                                                locale: 'en-US',
                                                                decimalDigits:
                                                                    0)
                                                        .format(int.parse(globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .gajiawal));

                                                    globals.listARTbyKategori[i]
                                                        .gajiakhir = NumberFormat
                                                            .decimalPatternDigits(
                                                                locale: 'en-US',
                                                                decimalDigits:
                                                                    0)
                                                        .format(int.parse(globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .gajiakhir));

                                                    // arrange kategori to string
                                                    tempkategori = "";
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kprt ==
                                                        1) {
                                                      tempkategori = tempkategori +
                                                          "Pembantu Rumah Tangga, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kbabysitter ==
                                                        1) {
                                                      tempkategori =
                                                          tempkategori +
                                                              "Babysitter, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kseniorcare ==
                                                        1) {
                                                      tempkategori = tempkategori +
                                                          "Pendamping Lansia, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .ksupir ==
                                                        1) {
                                                      tempkategori =
                                                          tempkategori +
                                                              "Supir, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kofficeboy ==
                                                        1) {
                                                      tempkategori = tempkategori +
                                                          "Office Boy / Girl, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .ktukangkebun ==
                                                        1) {
                                                      tempkategori =
                                                          tempkategori +
                                                              "Tukang Kebun, ";
                                                    }
                                                    tempkategori =
                                                        tempkategori.substring(
                                                            0,
                                                            tempkategori
                                                                    .length -
                                                                2);
                                                  }

                                                  globals.kriteria.clear();

                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .hewan ==
                                                      1) {
                                                    globals.kriteria.add(
                                                        "Tidak takut hewan");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .masak ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Memasak");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .mabukjalan ==
                                                      1) {
                                                    globals.kriteria.add(
                                                        "Tidak mabuk perjalanan");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .sepedamotor ==
                                                      1) {
                                                    globals.kriteria.add(
                                                        "Menyetir sepeda motor");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .mobil ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Menyetir mobil");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .tkmenginap ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Menginap");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .tkwarnen ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Warnen");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .ssingle ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Belum menikah");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .smarried ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Sudah menikah");
                                                  }
                                                });
                                              });

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailART(
                                                            index: 0,
                                                            kategori:
                                                                tempkategori,
                                                            konten: "kontak",
                                                          )));
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              elevation: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 70,
                                                      height: 70,
                                                      child: Stack(
                                                        children: [
                                                          Center(
                                                            child: Container(
                                                              width: 60,
                                                              height: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                            '${globals.urlapi}getimage?id=${globals.listDataPelamar[1].idart}&folder=profpic',
                                                                          ),
                                                                          fit: BoxFit.fill)),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 0,
                                                            bottom: 0,
                                                            child: Container(
                                                              width: 40,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      int.parse(
                                                                          globals
                                                                              .color_primary)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0)),
                                                              child: Text(
                                                                globals
                                                                    .listDataPelamar[
                                                                        1]
                                                                    .rating
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        textStyle:
                                                                            const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            globals
                                                                .listDataPelamar[
                                                                    1]
                                                                .namalengkap,
                                                            style: GoogleFonts.poppins(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                          Text(
                                                            "${globals.listDataPelamar[1].umur} thn | ${globals.listDataPelamar[1].kategori}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    textStyle:
                                                                        const TextStyle(
                                                              fontSize: 14,
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                "melamar: ",
                                                                style: GoogleFonts.poppins(
                                                                    textStyle: const TextStyle(
                                                                        fontSize:
                                                                            12)),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  globals
                                                                      .listDataPelamar[
                                                                          1]
                                                                      .judulloker,
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.black)),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          makingPhoneCall(globals
                                                              .listDataPelamar[
                                                                  1]
                                                              .telephone);
                                                        },
                                                        icon: Icon(
                                                          Icons.call,
                                                          size: 30,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_primary)),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Container()
                              ],
                            )
                          : Center(
                              child: Text(
                                "Belum ada data",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ),
                            )),
                  Visibility(
                      visible: globals.status_user == "pekerja" ? true : false,
                      child: globals.listDataLamaran.isNotEmpty
                          ? Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        '${globals.urlapi}getimage?id=${globals.listDataLamaran[0].iduser}&folder=profpic'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    globals.listDataLamaran[0]
                                                        .judulloker,
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  ),
                                                  Text(
                                                    globals.listDataLamaran[0]
                                                        .namalengkap,
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                  ),
                                                  Text(
                                                    "${globals.listDataLamaran[0].kecamatan}, ${globals.listDataLamaran[0].kota}",
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 13,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        138,
                                                                        138,
                                                                        138))),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "waktu lamar: ${globals.listDataLamaran[0].waktulamar}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black)),
                                            ),
                                            ElevatedButton(
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
                                                                  "Apakah anda yakin ingin\n membatalkan lamaran?",
                                                                  style: GoogleFonts.poppins(
                                                                      textStyle: const TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w500)),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          actions: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Color(int.parse(globals
                                                                                .color_primary)),
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10))),
                                                                    child: Text(
                                                                      "Batal",
                                                                      style: GoogleFonts.poppins(
                                                                          textStyle: const TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500)),
                                                                    )),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      deletelamaran(
                                                                          globals
                                                                              .listDataLamaran[0]
                                                                              .idlamar
                                                                              .toString(),
                                                                          0);
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Color(int.parse(globals
                                                                                .color_secondary)),
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10))),
                                                                    child: Text(
                                                                      "Ya",
                                                                      style: GoogleFonts.poppins(
                                                                          textStyle: const TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w500)),
                                                                    ))
                                                              ],
                                                            )
                                                          ],
                                                        );
                                                      });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Color(
                                                        int.parse(globals
                                                            .color_primary)),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30))),
                                                child: Text(
                                                  "Batalkan lamaran",
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: Colors
                                                                  .white)),
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                globals.listDataLamaran.length != 1
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            elevation: 3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 60,
                                                        height: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  '${globals.urlapi}getimage?id=${globals.listDataLamaran[1].iduser}&folder=profpic'),
                                                              fit: BoxFit.fill),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              globals
                                                                  .listDataLamaran[
                                                                      1]
                                                                  .judulloker,
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                            ),
                                                            Text(
                                                              globals
                                                                  .listDataLamaran[
                                                                      1]
                                                                  .namalengkap,
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                            ),
                                                            Text(
                                                              "${globals.listDataLamaran[1].kecamatan}, ${globals.listDataLamaran[1].kota}",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          138,
                                                                          138,
                                                                          138))),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "waktu lamar: ${globals.listDataLamaran[1].waktulamar}",
                                                        style: GoogleFonts.poppins(
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        11,
                                                                    color: Colors
                                                                        .black)),
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "Apakah anda yakin ingin\n membatalkan lamaran?",
                                                                            style:
                                                                                GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    actions: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          ElevatedButton(
                                                                              onPressed: () {
                                                                                Navigator.pop(context);
                                                                              },
                                                                              style: ElevatedButton.styleFrom(backgroundColor: Color(int.parse(globals.color_primary)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                                              child: Text(
                                                                                "Batal",
                                                                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                                                              )),
                                                                          ElevatedButton(
                                                                              onPressed: () {
                                                                                deletelamaran(globals.listDataLamaran[1].idlamar.toString(), 1);
                                                                              },
                                                                              style: ElevatedButton.styleFrom(backgroundColor: Color(int.parse(globals.color_secondary)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                                              child: Text(
                                                                                "Ya",
                                                                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                                                              ))
                                                                        ],
                                                                      )
                                                                    ],
                                                                  );
                                                                });
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                                  Color(int.parse(
                                                                      globals
                                                                          .color_primary)),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30))),
                                                          child: Text(
                                                            "Batalkan lamaran",
                                                            style: GoogleFonts.poppins(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .white)),
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                              ],
                            )
                          : Center(
                              child: Text(
                                "Belum ada data",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 12)),
                              ),
                            )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          globals.status_user == "majikan"
                              ? "ART yang dikontak"
                              : "Lihat Kontak Majikan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            if (globals.status_user == "majikan") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListARTKarir(
                                            konten: "kontak",
                                          )));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListARTKarir(
                                            konten: "kontakmajikan",
                                          )));
                            }
                          },
                          child: Text(
                            'Lihat Semua',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          ))
                    ],
                  ),
                  Visibility(
                      visible: globals.status_user == "majikan" ? true : false,
                      child: globals.listDataKontakArt.isNotEmpty
                          ? Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await DataARTbyKategori.getDatabyId(globals
                                            .listDataKontakArt[0].idart
                                            .toString())
                                        .then((value) {
                                      setState(() {
                                        globals.listARTbyKategori.clear();
                                        globals.listARTbyKategori = value;

                                        for (int i = 0;
                                            i <
                                                globals
                                                    .listARTbyKategori.length;
                                            i++) {
                                          globals.listARTbyKategori[i]
                                                  .gajiawal =
                                              NumberFormat.decimalPatternDigits(
                                                      locale: 'en-US',
                                                      decimalDigits: 0)
                                                  .format(int.parse(globals
                                                      .listARTbyKategori[i]
                                                      .gajiawal));

                                          globals.listARTbyKategori[i]
                                                  .gajiakhir =
                                              NumberFormat.decimalPatternDigits(
                                                      locale: 'en-US',
                                                      decimalDigits: 0)
                                                  .format(int.parse(globals
                                                      .listARTbyKategori[i]
                                                      .gajiakhir));

                                          // arrange kategori to string
                                          tempkategori = "";
                                          if (globals
                                                  .listARTbyKategori[i].kprt ==
                                              1) {
                                            tempkategori = tempkategori +
                                                "Pembantu Rumah Tangga, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .kbabysitter ==
                                              1) {
                                            tempkategori =
                                                tempkategori + "Babysitter, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .kseniorcare ==
                                              1) {
                                            tempkategori = tempkategori +
                                                "Pendamping Lansia, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .ksupir ==
                                              1) {
                                            tempkategori =
                                                tempkategori + "Supir, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .kofficeboy ==
                                              1) {
                                            tempkategori = tempkategori +
                                                "Office Boy / Girl, ";
                                          }
                                          if (globals.listARTbyKategori[i]
                                                  .ktukangkebun ==
                                              1) {
                                            tempkategori =
                                                tempkategori + "Tukang Kebun, ";
                                          }
                                          tempkategori = tempkategori.substring(
                                              0, tempkategori.length - 2);
                                        }

                                        globals.kriteria.clear();

                                        if (globals
                                                .listARTbyKategori[0].hewan ==
                                            1) {
                                          globals.kriteria
                                              .add("Tidak takut hewan");
                                        }
                                        if (globals
                                                .listARTbyKategori[0].masak ==
                                            1) {
                                          globals.kriteria.add("Memasak");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .mabukjalan ==
                                            1) {
                                          globals.kriteria
                                              .add("Tidak mabuk perjalanan");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .sepedamotor ==
                                            1) {
                                          globals.kriteria
                                              .add("Menyetir sepeda motor");
                                        }
                                        if (globals
                                                .listARTbyKategori[0].mobil ==
                                            1) {
                                          globals.kriteria
                                              .add("Menyetir mobil");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .tkmenginap ==
                                            1) {
                                          globals.kriteria.add("Menginap");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .tkwarnen ==
                                            1) {
                                          globals.kriteria.add("Warnen");
                                        }
                                        if (globals
                                                .listARTbyKategori[0].ssingle ==
                                            1) {
                                          globals.kriteria.add("Belum menikah");
                                        }
                                        if (globals.listARTbyKategori[0]
                                                .smarried ==
                                            1) {
                                          globals.kriteria.add("Sudah menikah");
                                        }
                                      });
                                    });

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailART(
                                                  index: 0,
                                                  kategori: tempkategori,
                                                  konten: "kontak",
                                                )));
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    elevation: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 70,
                                            height: 70,
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              '${globals.urlapi}getimage?id=${globals.listDataKontakArt[0].idart}&folder=profpic',
                                                            ),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                ),
                                                Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    width: 40,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            2.0),
                                                    decoration: BoxDecoration(
                                                        color: Color(int.parse(
                                                            globals
                                                                .color_primary)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.0)),
                                                    child: Text(
                                                      globals
                                                          .listDataKontakArt[0]
                                                          .rating
                                                          .toString(),
                                                      style:
                                                          GoogleFonts.poppins(
                                                              textStyle:
                                                                  const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      )),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  globals.listDataKontakArt[0]
                                                      .namalengkap,
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                ),
                                                Text(
                                                  "${globals.listDataKontakArt[0].umur} tahun | ${globals.listDataKontakArt[0].kategori}",
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 14,
                                                  )),
                                                )
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                makingPhoneCall(globals
                                                    .listDataKontakArt[0]
                                                    .telephone);
                                              },
                                              icon: Icon(
                                                Icons.call,
                                                size: 30,
                                                color: Color(int.parse(
                                                    globals.color_primary)),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                globals.listDataKontakArt.length != 1
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              await DataARTbyKategori
                                                      .getDatabyId(globals
                                                          .listDataKontakArt[1]
                                                          .idart
                                                          .toString())
                                                  .then((value) {
                                                setState(() {
                                                  globals.listARTbyKategori
                                                      .clear();
                                                  globals.listARTbyKategori =
                                                      value;

                                                  for (int i = 0;
                                                      i <
                                                          globals
                                                              .listARTbyKategori
                                                              .length;
                                                      i++) {
                                                    globals.listARTbyKategori[i]
                                                        .gajiawal = NumberFormat
                                                            .decimalPatternDigits(
                                                                locale: 'en-US',
                                                                decimalDigits:
                                                                    0)
                                                        .format(int.parse(globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .gajiawal));

                                                    globals.listARTbyKategori[i]
                                                        .gajiakhir = NumberFormat
                                                            .decimalPatternDigits(
                                                                locale: 'en-US',
                                                                decimalDigits:
                                                                    0)
                                                        .format(int.parse(globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .gajiakhir));

                                                    // arrange kategori to string
                                                    tempkategori = "";
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kprt ==
                                                        1) {
                                                      tempkategori = tempkategori +
                                                          "Pembantu Rumah Tangga, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kbabysitter ==
                                                        1) {
                                                      tempkategori =
                                                          tempkategori +
                                                              "Babysitter, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kseniorcare ==
                                                        1) {
                                                      tempkategori = tempkategori +
                                                          "Pendamping Lansia, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .ksupir ==
                                                        1) {
                                                      tempkategori =
                                                          tempkategori +
                                                              "Supir, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .kofficeboy ==
                                                        1) {
                                                      tempkategori = tempkategori +
                                                          "Office Boy / Girl, ";
                                                    }
                                                    if (globals
                                                            .listARTbyKategori[
                                                                i]
                                                            .ktukangkebun ==
                                                        1) {
                                                      tempkategori =
                                                          tempkategori +
                                                              "Tukang Kebun, ";
                                                    }
                                                    tempkategori =
                                                        tempkategori.substring(
                                                            0,
                                                            tempkategori
                                                                    .length -
                                                                2);
                                                  }

                                                  globals.kriteria.clear();

                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .hewan ==
                                                      1) {
                                                    globals.kriteria.add(
                                                        "Tidak takut hewan");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .masak ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Memasak");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .mabukjalan ==
                                                      1) {
                                                    globals.kriteria.add(
                                                        "Tidak mabuk perjalanan");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .sepedamotor ==
                                                      1) {
                                                    globals.kriteria.add(
                                                        "Menyetir sepeda motor");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .mobil ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Menyetir mobil");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .tkmenginap ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Menginap");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .tkwarnen ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Warnen");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .ssingle ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Belum menikah");
                                                  }
                                                  if (globals
                                                          .listARTbyKategori[0]
                                                          .smarried ==
                                                      1) {
                                                    globals.kriteria
                                                        .add("Sudah menikah");
                                                  }
                                                });
                                              });

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailART(
                                                            index: 0,
                                                            kategori:
                                                                tempkategori,
                                                            konten: "kontak",
                                                          )));
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              elevation: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 70,
                                                      height: 70,
                                                      child: Stack(
                                                        children: [
                                                          Center(
                                                            child: Container(
                                                              width: 60,
                                                              height: 60,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                            '${globals.urlapi}getimage?id=${globals.listDataKontakArt[1].idart}&folder=profpic',
                                                                          ),
                                                                          fit: BoxFit.fill)),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            right: 0,
                                                            bottom: 0,
                                                            child: Container(
                                                              width: 40,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              decoration: BoxDecoration(
                                                                  color: Color(
                                                                      int.parse(
                                                                          globals
                                                                              .color_primary)),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20.0)),
                                                              child: Text(
                                                                globals
                                                                    .listDataKontakArt[
                                                                        1]
                                                                    .rating
                                                                    .toString(),
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                        textStyle:
                                                                            const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                )),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            globals
                                                                .listDataKontakArt[
                                                                    1]
                                                                .namalengkap,
                                                            style: GoogleFonts.poppins(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                          Text(
                                                            "${globals.listDataKontakArt[1].umur} tahun | ${globals.listDataKontakArt[1].kategori}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    textStyle:
                                                                        const TextStyle(
                                                              fontSize: 14,
                                                            )),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          makingPhoneCall(globals
                                                              .listDataKontakArt[
                                                                  1]
                                                              .telephone);
                                                        },
                                                        icon: Icon(
                                                          Icons.call,
                                                          size: 30,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_primary)),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Container()
                              ],
                            )
                          : Center(
                              child: Text(
                                "Belum ada data",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ),
                            )),
                  Visibility(
                      visible: globals.status_user == "pekerja" ? true : false,
                      child: globals.listDataKontakMajikan.isNotEmpty
                          ? Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  elevation: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    '${globals.urlapi}getimage?id=${globals.listDataKontakMajikan[0].idmajikan}&folder=profpic',
                                                  ),
                                                  fit: BoxFit.fill)),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                globals.listDataKontakMajikan[0]
                                                    .namalengkap,
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Text(
                                                "${globals.listDataKontakMajikan[0].kecamatan} | ${globals.listDataKontakMajikan[0].kota}",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                  fontSize: 14,
                                                )),
                                              )
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              makingPhoneCall(globals
                                                  .listDataKontakMajikan[0]
                                                  .telephone);
                                            },
                                            icon: Icon(
                                              Icons.call,
                                              size: 30,
                                              color: Color(int.parse(
                                                  globals.color_primary)),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                globals.listDataKontakMajikan.length != 1
                                    ? Column(
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            elevation: 3,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              '${globals.urlapi}getimage?id=${globals.listDataKontakMajikan[1].idmajikan}&folder=profpic',
                                                            ),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          globals
                                                              .listDataKontakMajikan[
                                                                  1]
                                                              .namalengkap,
                                                          style: GoogleFonts.poppins(
                                                              textStyle: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold)),
                                                        ),
                                                        Text(
                                                          "${globals.listDataKontakMajikan[1].kecamatan} | ${globals.listDataKontakMajikan[1].kota}",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  textStyle:
                                                                      const TextStyle(
                                                            fontSize: 14,
                                                          )),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        makingPhoneCall(globals
                                                            .listDataKontakMajikan[
                                                                1]
                                                            .telephone);
                                                      },
                                                      icon: Icon(
                                                        Icons.call,
                                                        size: 30,
                                                        color: Color(int.parse(
                                                            globals
                                                                .color_primary)),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    : Container(),
                              ],
                            )
                          : Center(
                              child: Text(
                                "Belum ada data",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 12)),
                              ),
                            )),
                ],
              ),
            ),
    );
  }
}
