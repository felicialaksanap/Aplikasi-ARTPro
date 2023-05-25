import 'package:artpro_application_new/detailberita.dart';
import 'package:artpro_application_new/detailloker.dart';
import 'package:artpro_application_new/listberita.dart';
import 'package:artpro_application_new/listloker.dart';
import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:artpro_application_new/notifikasi.dart';
import 'package:artpro_application_new/services/lokerservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'global.dart' as globals;

class BerandaART extends StatefulWidget {
  const BerandaART({super.key});

  @override
  State<BerandaART> createState() => _BerandaARTState();
}

class _BerandaARTState extends State<BerandaART> {
  String tugas = "";
  String kategori = "";
  String kriteria = "";
  bool finishgetdata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getListloker();
  }

  void getListloker() {
    Loker.getAllData().then((value) {
      setState(() {
        globals.listLokerAktif.clear();

        for (int i = 0; i < value.length; i++) {
          if (value[i].statusloker == 1) {
            globals.listLokerAktif.add(value[i]);
          }
        }

        // arrage data in list loker aktif
        globals.kategori.clear();
        globals.kriteria.clear();
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
          kriteria = kriteria.substring(0, kriteria.length - 2);
          globals.kriteria.add(kriteria);
          kriteria = "";
        }

        finishgetdata = true;
      });
    });
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
    });
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
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo_theme.png',
                        width: 100,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotifikasiPage()));
                          },
                          icon: Icon(
                            Icons.notifications_active_rounded,
                            color: Color(int.parse(globals.color_primary)),
                            size: 28,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cari Lowongan Kerja',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListLoker()));
                          },
                          child: Text(
                            "Lihat semua",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          ))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      arrangeData(0);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailLoker(
                                    index: 0,
                                    pagefrom: "berandaart",
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
                            Text(
                              globals.listLokerAktif[0].judulloker,
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                          int.parse(globals.color_primary)))),
                            ),
                            Text(
                              globals.listLokerAktif[0].jeniskelamin == "P"
                                  ? "Ibu ${globals.listLokerAktif[0].namalengkap}"
                                  : "Bapak ${globals.listLokerAktif[0].namalengkap}",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${globals.listLokerAktif[0].kecamatan}, ${globals.listLokerAktif[0].kota} | 0 km",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            Text(
                              "Rp ${globals.listLokerAktif[0].gajiawal} - ${globals.listLokerAktif[0].gajiakhir} per bulan",
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
                              globals.listLokerAktif[0].informasi,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                fontSize: 13,
                              )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Post pada ${globals.listLokerAktif[0].tglpost}",
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 11, color: Colors.black)),
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        globals.listLokerAktif[0].expand =
                                            !globals.listLokerAktif[0].expand;
                                      });
                                    },
                                    icon: globals.listLokerAktif[0].expand ==
                                            false
                                        ? Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(int.parse(
                                                globals.color_primary)),
                                          )
                                        : Icon(
                                            Icons.keyboard_arrow_up_rounded,
                                            color: Color(int.parse(
                                                globals.color_primary)),
                                          ))
                              ],
                            ),
                            Visibility(
                                visible:
                                    globals.listLokerAktif[0].expand == true
                                        ? true
                                        : false,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Kriteria",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(
                                      globals.kriteria[0],
                                      style: GoogleFonts.poppins(
                                          textStyle:
                                              const TextStyle(fontSize: 13)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Kategori Pekerjaan",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(
                                      globals.kategori[0],
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(int.parse(
                                                  globals.color_primary)))),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => DetailLoker(
                  //                   index: 1,
                  //                 )));
                  //   },
                  //   child: Card(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10.0)),
                  //     elevation: 3,
                  //     child: Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             globals.listLokerAll[1].judulloker,
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: TextStyle(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Color(
                  //                         int.parse(globals.color_primary)))),
                  //           ),
                  //           Text(
                  //             globals.listLokerAll[1].jeniskelamin == "P"
                  //                 ? "Ibu ${globals.listLokerAll[1].namalengkap}"
                  //                 : "Bapak ${globals.listLokerAll[1].namalengkap}",
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: const TextStyle(
                  //                     fontSize: 15, color: Colors.black)),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text(
                  //             "${globals.listLokerAll[1].kecamatan}, ${globals.listLokerAll[1].kota} | 0 km",
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: const TextStyle(
                  //                     fontSize: 13,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.black)),
                  //           ),
                  //           Text(
                  //             "Rp ${globals.listLokerAll[1].gajiawal} - ${globals.listLokerAll[1].gajiakhir} per bulan",
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: const TextStyle(
                  //                     fontSize: 13,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.black)),
                  //           ),
                  //           const SizedBox(
                  //             height: 20,
                  //           ),
                  //           Text(
                  //             globals.listLokerAll[1].informasi,
                  //             style: GoogleFonts.poppins(
                  //                 textStyle: const TextStyle(
                  //               fontSize: 13,
                  //             )),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text(
                  //                 "Post pada ${globals.listLokerAll[1].tglpost}",
                  //                 style: GoogleFonts.poppins(
                  //                     textStyle: const TextStyle(
                  //                         fontSize: 11, color: Colors.black)),
                  //               ),
                  //               IconButton(
                  //                   onPressed: () {
                  //                     setState(() {
                  //                       globals.listLokerAll[1].expand =
                  //                           !globals.listLokerAll[1].expand;
                  //                     });
                  //                   },
                  //                   icon: globals.listLokerAll[1].expand ==
                  //                           false
                  //                       ? Icon(
                  //                           Icons.keyboard_arrow_down_rounded,
                  //                           color: Color(int.parse(
                  //                               globals.color_primary)),
                  //                         )
                  //                       : Icon(
                  //                           Icons.keyboard_arrow_up_rounded,
                  //                           color: Color(int.parse(
                  //                               globals.color_primary)),
                  //                         ))
                  //             ],
                  //           ),
                  //           Visibility(
                  //               visible: globals.listLokerAll[1].expand == true
                  //                   ? true
                  //                   : false,
                  //               child: Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     "Kriteria",
                  //                     style: GoogleFonts.poppins(
                  //                         textStyle: const TextStyle(
                  //                             fontSize: 13,
                  //                             fontWeight: FontWeight.bold)),
                  //                   ),
                  //                   Text(
                  //                     globals.kriteria[1],
                  //                     style: GoogleFonts.poppins(
                  //                         textStyle:
                  //                             const TextStyle(fontSize: 13)),
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 20,
                  //                   ),
                  //                   Text(
                  //                     "Kategori Pekerjaan",
                  //                     style: GoogleFonts.poppins(
                  //                         textStyle: const TextStyle(
                  //                             fontSize: 13,
                  //                             fontWeight: FontWeight.bold)),
                  //                   ),
                  //                   Text(
                  //                     globals.kategori[1],
                  //                     style: GoogleFonts.poppins(
                  //                         textStyle: TextStyle(
                  //                             fontSize: 13,
                  //                             fontWeight: FontWeight.bold,
                  //                             color: Color(int.parse(
                  //                                 globals.color_primary)))),
                  //                   )
                  //                 ],
                  //               ))
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Berita & Tips',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Color.fromARGB(255, 22, 15, 41),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ListBerita()));
                          },
                          child: Text(
                            "Lihat semua",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MBerita.isiBerita.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailBerita(index: index)));
                          },
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      MBerita.isiBerita[index].gambarUrl,
                                      height: 150,
                                      width: 250,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      MBerita.isiBerita[index].judul,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )
                                ],
                              ),
                              index != MBerita.isiBerita.length - 1
                                  ? const SizedBox(
                                      width: 20,
                                    )
                                  : const SizedBox(
                                      width: 0,
                                    )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Materi',
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 22, 15, 41),
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MBerita.isiBerita.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print("selected index berita: $index");
                          },
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.asset(
                                      MBerita.isiBerita[index].gambarUrl,
                                      height: 150,
                                      width: 250,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      MBerita.isiBerita[index].judul,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )
                                ],
                              ),
                              index != MBerita.isiBerita.length - 1
                                  ? const SizedBox(
                                      width: 20,
                                    )
                                  : const SizedBox(
                                      width: 0,
                                    )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
