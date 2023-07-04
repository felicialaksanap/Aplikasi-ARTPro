// ignore_for_file: sort_child_properties_last

import 'dart:developer';
import 'dart:io';

import 'package:artpro_application_new/karir.dart';
import 'package:artpro_application_new/mainberanda.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'detailloker.dart';
import 'global.dart' as globals;
import 'modeltemp/modeltemp.dart';

class ListLokerKarir extends StatefulWidget {
  const ListLokerKarir({super.key});

  @override
  State<ListLokerKarir> createState() => _ListLokerKarirState();
}

class _ListLokerKarirState extends State<ListLokerKarir> {
  Future<http.Response> deletelamaran(String idlamaran, int index) async {
    var url = "${globals.urlapi}deletelamaran?idlamar=$idlamaran";
    var response = await http.delete(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (response.statusCode == 200) {
      setState(() {
        globals.listDataLamaran.removeAt(index);
        Navigator.pop(context);
      });
    }

    return response;
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainBeranda()));
          },
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
                "Lowongan Kerja Saat Ini :",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: globals.listDataLamaran.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${globals.urlapi}getimage?id=${globals.listDataLamaran[index].iduser}&folder=profpic'),
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
                                            globals.listDataLamaran[index]
                                                .judulloker,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text(
                                            globals.listDataLamaran[index]
                                                .namalengkap,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Text(
                                            "${globals.listDataLamaran[index].kecamatan}, ${globals.listDataLamaran[index].kota}",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 13,
                                                    color: Color.fromARGB(
                                                        255, 138, 138, 138))),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: globals.status_user == "majikan"
                                          ? true
                                          : false,
                                      child: PopupMenuButton(
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: Color(
                                              int.parse(globals.color_primary)),
                                        ),
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.create,
                                                  color: Color(int.parse(
                                                      globals.color_primary)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Edit Loker",
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 13)),
                                                )
                                              ],
                                            ),
                                            value: 1,
                                          ),
                                          PopupMenuItem(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  color: Color(int.parse(
                                                      globals.color_secondary)),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Hapus Loker",
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 13)),
                                                )
                                              ],
                                            ),
                                            value: 2,
                                          )
                                        ],
                                      ),
                                    )
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
                                      "waktu lamar: ${globals.listDataLamaran[index].waktulamar}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 11,
                                              color: Colors.black)),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
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
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
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
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    Color(int.parse(
                                                                        globals
                                                                            .color_primary)),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            child: Text(
                                                              "Batal",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                            )),
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              deletelamaran(
                                                                  globals
                                                                      .listDataLamaran[
                                                                          index]
                                                                      .idlamar
                                                                      .toString(),
                                                                  index);
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    Color(int.parse(
                                                                        globals
                                                                            .color_secondary)),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10))),
                                                            child: Text(
                                                              "Ya",
                                                              style: GoogleFonts.poppins(
                                                                  textStyle: const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500)),
                                                            ))
                                                      ],
                                                    )
                                                  ],
                                                );
                                              });
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(int.parse(
                                                globals.color_primary)),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30))),
                                        child: Text(
                                          "Batalkan lamaran",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                        ))
                                  ],
                                )
                              ],
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
    );
  }
}
