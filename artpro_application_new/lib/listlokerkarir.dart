// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailloker.dart';
import 'global.dart' as globals;
import 'modeltemp/modeltemp.dart';

class ListLokerKarir extends StatefulWidget {
  const ListLokerKarir({super.key});

  @override
  State<ListLokerKarir> createState() => _ListLokerKarirState();
}

class _ListLokerKarirState extends State<ListLokerKarir> {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/person-4.jpg'),
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
                                              MListLoker
                                                  .isiListLoker[index].kategori,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              'Rosa Fiore',
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                            Text(
                                              "${MListLoker.isiListLoker[0].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
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
                                        visible:
                                            globals.status_user == "majikan"
                                                ? true
                                                : false,
                                        child: PopupMenuButton(
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Color(int.parse(
                                                globals.color_primary)),
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
                                                        globals
                                                            .color_secondary)),
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
                                  Text(
                                    "Status : menunggu konfirmasi",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 11,
                                            color: Color(int.parse(
                                                globals.color_secondary)))),
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
                  }),
            )
          ],
        ),
      ),
    );
  }
}
