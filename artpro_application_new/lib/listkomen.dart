import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as globals;
import './modeltemp/modeltemp.dart';

class ListKomen extends StatefulWidget {
  const ListKomen({super.key});

  @override
  State<ListKomen> createState() => _ListKomenState();
}

class _ListKomenState extends State<ListKomen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Komentar",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(int.parse(globals.color_primary)))),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: MListKomen.isiKomen.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.0),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          MListKomen.isiKomen[index].foto),
                                      fit: BoxFit.fill)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  MListKomen.isiKomen[index].nama,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  MListKomen.isiKomen[index].tanggal,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 138, 138, 138))),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          MListKomen.isiKomen[index].isikomen,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    color: const Color.fromARGB(255, 138, 138, 138),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              );
            }),
      ),
    );
  }
}
