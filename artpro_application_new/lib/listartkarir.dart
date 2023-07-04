// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';
import './detailart.dart';

class ListARTKarir extends StatefulWidget {
  String konten;
  ListARTKarir({super.key, required this.konten});

  @override
  State<ListARTKarir> createState() => _ListARTKarirState();
}

class _ListARTKarirState extends State<ListARTKarir> {
  String tempkategori = "";
  String tempkriteria = "";

  List<String> kriteria = [];

  makingPhoneCall(String telephone) async {
    var url = Uri.parse("tel:$telephone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme:
            IconThemeData(color: Color(int.parse(globals.color_primary))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: globals.status_user == "majikan"
          ? Container(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: widget.konten == "pelamar"
                      ? globals.listDataPelamar.length
                      : globals.listDataKontakArt.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (widget.konten == "pelamar") {
                          await DataARTbyKategori.getDatabyId(globals
                                  .listDataPelamar[index].idart
                                  .toString())
                              .then((value) {
                            setState(() {
                              globals.listARTbyKategori.clear();
                              globals.listARTbyKategori = value;

                              for (int i = 0;
                                  i < globals.listARTbyKategori.length;
                                  i++) {
                                globals.listARTbyKategori[i].gajiawal =
                                    NumberFormat.decimalPatternDigits(
                                            locale: 'en-US', decimalDigits: 0)
                                        .format(int.parse(globals
                                            .listARTbyKategori[i].gajiawal));

                                globals.listARTbyKategori[i].gajiakhir =
                                    NumberFormat.decimalPatternDigits(
                                            locale: 'en-US', decimalDigits: 0)
                                        .format(int.parse(globals
                                            .listARTbyKategori[i].gajiakhir));

                                // arrange kategori to string
                                tempkategori = "";
                                if (globals.listARTbyKategori[i].kprt == 1) {
                                  tempkategori =
                                      tempkategori + "Pembantu Rumah Tangga, ";
                                }
                                if (globals.listARTbyKategori[i].kbabysitter ==
                                    1) {
                                  tempkategori = tempkategori + "Babysitter, ";
                                }
                                if (globals.listARTbyKategori[i].kseniorcare ==
                                    1) {
                                  tempkategori =
                                      tempkategori + "Pendamping Lansia, ";
                                }
                                if (globals.listARTbyKategori[i].ksupir == 1) {
                                  tempkategori = tempkategori + "Supir, ";
                                }
                                if (globals.listARTbyKategori[i].kofficeboy ==
                                    1) {
                                  tempkategori =
                                      tempkategori + "Office Boy / Girl, ";
                                }
                                if (globals.listARTbyKategori[i].ktukangkebun ==
                                    1) {
                                  tempkategori =
                                      tempkategori + "Tukang Kebun, ";
                                }
                                tempkategori = tempkategori.substring(
                                    0, tempkategori.length - 2);
                              }

                              globals.kriteria.clear();

                              if (globals.listARTbyKategori[0].hewan == 1) {
                                globals.kriteria.add("Tidak takut hewan");
                              }
                              if (globals.listARTbyKategori[0].masak == 1) {
                                globals.kriteria.add("Memasak");
                              }
                              if (globals.listARTbyKategori[0].mabukjalan ==
                                  1) {
                                globals.kriteria.add("Tidak mabuk perjalanan");
                              }
                              if (globals.listARTbyKategori[0].sepedamotor ==
                                  1) {
                                globals.kriteria.add("Menyetir sepeda motor");
                              }
                              if (globals.listARTbyKategori[0].mobil == 1) {
                                globals.kriteria.add("Menyetir mobil");
                              }
                              if (globals.listARTbyKategori[0].tkmenginap ==
                                  1) {
                                globals.kriteria.add("Menginap");
                              }
                              if (globals.listARTbyKategori[0].tkwarnen == 1) {
                                globals.kriteria.add("Warnen");
                              }
                              if (globals.listARTbyKategori[0].ssingle == 1) {
                                globals.kriteria.add("Belum menikah");
                              }
                              if (globals.listARTbyKategori[0].smarried == 1) {
                                globals.kriteria.add("Sudah menikah");
                              }
                            });
                          });
                        } else {
                          await DataARTbyKategori.getDatabyId(globals
                                  .listDataKontakArt[index].idart
                                  .toString())
                              .then((value) {
                            setState(() {
                              globals.listARTbyKategori.clear();
                              globals.listARTbyKategori = value;

                              for (int i = 0;
                                  i < globals.listARTbyKategori.length;
                                  i++) {
                                globals.listARTbyKategori[i].gajiawal =
                                    NumberFormat.decimalPatternDigits(
                                            locale: 'en-US', decimalDigits: 0)
                                        .format(int.parse(globals
                                            .listARTbyKategori[i].gajiawal));

                                globals.listARTbyKategori[i].gajiakhir =
                                    NumberFormat.decimalPatternDigits(
                                            locale: 'en-US', decimalDigits: 0)
                                        .format(int.parse(globals
                                            .listARTbyKategori[i].gajiakhir));

                                // arrange kategori to string
                                tempkategori = "";
                                if (globals.listARTbyKategori[i].kprt == 1) {
                                  tempkategori =
                                      tempkategori + "Pembantu Rumah Tangga, ";
                                }
                                if (globals.listARTbyKategori[i].kbabysitter ==
                                    1) {
                                  tempkategori = tempkategori + "Babysitter, ";
                                }
                                if (globals.listARTbyKategori[i].kseniorcare ==
                                    1) {
                                  tempkategori =
                                      tempkategori + "Pendamping Lansia, ";
                                }
                                if (globals.listARTbyKategori[i].ksupir == 1) {
                                  tempkategori = tempkategori + "Supir, ";
                                }
                                if (globals.listARTbyKategori[i].kofficeboy ==
                                    1) {
                                  tempkategori =
                                      tempkategori + "Office Boy / Girl, ";
                                }
                                if (globals.listARTbyKategori[i].ktukangkebun ==
                                    1) {
                                  tempkategori =
                                      tempkategori + "Tukang Kebun, ";
                                }
                                tempkategori = tempkategori.substring(
                                    0, tempkategori.length - 2);
                              }

                              globals.kriteria.clear();

                              if (globals.listARTbyKategori[0].hewan == 1) {
                                globals.kriteria.add("Tidak takut hewan");
                              }
                              if (globals.listARTbyKategori[0].masak == 1) {
                                globals.kriteria.add("Memasak");
                              }
                              if (globals.listARTbyKategori[0].mabukjalan ==
                                  1) {
                                globals.kriteria.add("Tidak mabuk perjalanan");
                              }
                              if (globals.listARTbyKategori[0].sepedamotor ==
                                  1) {
                                globals.kriteria.add("Menyetir sepeda motor");
                              }
                              if (globals.listARTbyKategori[0].mobil == 1) {
                                globals.kriteria.add("Menyetir mobil");
                              }
                              if (globals.listARTbyKategori[0].tkmenginap ==
                                  1) {
                                globals.kriteria.add("Menginap");
                              }
                              if (globals.listARTbyKategori[0].tkwarnen == 1) {
                                globals.kriteria.add("Warnen");
                              }
                              if (globals.listARTbyKategori[0].ssingle == 1) {
                                globals.kriteria.add("Belum menikah");
                              }
                              if (globals.listARTbyKategori[0].smarried == 1) {
                                globals.kriteria.add("Sudah menikah");
                              }
                            });
                          });
                        }

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
                            borderRadius: BorderRadius.circular(20.0)),
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
                                                BorderRadius.circular(50.0),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  widget.konten == "pelamar"
                                                      ? '${globals.urlapi}getimage?id=${globals.listDataPelamar[index].idart}&folder=profpic'
                                                      : '${globals.urlapi}getimage?id=${globals.listDataKontakArt[index].idart}&folder=profpic',
                                                ),
                                                fit: BoxFit.fill)),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        width: 40,
                                        padding: const EdgeInsets.all(2.0),
                                        decoration: BoxDecoration(
                                            color: Color(int.parse(
                                                globals.color_primary)),
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Text(
                                          widget.konten == "pelamar"
                                              ? globals
                                                  .listDataPelamar[index].rating
                                                  .toString()
                                              : globals.listDataKontakArt[index]
                                                  .rating
                                                  .toString(),
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          )),
                                          textAlign: TextAlign.center,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.konten == "pelamar"
                                          ? globals.listDataPelamar[index]
                                              .namalengkap
                                          : globals.listDataKontakArt[index]
                                              .namalengkap,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(
                                      widget.konten == "pelamar"
                                          ? "${globals.listDataPelamar[index].umur} tahun | ${globals.listDataPelamar[index].kategori}"
                                          : "${globals.listDataKontakArt[index].umur} tahun | ${globals.listDataKontakArt[index].kategori}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 14,
                                      )),
                                    ),
                                    Visibility(
                                        visible: widget.konten == "pelamar"
                                            ? true
                                            : false,
                                        child: Column(
                                          children: [
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
                                                              fontSize: 12)),
                                                ),
                                                Text(
                                                  globals.listDataPelamar[index]
                                                      .judulloker,
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black)),
                                                )
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (widget.konten == "pelamar") {
                                      makingPhoneCall(globals
                                          .listDataPelamar[index].telephone);
                                    } else {
                                      makingPhoneCall(globals
                                          .listDataKontakArt[index].telephone);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.call,
                                    size: 30,
                                    color:
                                        Color(int.parse(globals.color_primary)),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            )
          : Container(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: globals.listDataKontakMajikan.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        '${globals.urlapi}getimage?id=${globals.listDataKontakMajikan[index].idmajikan}&folder=profpic',
                                      ),
                                      fit: BoxFit.fill)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    globals.listDataKontakMajikan[index]
                                        .namalengkap,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "${globals.listDataKontakMajikan[index].kecamatan} | ${globals.listDataKontakMajikan[index].kota}",
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
                                      .listDataKontakMajikan[index].telephone);
                                },
                                icon: Icon(
                                  Icons.call,
                                  size: 30,
                                  color:
                                      Color(int.parse(globals.color_primary)),
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
    );
  }
}
