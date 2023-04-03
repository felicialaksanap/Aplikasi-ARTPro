import 'package:artpro_application_new/detailloker.dart';
import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:artpro_application_new/tambahloker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class ListLoker extends StatefulWidget {
  const ListLoker({super.key});

  @override
  State<ListLoker> createState() => _ListLokerState();
}

class _ListLokerState extends State<ListLoker> {
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
              )),
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
                    itemCount: MListLoker.isiListLoker.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
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
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          MListLoker
                                              .isiListLoker[index].kategori,
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        )),
                                      ],
                                    ),
                                    Text(
                                      "${MListLoker.isiListLoker[0].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              color: Color.fromARGB(
                                                  255, 138, 138, 138))),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Post pada ${MListLoker.isiListLoker[index].tglpost}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.black)),
                                    )
                                    // Container(
                                    //   child: Column(
                                    //     children: MListLoker
                                    //         .isiListLoker[index].kriteria
                                    //         .map((strone) {
                                    //       return Row(children: [
                                    //         const Text(
                                    //           "\u2022",
                                    //           style: TextStyle(fontSize: 15),
                                    //         ), //bullet text
                                    //         const SizedBox(
                                    //           width: 10,
                                    //         ), //space between bullet and text
                                    //         Expanded(
                                    //           child: Text(
                                    //             strone,
                                    //             style: GoogleFonts.poppins(
                                    //                 textStyle: const TextStyle(
                                    //                     fontSize: 13)),
                                    //           ), //text
                                    //         )
                                    //       ]);
                                    //     }).toList(),
                                    //   ),
                                    // )
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TambahLoker()));
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
