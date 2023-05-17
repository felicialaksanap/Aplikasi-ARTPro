import 'package:artpro_application_new/listloker.dart';
import 'package:artpro_application_new/services/lokerservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'global.dart' as globals;

class LokerTidakAktif extends StatefulWidget {
  const LokerTidakAktif({super.key});

  @override
  State<LokerTidakAktif> createState() => _LokerTidakAktifState();
}

class _LokerTidakAktifState extends State<LokerTidakAktif> {
  String kategori = "";
  String kriteria = "";

  DateTime date = DateTime.now();
  String tglpost = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // arrange data in list loker aktif
    for (int i = 0; i < globals.listLokerTidakAktif.length; i++) {
      // arrange kategori to string
      if (globals.listLokerTidakAktif[i].kprt == 1) {
        kategori = kategori + "Pembantu, ";
      }
      if (globals.listLokerTidakAktif[i].kbabysitter == 1) {
        kategori = kategori + "Babysitter, ";
      }
      if (globals.listLokerTidakAktif[i].kseniorcare == 1) {
        kategori = kategori + "Pendamping Lansia, ";
      }
      if (globals.listLokerTidakAktif[i].ksupir == 1) {
        kategori = kategori + "Supir, ";
      }
      if (globals.listLokerTidakAktif[i].kofficeboy == 1) {
        kategori = kategori + "Office Boy / Girl, ";
      }
      if (globals.listLokerTidakAktif[i].ktukangkebun == 1) {
        kategori = kategori + "Tukang Kebun, ";
      }
      kategori = kategori.substring(0, kategori.length - 2);
      globals.kategorina.add(kategori);
      kategori = "";

      // arrange kriteria to string
      if (globals.listLokerTidakAktif[i].hewan == 1) {
        kriteria = kriteria + "Tidak takut hewan, ";
      }
      if (globals.listLokerTidakAktif[i].masak == 1) {
        kriteria = kriteria + "Memasak, ";
      }
      if (globals.listLokerTidakAktif[i].mabukjalan == 1) {
        kriteria = kriteria + "Tidak mabuk perjalanan, ";
      }
      if (globals.listLokerTidakAktif[i].sepedamotor == 1) {
        kriteria = kriteria + "Menyetir sepeda motor, ";
      }
      if (globals.listLokerTidakAktif[i].mobil == 1) {
        kriteria = kriteria + "Menyetir mobil, ";
      }
      if (globals.listLokerTidakAktif[i].tkmenginap == 1) {
        kriteria = kriteria + "Menginap, ";
      }
      if (globals.listLokerTidakAktif[i].tkwarnen == 1) {
        kriteria = kriteria + "Warnen, ";
      }
      if (globals.listLokerTidakAktif[i].ssingle == 1) {
        kriteria = kriteria + "Belum menikah, ";
      }
      if (globals.listLokerTidakAktif[i].smarried == 1) {
        kriteria = kriteria + "Sudah menikah, ";
      }
      kriteria = kriteria.substring(0, kriteria.length - 2);
      globals.kriteriana.add(kriteria);
      kriteria = "";
    }

    tglpost = DateFormat('dd-MM-yyyy').format(date);
  }

  void updateStatusLoker(int index) async {
    var url =
        "${globals.urlapi}editstatusloker?idloker=${int.parse(globals.listLokerTidakAktif[index].idloker)}";
    var response2 = await http
        .put(Uri.parse(url), body: {"statusloker": "1", "tglpost": tglpost});

    if (response2.statusCode == 200) {
      setState(() {
        globals.listLokerTidakAktif.removeAt(index);
        globals.kategorina.removeAt(index);
        globals.kriteriana.removeAt(index);
      });
      Navigator.pop(context);
    }
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListLoker()));
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Color(int.parse(globals.color_primary)),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/logo_theme.png',
              width: 100,
            ),
          ],
        ),
      ),
      body: globals.listLokerTidakAktif.isEmpty
          ? Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lowongan kerja yang tidak aktif :",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Tidak ada data lowongan kerja \nyang tidak aktif",
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
                  Text(
                    "Lowongan kerja yang tidak aktif: ",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: globals.listLokerTidakAktif.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Card(
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
                                              globals.listLokerTidakAktif[index]
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
                                            IconButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return AlertDialog(
                                                          title: Text(
                                                            "Mengapa mau mengaktifkan kembali lowongan kerja ini?",
                                                            style: GoogleFonts.poppins(
                                                                textStyle: const TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                          ),
                                                          actions: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
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
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500)),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  width: 20,
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    updateStatusLoker(
                                                                        index);
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                      backgroundColor:
                                                                          Color(int.parse(globals
                                                                              .color_secondary)),
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10))),
                                                                  child: Text(
                                                                    "Aktifkan",
                                                                    style: GoogleFonts.poppins(
                                                                        textStyle: const TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500)),
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        );
                                                      });
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .power_settings_new_rounded,
                                                  color: Color(int.parse(
                                                      globals.color_secondary)),
                                                ))
                                          ],
                                        ),
                                        Text(
                                          globals.listLokerTidakAktif[index]
                                                      .jeniskelamin ==
                                                  "P"
                                              ? "Ibu ${globals.listLokerTidakAktif[index].namalengkap}"
                                              : "Bapak ${globals.listLokerTidakAktif[index].namalengkap}",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${globals.listLokerTidakAktif[index].kecamatan}, ${globals.listLokerTidakAktif[index].kota} | 5,3 km",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black)),
                                        ),
                                        Text(
                                          "Rp ${globals.listLokerTidakAktif[index].gajiawal} - ${globals.listLokerTidakAktif[index].gajiakhir} per bulan",
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
                                          globals.listLokerTidakAktif[index]
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
                                              "Diselesaikan pada ${globals.listLokerTidakAktif[index].tglpost}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.black)),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    globals
                                                            .listLokerTidakAktif[
                                                                index]
                                                            .expand =
                                                        !globals
                                                            .listLokerTidakAktif[
                                                                index]
                                                            .expand;
                                                  });
                                                },
                                                icon: globals
                                                            .listLokerTidakAktif[
                                                                index]
                                                            .expand ==
                                                        false
                                                    ? Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: Color(int.parse(
                                                            globals
                                                                .color_primary)),
                                                      )
                                                    : Icon(
                                                        Icons
                                                            .keyboard_arrow_up_rounded,
                                                        color: Color(int.parse(
                                                            globals
                                                                .color_primary)),
                                                      ))
                                          ],
                                        ),
                                        Visibility(
                                            visible: globals
                                                        .listLokerTidakAktif[
                                                            index]
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
                                                  globals.kriteriana[index],
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
                                                  globals.kategorina[index],
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_primary)))),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          }))
                ],
              ),
            ),
    );
  }
}
