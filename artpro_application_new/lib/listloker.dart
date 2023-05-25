// ignore_for_file: sort_child_properties_last

import 'package:artpro_application_new/beranda.dart';
import 'package:artpro_application_new/detailloker.dart';
import 'package:artpro_application_new/listlokernaktif.dart';
import 'package:artpro_application_new/mainberanda.dart';
import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:artpro_application_new/tambahloker.dart';
import 'package:artpro_application_new/services/lokerservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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
  bool singleSel = false;
  bool marriedSel = false;

  String tugas = "";
  String kategori = "";
  String kriteria = "";

  DateTime date = DateTime.now();
  String tglmodif = "";

  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (globals.status_user == "majikan") {
      Loker.getDataLokerperUser(globals.iduser).then((value) {
        setState(() {
          globals.listLokerAktif.clear();
          globals.listLokerTidakAktif.clear();
          globals.kategori.clear();
          globals.kriteria.clear();

          for (int i = 0; i < value.length; i++) {
            if (value[i].statusloker == 1) {
              globals.listLokerAktif.add(value[i]);
            } else {
              globals.listLokerTidakAktif.add(value[i]);
            }
          }

          // arrange data in list loker aktif
          for (int i = 0; i < globals.listLokerAktif.length; i++) {
            // convert to format currency
            globals.listLokerAktif[i].gajiawal =
                NumberFormat.decimalPatternDigits(
                        locale: 'en-US', decimalDigits: 0)
                    .format(int.parse(globals.listLokerAktif[i].gajiawal));

            globals.listLokerAktif[i].gajiakhir =
                NumberFormat.decimalPatternDigits(
                        locale: 'en-US', decimalDigits: 0)
                    .format(int.parse(globals.listLokerAktif[i].gajiakhir));

            // arrange kategori to string
            if (globals.listLokerAktif[i].kprt == 1) {
              kategori = kategori + "Pembantu, ";
            }
            if (globals.listLokerAktif[i].kbabysitter == 1) {
              kategori = kategori + "Babysitter, ";
            }
            if (globals.listLokerAktif[i].kseniorcare == 1) {
              kategori = kategori + "Pendamping Lansia, ";
            }
            if (globals.listLokerAktif[i].ksupir == 1) {
              kategori = kategori + "Supir, ";
            }
            if (globals.listLokerAktif[i].kofficeboy == 1) {
              kategori = kategori + "Office Boy / Girl, ";
            }
            if (globals.listLokerAktif[i].ktukangkebun == 1) {
              kategori = kategori + "Tukang Kebun, ";
            }
            kategori = kategori.substring(0, kategori.length - 2);
            globals.kategori.add(kategori);
            kategori = "";

            // arrange kriteria to string
            if (globals.listLokerAktif[i].hewan == 1) {
              kriteria = kriteria + "Tidak takut hewan, ";
            }
            if (globals.listLokerAktif[i].masak == 1) {
              kriteria = kriteria + "Memasak, ";
            }
            if (globals.listLokerAktif[i].mabukjalan == 1) {
              kriteria = kriteria + "Tidak mabuk perjalanan, ";
            }
            if (globals.listLokerAktif[i].sepedamotor == 1) {
              kriteria = kriteria + "Menyetir sepeda motor, ";
            }
            if (globals.listLokerAktif[i].mobil == 1) {
              kriteria = kriteria + "Menyetir mobil, ";
            }
            if (globals.listLokerAktif[i].tkmenginap == 1) {
              kriteria = kriteria + "Menginap, ";
            }
            if (globals.listLokerAktif[i].tkwarnen == 1) {
              kriteria = kriteria + "Warnen, ";
            }
            if (globals.listLokerAktif[i].ssingle == 1) {
              kriteria = kriteria + "Belum menikah, ";
            }
            if (globals.listLokerAktif[i].smarried == 1) {
              kriteria = kriteria + "Sudah menikah, ";
            }
            kriteria = kriteria.substring(0, kriteria.length - 2);
            globals.kriteria.add(kriteria);
            kriteria = "";
          }
        });
      });
    }
  }

  Future<void> updateStatusLoker(int index) async {
    var url =
        "${globals.urlapi}editstatusloker?idloker=${int.parse(globals.listLokerAktif[index].idloker)}";
    var response2 = await http
        .put(Uri.parse(url), body: {"statusloker": "0", "tglpost": tglmodif});

    if (response2.statusCode == 200) {
      setState(() {
        if (globals.status_user == "majikan") {
          Loker.getDataLokerperUser(globals.iduser).then((value) {
            setState(() {
              globals.listLokerAktif.clear();
              globals.listLokerTidakAktif.clear();
              globals.kategori.clear();
              globals.kriteria.clear();

              for (int i = 0; i < value.length; i++) {
                if (value[i].statusloker == 1) {
                  globals.listLokerAktif.add(value[i]);
                } else {
                  globals.listLokerTidakAktif.add(value[i]);
                }
              }

              // arrange data in list loker aktif
              for (int i = 0; i < globals.listLokerAktif.length; i++) {
                // arrange kategori to string
                if (globals.listLokerAktif[i].kprt == 1) {
                  kategori = kategori + "Pembantu, ";
                }
                if (globals.listLokerAktif[i].kbabysitter == 1) {
                  kategori = kategori + "Babysitter, ";
                }
                if (globals.listLokerAktif[i].kseniorcare == 1) {
                  kategori = kategori + "Pendamping Lansia, ";
                }
                if (globals.listLokerAktif[i].ksupir == 1) {
                  kategori = kategori + "Supir, ";
                }
                if (globals.listLokerAktif[i].kofficeboy == 1) {
                  kategori = kategori + "Office Boy / Girl, ";
                }
                if (globals.listLokerAktif[i].ktukangkebun == 1) {
                  kategori = kategori + "Tukang Kebun, ";
                }
                kategori = kategori.substring(0, kategori.length - 2);
                globals.kategori.add(kategori);
                kategori = "";

                // arrange kriteria to string
                if (globals.listLokerAktif[i].hewan == 1) {
                  kriteria = kriteria + "Tidak takut hewan, ";
                }
                if (globals.listLokerAktif[i].masak == 1) {
                  kriteria = kriteria + "Memasak, ";
                }
                if (globals.listLokerAktif[i].mabukjalan == 1) {
                  kriteria = kriteria + "Tidak mabuk perjalanan, ";
                }
                if (globals.listLokerAktif[i].sepedamotor == 1) {
                  kriteria = kriteria + "Menyetir sepeda motor, ";
                }
                if (globals.listLokerAktif[i].mobil == 1) {
                  kriteria = kriteria + "Menyetir mobil, ";
                }
                if (globals.listLokerAktif[i].tkmenginap == 1) {
                  kriteria = kriteria + "Menginap, ";
                }
                if (globals.listLokerAktif[i].tkwarnen == 1) {
                  kriteria = kriteria + "Warnen, ";
                }
                if (globals.listLokerAktif[i].ssingle == 1) {
                  kriteria = kriteria + "Belum menikah, ";
                }
                if (globals.listLokerAktif[i].smarried == 1) {
                  kriteria = kriteria + "Sudah menikah, ";
                }
                kriteria = kriteria.substring(0, kriteria.length - 2);
                globals.kriteria.add(kriteria);
                kriteria = "";
              }
            });
          });
        }
      });
      Navigator.pop(context);
    }
  }

  void arrangeData(int index) {
    setState(() {
      globals.listTugas.clear();
      // arrange tugas loker
      for (int i = 0; i < globals.listLokerAktif[index].tugas.length; i++) {
        if (globals.listLokerAktif[index].tugas[i] == "." &&
            globals.listLokerAktif[index].tugas[i + 1] == " ") {
          globals.listTugas.add(tugas);
        } else if (globals.listLokerAktif[index].tugas[i] == " " &&
            globals.listLokerAktif[index].tugas[i - 1] == ".") {
          tugas = "";
        } else if (i == globals.listLokerAktif[index].tugas.length - 1) {
          tugas = tugas + globals.listLokerAktif[index].tugas[i];
          globals.listTugas.add(tugas);
          tugas = "";
        } else {
          tugas = tugas + globals.listLokerAktif[index].tugas[i];
        }
      }

      globals.listKriteria.clear();
      // arrange kriteria
      if (globals.listLokerAktif[index].hewan == 1) {
        globals.listKriteria.add("Tidak takut hewan");
      }
      if (globals.listLokerAktif[index].masak == 1) {
        globals.listKriteria.add("Memasak");
      }
      if (globals.listLokerAktif[index].mabukjalan == 1) {
        globals.listKriteria.add("Tidak mabuk perjalanan");
      }
      if (globals.listLokerAktif[index].sepedamotor == 1) {
        globals.listKriteria.add("Menyetir sepeda motor");
      }
      if (globals.listLokerAktif[index].mobil == 1) {
        globals.listKriteria.add("Menyetir mobil");
      }
      if (globals.listLokerAktif[index].tkmenginap == 1) {
        globals.listKriteria.add("Menginap");
      }
      if (globals.listLokerAktif[index].tkwarnen == 1) {
        globals.listKriteria.add("Warnen");
      }
      if (globals.listLokerAktif[index].ssingle == 1) {
        globals.listKriteria.add("Belum menikah");
      }
      if (globals.listLokerAktif[index].smarried == 1) {
        globals.listKriteria.add("Sudah menikah");
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
                if (globals.status_user == "majikan") {
                  setState(() {
                    globals.listLokerAktif.clear();
                    globals.listLokerTidakAktif.clear();
                    globals.kategori.clear();
                    globals.kriteria.clear();
                  });
                }
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
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LokerTidakAktif()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.manage_history_outlined,
                        color: Color(int.parse(globals.color_primary)),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Sejarah Loker',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15,
                                color:
                                    Color(int.parse(globals.color_primary)))),
                      )
                    ],
                  ),
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
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Status Pernikahan",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    )
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
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: prtSel ? 2 : 1)),
                          child: Text("Belum Menikah",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
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
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: prtSel ? 2 : 1)),
                          child: Text("Sudah Menikah",
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
                          onPressed: () {},
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
        body: globals.listLokerAktif.isEmpty
            ? Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Lowongan kerja yang anda buka :",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Tidak ada data \n Silahkan buka lowongan",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Color(int.parse(globals.color_primary)))),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
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
                          itemCount: globals.listLokerAktif.length,
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
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    elevation: 3,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                globals.listLokerAktif[index]
                                                    .judulloker,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Color(int.parse(
                                                            globals
                                                                .color_primary)))),
                                              ),
                                              Visibility(
                                                  visible:
                                                      globals.status_user ==
                                                              "majikan"
                                                          ? true
                                                          : false,
                                                  child: Row(
                                                    children: [
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.create_rounded,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_primary)),
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
                                                          Icons.do_disturb,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_secondary)),
                                                        ),
                                                        onPressed: () {
                                                          showDialog(
                                                              context: context,
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
                                                                          "Apakah anda yakin ingin menonaktifkan\n lowongan kerja ini?",
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
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: [
                                                                        ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            style:
                                                                                ElevatedButton.styleFrom(backgroundColor: Color(int.parse(globals.color_primary)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                                                            child: Text(
                                                                              "Batal",
                                                                              style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                                                                            )),
                                                                        ElevatedButton(
                                                                            onPressed:
                                                                                () {
                                                                              setState(() {
                                                                                tglmodif = DateFormat('dd-MM-yyyy').format(date);
                                                                              });
                                                                              updateStatusLoker(index);
                                                                            },
                                                                            style:
                                                                                ElevatedButton.styleFrom(backgroundColor: Color(int.parse(globals.color_secondary)), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
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
                                                      ),
                                                    ],
                                                  ))
                                            ],
                                          ),
                                          Text(
                                            globals.listLokerAktif[index]
                                                        .jeniskelamin ==
                                                    "P"
                                                ? "Ibu ${globals.listLokerAktif[index].namalengkap}"
                                                : "Bapak ${globals.listLokerAktif[index].namalengkap}",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black)),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "${globals.listLokerAktif[index].kecamatan}, ${globals.listLokerAktif[index].kota} | 5,3 km",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                          ),
                                          Text(
                                            "Rp ${globals.listLokerAktif[index].gajiawal} - ${globals.listLokerAktif[index].gajiakhir} per bulan",
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
                                            globals.listLokerAktif[index]
                                                .informasi,
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
                                                "Post pada ${globals.listLokerAktif[index].tglpost}",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black)),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      globals
                                                              .listLokerAktif[index]
                                                              .expand =
                                                          !globals
                                                              .listLokerAktif[
                                                                  index]
                                                              .expand;
                                                    });
                                                  },
                                                  icon: globals
                                                              .listLokerAktif[
                                                                  index]
                                                              .expand ==
                                                          false
                                                      ? Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_primary)),
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .keyboard_arrow_up_rounded,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_primary)),
                                                        ))
                                            ],
                                          ),
                                          Visibility(
                                              visible: globals
                                                          .listLokerAktif[index]
                                                          .expand ==
                                                      true
                                                  ? true
                                                  : false,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Kriteria",
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  ),
                                                  Text(
                                                    globals.kriteria[index],
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 13)),
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    "Kategori Pekerjaan",
                                                    style: GoogleFonts.poppins(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  ),
                                                  Text(
                                                    globals.kategori[index],
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Color(int
                                                                .parse(globals
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
