// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'dart:convert';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';
import './detailart.dart';

class ListART extends StatefulWidget {
  String konten;
  ListART({super.key, required this.konten});

  @override
  State<ListART> createState() => _ListARTState();
}

class _ListARTState extends State<ListART> {
  bool inapSelect = false;
  bool warnenSelect = false;
  double curLokasiVal = 0.0;
  bool islamSel = false;
  bool katolikSel = false;
  bool kristenSel = false;
  bool hinduSel = false;
  bool budhaSel = false;
  bool konghucuSel = false;
  bool singleSel = false;
  bool marriedSel = false;
  bool petSelect = false;
  bool motorSel = false;
  bool mobilSel = false;
  bool maPerSel = false;
  bool masakSel = false;
  TextEditingController mingajictr = TextEditingController();
  TextEditingController maxgajictr = TextEditingController();

  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));

  List<String> kriteria = [];
  String tempkriteria = "";

  List<String> kategori = [];
  String tempkategori = "";

  String titlekategori = "";

  List<String> agama = [];
  String tempagama = "";

  bool getAlldata = false;

  List<HasilJarak> listJarak = [];
  List<DataARTbyFilter> listDatabyFilter = [];
  String params = "";

  int gajiawal = 0;
  int gajiakhir = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getListARTbyKategori();

    if (widget.konten == "prt") {
      titlekategori = "Pembantu Rumah Tangga";
    } else if (widget.konten == "babysitter") {
      titlekategori = "Baby Sitter";
    } else if (widget.konten == "seniorcare") {
      titlekategori = "Penjaga Lansia";
    } else if (widget.konten == "supir") {
      titlekategori = "Supir";
    } else if (widget.konten == "officeboy") {
      titlekategori = "Office Boy / Girl";
    } else if (widget.konten == "tukangkebun") {
      titlekategori = "Tukang Kebun";
    }
  }

  void getListARTbyKategori() {
    DataARTbyKategori.getData(widget.konten).then((value) {
      setState(() {
        globals.listARTbyKategori.clear();
        globals.listARTbyKategori = value;

        for (int i = 0; i < globals.listARTbyKategori.length; i++) {
          globals.listARTbyKategori[i].gajiawal =
              NumberFormat.decimalPatternDigits(
                      locale: 'en-US', decimalDigits: 0)
                  .format(int.parse(globals.listARTbyKategori[i].gajiawal));

          globals.listARTbyKategori[i].gajiakhir =
              NumberFormat.decimalPatternDigits(
                      locale: 'en-US', decimalDigits: 0)
                  .format(int.parse(globals.listARTbyKategori[i].gajiakhir));

          // arrange kategori to string
          if (globals.listARTbyKategori[i].kprt == 1) {
            tempkategori = tempkategori + "Pembantu Rumah Tangga, ";
          }
          if (globals.listARTbyKategori[i].kbabysitter == 1) {
            tempkategori = tempkategori + "Babysitter, ";
          }
          if (globals.listARTbyKategori[i].kseniorcare == 1) {
            tempkategori = tempkategori + "Pendamping Lansia, ";
          }
          if (globals.listARTbyKategori[i].ksupir == 1) {
            tempkategori = tempkategori + "Supir, ";
          }
          if (globals.listARTbyKategori[i].kofficeboy == 1) {
            tempkategori = tempkategori + "Office Boy / Girl, ";
          }
          if (globals.listARTbyKategori[i].ktukangkebun == 1) {
            tempkategori = tempkategori + "Tukang Kebun, ";
          }
          tempkategori = tempkategori.substring(0, tempkategori.length - 2);
          kategori.add(tempkategori);
          tempkategori = "";

          // arrange kriteria to string
          if (globals.listARTbyKategori[i].hewan == 1) {
            tempkriteria = tempkriteria + "Tidak takut hewan, ";
          }
          if (globals.listARTbyKategori[i].masak == 1) {
            tempkriteria = tempkriteria + "Memasak, ";
          }
          if (globals.listARTbyKategori[i].mabukjalan == 1) {
            tempkriteria = tempkriteria + "Tidak mabuk perjalanan, ";
          }
          if (globals.listARTbyKategori[i].sepedamotor == 1) {
            tempkriteria = tempkriteria + "Menyetir sepeda motor, ";
          }
          if (globals.listARTbyKategori[i].mobil == 1) {
            tempkriteria = tempkriteria + "Menyetir mobil, ";
          }
          if (globals.listARTbyKategori[i].tkmenginap == 1) {
            tempkriteria = tempkriteria + "Menginap, ";
          }
          if (globals.listARTbyKategori[i].tkwarnen == 1) {
            tempkriteria = tempkriteria + "Warnen, ";
          }
          if (globals.listARTbyKategori[i].ssingle == 1) {
            tempkriteria = tempkriteria + "Belum menikah, ";
          }
          if (globals.listARTbyKategori[i].smarried == 1) {
            tempkriteria = tempkriteria + "Sudah menikah, ";
          }
          tempkriteria = tempkriteria.substring(0, tempkriteria.length - 2);
          kriteria.add(tempkriteria);
          tempkriteria = "";

          // arange agama
          if (globals.listARTbyKategori[i].aislam == 1) {
            tempagama = "Islam";
          } else if (globals.listARTbyKategori[i].akatolik == 1) {
            tempagama = "Katolik";
          } else if (globals.listARTbyKategori[i].akristen == 1) {
            tempagama = "Kristen";
          } else if (globals.listARTbyKategori[i].ahindu == 1) {
            tempagama = "Hindu";
          } else if (globals.listARTbyKategori[i].abuddha == 1) {
            tempagama = "Buddha";
          } else if (globals.listARTbyKategori[i].akonghucu == 1) {
            tempagama = "Konghucu";
          }
          agama.add(tempagama);
          tempagama = "";
        }

        getAlldata = true;
      });
    });
  }

  makingPhoneCall(int index) async {
    // var whatsappUrl = Uri.parse(
    //     "https://api.whatsapp.com/send?phone=${globals.listARTbyKategori[index].telephone}");
    // if (await canLaunchUrl(whatsappUrl)) {
    //   await launchUrl(whatsappUrl);
    // } else {
    //   throw 'Could not launch $whatsappUrl';
    // }
    var url = Uri.parse("tel:${globals.listARTbyKategori[index].telephone}");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getListARTbyFilter(String param) {
    DataARTbyFilter.getData(param).then((value) {
      setState(() {
        listDatabyFilter.clear();
        listDatabyFilter = value;

        log("length: ${listDatabyFilter.length}");
        for (int i = 0; i < listDatabyFilter.length; i++) {
          log("id index: $i - ${listDatabyFilter[i].idart}");
          globals.listARTbyKategori[i].idart = listDatabyFilter[i].idart;
          globals.listARTbyKategori[i].namalengkap =
              listDatabyFilter[i].namalengkap;
          globals.listARTbyKategori[i].jeniskelamin =
              listDatabyFilter[i].jeniskelamin;
          globals.listARTbyKategori[i].tempatlahir =
              listDatabyFilter[i].tempatlahir;
          globals.listARTbyKategori[i].tanggallahir =
              listDatabyFilter[i].tanggallahir;
          globals.listARTbyKategori[i].tanggallahir =
              listDatabyFilter[i].tanggallahir;
          globals.listARTbyKategori[i].telephone =
              listDatabyFilter[i].telephone;
          globals.listARTbyKategori[i].pendidikan =
              listDatabyFilter[i].pendidikan;
          globals.listARTbyKategori[i].beratbadan =
              listDatabyFilter[i].beratbadan;
          globals.listARTbyKategori[i].tinggibadan =
              listDatabyFilter[i].tinggibadan;
          globals.listARTbyKategori[i].aislam = listDatabyFilter[i].aislam;
          globals.listARTbyKategori[i].akatolik = listDatabyFilter[i].akatolik;
          globals.listARTbyKategori[i].akristen = listDatabyFilter[i].akristen;
          globals.listARTbyKategori[i].ahindu = listDatabyFilter[i].ahindu;
          globals.listARTbyKategori[i].abuddha = listDatabyFilter[i].abuddha;
          globals.listARTbyKategori[i].akonghucu =
              listDatabyFilter[i].akonghucu;
          globals.listARTbyKategori[i].tkmenginap =
              listDatabyFilter[i].tkmenginap;
          globals.listARTbyKategori[i].tkwarnen = listDatabyFilter[i].tkwarnen;
          globals.listARTbyKategori[i].hewan = listDatabyFilter[i].hewan;
          globals.listARTbyKategori[i].mabukjalan =
              listDatabyFilter[i].mabukjalan;
          globals.listARTbyKategori[i].sepedamotor =
              listDatabyFilter[i].sepedamotor;
          globals.listARTbyKategori[i].mobil = listDatabyFilter[i].mobil;
          globals.listARTbyKategori[i].masak = listDatabyFilter[i].masak;
          globals.listARTbyKategori[i].ssingle = listDatabyFilter[i].ssingle;
          globals.listARTbyKategori[i].smarried = listDatabyFilter[i].smarried;
          globals.listARTbyKategori[i].kprt = listDatabyFilter[i].kprt;
          globals.listARTbyKategori[i].kbabysitter =
              listDatabyFilter[i].kbabysitter;
          globals.listARTbyKategori[i].kseniorcare =
              listDatabyFilter[i].kseniorcare;
          globals.listARTbyKategori[i].ksupir = listDatabyFilter[i].ksupir;
          globals.listARTbyKategori[i].kofficeboy =
              listDatabyFilter[i].kofficeboy;
          globals.listARTbyKategori[i].ktukangkebun =
              listDatabyFilter[i].ktukangkebun;
          globals.listARTbyKategori[i].gajiawal =
              NumberFormat.decimalPatternDigits(
                      locale: 'en-US', decimalDigits: 0)
                  .format(listDatabyFilter[i].gajiawal);
          globals.listARTbyKategori[i].gajiakhir =
              NumberFormat.decimalPatternDigits(
                      locale: 'en-US', decimalDigits: 0)
                  .format(listDatabyFilter[i].idart);
          globals.listARTbyKategori[i].rating = listDatabyFilter[i].rating;

          // arrange kategori to string
          if (globals.listARTbyKategori[i].kprt == 1) {
            tempkategori = tempkategori + "Pembantu Rumah Tangga, ";
          }
          if (globals.listARTbyKategori[i].kbabysitter == 1) {
            tempkategori = tempkategori + "Babysitter, ";
          }
          if (globals.listARTbyKategori[i].kseniorcare == 1) {
            tempkategori = tempkategori + "Pendamping Lansia, ";
          }
          if (globals.listARTbyKategori[i].ksupir == 1) {
            tempkategori = tempkategori + "Supir, ";
          }
          if (globals.listARTbyKategori[i].kofficeboy == 1) {
            tempkategori = tempkategori + "Office Boy / Girl, ";
          }
          if (globals.listARTbyKategori[i].ktukangkebun == 1) {
            tempkategori = tempkategori + "Tukang Kebun, ";
          }
          tempkategori = tempkategori.substring(0, tempkategori.length - 2);
          kategori[i] = tempkategori;
          tempkategori = "";

          // arrange kriteria to string
          if (globals.listARTbyKategori[i].hewan == 1) {
            tempkriteria = tempkriteria + "Tidak takut hewan, ";
          }
          if (globals.listARTbyKategori[i].masak == 1) {
            tempkriteria = tempkriteria + "Memasak, ";
          }
          if (globals.listARTbyKategori[i].mabukjalan == 1) {
            tempkriteria = tempkriteria + "Tidak mabuk perjalanan, ";
          }
          if (globals.listARTbyKategori[i].sepedamotor == 1) {
            tempkriteria = tempkriteria + "Menyetir sepeda motor, ";
          }
          if (globals.listARTbyKategori[i].mobil == 1) {
            tempkriteria = tempkriteria + "Menyetir mobil, ";
          }
          if (globals.listARTbyKategori[i].tkmenginap == 1) {
            tempkriteria = tempkriteria + "Menginap, ";
          }
          if (globals.listARTbyKategori[i].tkwarnen == 1) {
            tempkriteria = tempkriteria + "Warnen, ";
          }
          if (globals.listARTbyKategori[i].ssingle == 1) {
            tempkriteria = tempkriteria + "Belum menikah, ";
          }
          if (globals.listARTbyKategori[i].smarried == 1) {
            tempkriteria = tempkriteria + "Sudah menikah, ";
          }
          tempkriteria = tempkriteria.substring(0, tempkriteria.length - 2);
          kriteria[i] = tempkriteria;
          tempkriteria = "";

          // arange agama
          if (globals.listARTbyKategori[i].aislam == 1) {
            tempagama = "Islam";
          } else if (globals.listARTbyKategori[i].akatolik == 1) {
            tempagama = "Katolik";
          } else if (globals.listARTbyKategori[i].akristen == 1) {
            tempagama = "Kristen";
          } else if (globals.listARTbyKategori[i].ahindu == 1) {
            tempagama = "Hindu";
          } else if (globals.listARTbyKategori[i].abuddha == 1) {
            tempagama = "Buddha";
          } else if (globals.listARTbyKategori[i].akonghucu == 1) {
            tempagama = "Konghucu";
          }
          agama[i] = tempagama;
          tempagama = "";
        }
      });
    });
  }

  void calculateDistane(String param) async {
    String longlatmajikan = "";
    String longlatart = "";
    String longlatparam = "";
    String paramsmakeandcopy = "";
    var url = "${globals.urlapi}updatejarak";

    if (curLokasiVal != 0.0) {
      longlatmajikan =
          longlatmajikan + "${globals.longitude},${globals.latitude};";

      listJarak.clear();
      for (int i = 0; i < globals.listARTbyKategori.length; i++) {
        longlatart = longlatart +
            "${globals.listARTbyKategori[i].longitude},${globals.listARTbyKategori[i].latitude}";

        longlatparam = longlatmajikan + longlatart;

        await HasilJarak.getData(longlatparam).then((value) {
          listJarak.add(value);
          listJarak[i].idart = globals.listARTbyKategori[i].idart;

          listJarak[i].jarak = listJarak[i].jarak / 1000;
          listJarak[i].jarak =
              double.parse(listJarak[i].jarak.toStringAsFixed(1));
        });
        longlatart = "";
      }

      paramsmakeandcopy = paramsmakeandcopy +
          "kategori=${widget.konten}&idmajikan=${globals.iduser}";
      DataARTbyFilter.makeCopyTable(paramsmakeandcopy).then((value) {});

      for (int i = 0; i < listJarak.length; i++) {
        log("info: ${listJarak[i].idart} - ${listJarak[i].jarak}");
        var response = await http.put(Uri.parse(url), body: {
          "idmajikan": globals.iduser.toString(),
          "idart": listJarak[i].idart.toString(),
          "jarak": listJarak[i].jarak.toString()
        });
      }
    }

    getListARTbyFilter(param);
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
          actions: [
            Builder(builder: (BuildContext context) {
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
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              );
            }),
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
                                "10 km",
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
                              max: 10,
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
                        controller: mingajictr,
                        cursorColor: Color(int.parse(globals.color_primary)),
                        textAlign: TextAlign.center,
                        onChanged: (string) {
                          string =
                              '${_formatNumber(string.replaceAll(',', ''))}';
                          mingajictr.value = TextEditingValue(
                            text: string,
                            selection:
                                TextSelection.collapsed(offset: string.length),
                          );
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: '3,500,000',
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
                        controller: maxgajictr,
                        cursorColor: Color(int.parse(globals.color_primary)),
                        textAlign: TextAlign.center,
                        onChanged: (string) {
                          string =
                              '${_formatNumber(string.replaceAll(',', ''))}';
                          maxgajictr.value = TextEditingValue(
                            text: string,
                            selection:
                                TextSelection.collapsed(offset: string.length),
                          );
                        },
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: '5,000,000',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 217, 217, 217)),
                            ),
                            contentPadding: const EdgeInsets.only(top: 2)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      "Agama",
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
                          islamSel = !islamSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: islamSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: islamSel ? 2 : 1)),
                        child: Text("Islam",
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
                          katolikSel = !katolikSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: katolikSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: katolikSel ? 2 : 1)),
                        child: Text("Katolik",
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
                          kristenSel = !kristenSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: kristenSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: kristenSel ? 2 : 1)),
                        child: Text("Kristen",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    )
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
                          hinduSel = !hinduSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: hinduSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: hinduSel ? 2 : 1)),
                        child: Text("Hindu",
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
                          budhaSel = !budhaSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: budhaSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: budhaSel ? 2 : 1)),
                        child: Text("Buddha",
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
                          konghucuSel = !konghucuSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: konghucuSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: konghucuSel ? 2 : 1)),
                        child: Text("Konghucu",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
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
                      "Status Pernikahan",
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
                          singleSel = !singleSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: singleSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: singleSel ? 2 : 1)),
                        child: Text("Single",
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
                          marriedSel = !marriedSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: marriedSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: marriedSel ? 2 : 1)),
                        child: Text("Menikah",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    ),
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
                      "Kriteria",
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: BorderSide(
                                  width: 1,
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                          child: Text(
                            "Batal",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            var url = "";
                            String longlat = "";

                            setState(() {
                              params = "";
                              // getAlldata = false;

                              params = params +
                                  "kategori=${widget.konten}&idmajikan=${globals.iduser}&";

                              if (islamSel == false) {
                                params = params + "aislam=0&";
                              } else {
                                params = params + "aislam=1&";
                              }
                              if (katolikSel == false) {
                                params = params + "akatolik=0&";
                              } else {
                                params = params + "akatolik=1&";
                              }
                              if (kristenSel == false) {
                                params = params + "akristen=0&";
                              } else {
                                params = params + "akristen=1&";
                              }
                              if (hinduSel == false) {
                                params = params + "ahindu=0&";
                              } else {
                                params = params + "ahindu=1&";
                              }
                              if (budhaSel == false) {
                                params = params + "abuddha=0&";
                              } else {
                                params = params + "abuddha=1&";
                              }
                              if (konghucuSel == false) {
                                params = params + "akonghucu=0&";
                              } else {
                                params = params + "akonghucu=1&";
                              }

                              if (inapSelect == false) {
                                params = params + "tkmenginap=0&";
                              } else {
                                params = params + "tkmenginap=1&";
                              }
                              if (warnenSelect == false) {
                                params = params + "tkwarnen=0&";
                              } else {
                                params = params + "tkwarnen=1&";
                              }

                              if (petSelect == false) {
                                params = params + "hewan=0&";
                              } else {
                                params = params + "hewan=1&";
                              }
                              if (maPerSel == false) {
                                params = params + "mabukjalan=0&";
                              } else {
                                params = params + "mabukjalan=1&";
                              }
                              if (motorSel == false) {
                                params = params + "sepedamotor=0&";
                              } else {
                                params = params + "sepedamotor=1&";
                              }
                              if (mobilSel == false) {
                                params = params + "mobil=0&";
                              } else {
                                params = params + "mobil=1&";
                              }
                              if (masakSel == false) {
                                params = params + "masak=0&";
                              } else {
                                params = params + "masak=1&";
                              }

                              if (singleSel == false) {
                                params = params + "ssingle=0&";
                              } else {
                                params = params + "ssingle=1&";
                              }
                              if (marriedSel == false) {
                                params = params + "smarried=0&";
                              } else {
                                params = params + "smarried=1&";
                              }

                              if (widget.konten == "prt") {
                                params = params +
                                    "kprt=1&kbabysitter=0&kseniorcare=0&ksupir=0&kofficeboy=0&ktukangkebun=0&";
                              } else if (widget.konten == "babysitter") {
                                params = params +
                                    "kprt=0&kbabysitter=1&kseniorcare=0&ksupir=0&kofficeboy=0&ktukangkebun=0&";
                              } else if (widget.konten == "seniorcare") {
                                params = params +
                                    "kprt=0&kbabysitter=0&kseniorcare=1&ksupir=0&kofficeboy=0&ktukangkebun=0&";
                              } else if (widget.konten == "supir") {
                                params = params +
                                    "kprt=0&kbabysitter=0&kseniorcare=0&ksupir=1&kofficeboy=0&ktukangkebun=0&";
                              } else if (widget.konten == "officeboy") {
                                params = params +
                                    "kprt=0&kbabysitter=0&kseniorcare=0&ksupir=0&kofficeboy=1&ktukangkebun=0&";
                              } else if (widget.konten == "tukangkebun") {
                                params = params +
                                    "kprt=0&kbabysitter=0&kseniorcare=0&ksupir=0&kofficeboy=0&ktukangkebun=1&";
                              }

                              if (mingajictr.text == "") {
                                gajiawal = 0;
                              } else {
                                gajiawal = int.parse(
                                    mingajictr.text.replaceAll(",", ""));
                              }

                              if (maxgajictr.text == "") {
                                gajiakhir = 0;
                              } else {
                                gajiakhir = int.parse(
                                    maxgajictr.text.replaceAll(",", ""));
                              }

                              params = params +
                                  "gajiawal=$gajiawal&gajiakhir=$gajiakhir&jarak=$curLokasiVal&updatestatusjarak=false";

                              getListARTbyFilter(params);
                              // calculateDistane(params);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  Color(int.parse(globals.color_secondary)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            "Terapkan",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        body: getAlldata == false
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
            : Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kategori: $titlekategori",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: globals.listARTbyKategori.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  globals.kriteria.clear();

                                  if (globals.listARTbyKategori[index].hewan ==
                                      1) {
                                    globals.kriteria.add("Tidak takut hewan");
                                  }
                                  if (globals.listARTbyKategori[index].masak ==
                                      1) {
                                    globals.kriteria.add("Memasak");
                                  }
                                  if (globals.listARTbyKategori[index]
                                          .mabukjalan ==
                                      1) {
                                    globals.kriteria
                                        .add("Tidak mabuk perjalanan");
                                  }
                                  if (globals.listARTbyKategori[index]
                                          .sepedamotor ==
                                      1) {
                                    globals.kriteria
                                        .add("Menyetir sepeda motor");
                                  }
                                  if (globals.listARTbyKategori[index].mobil ==
                                      1) {
                                    globals.kriteria.add("Menyetir mobil");
                                  }
                                  if (globals.listARTbyKategori[index]
                                          .tkmenginap ==
                                      1) {
                                    globals.kriteria.add("Menginap");
                                  }
                                  if (globals
                                          .listARTbyKategori[index].tkwarnen ==
                                      1) {
                                    globals.kriteria.add("Warnen");
                                  }
                                  if (globals
                                          .listARTbyKategori[index].ssingle ==
                                      1) {
                                    globals.kriteria.add("Belum menikah");
                                  }
                                  if (globals
                                          .listARTbyKategori[index].smarried ==
                                      1) {
                                    globals.kriteria.add("Sudah menikah");
                                  }
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailART(
                                              index: index,
                                              kategori: kategori[index],
                                            )));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                        BorderRadius.circular(
                                                            50.0),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            '${globals.urlapi}getimage?id=${globals.listARTbyKategori[index].idart}&folder=profpic'),
                                                        fit: BoxFit.fill)),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Container(
                                                width: 40,
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                        globals.color_primary)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: Text(
                                                  globals
                                                      .listARTbyKategori[index]
                                                      .rating
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              globals.listARTbyKategori[index]
                                                  .namalengkap,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Asal: ${globals.listARTbyKategori[index].tempatlahir}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 14,
                                              )),
                                            ),
                                            Text(
                                              "Agama: ${agama[index]}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 14,
                                              )),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Penawaran Gaji",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              "Rp ${globals.listARTbyKategori[index].gajiawal} - ${globals.listARTbyKategori[index].gajiakhir} per bulan",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 13,
                                              )),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Kriteria",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              kriteria[index],
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 13,
                                              )),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Kategori",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              kategori[index],
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 13,
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            // print(
                                            // "telepon: ${globals.listARTbyKategori[index].telephone}");
                                            makingPhoneCall(index);
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
                            );
                          }),
                    ),
                  ],
                ),
              ));
  }
}
