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
        body: Container(
          padding: const EdgeInsets.only(left: 8.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(int.parse(globals.color_primary)),
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo_theme.png',
                    width: 100,
                  )
                ],
              ),
              Visibility(
                visible: globals.status_user == "pekerja" ? false : true,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Lowongan Kerja Yang Kamu Buka Saat Ini :",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: MListLoker.isiListLoker.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.create_rounded,
                                                  color: Color(int.parse(
                                                      globals.color_primary)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.delete,
                                                color: Color(int.parse(
                                                    globals.color_secondary)),
                                              ))
                                        ],
                                      ),
                                      Text(
                                        MListLoker.isiListLoker[index].asalkota,
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 138, 138, 138))),
                                      ),
                                      Text(
                                        MListLoker
                                            .isiListLoker[index].rangegaji,
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 138, 138, 138))),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        child: Column(
                                          children: MListLoker
                                              .isiListLoker[index].kriteria
                                              .map((strone) {
                                            return Row(children: [
                                              const Text(
                                                "\u2022",
                                                style: TextStyle(fontSize: 15),
                                              ), //bullet text
                                              const SizedBox(
                                                width: 10,
                                              ), //space between bullet and text
                                              Expanded(
                                                child: Text(
                                                  strone,
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 13)),
                                                ), //text
                                              )
                                            ]);
                                          }).toList(),
                                        ),
                                      )
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
                      }))
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
