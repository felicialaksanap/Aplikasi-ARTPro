import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';

class DetailLoker extends StatefulWidget {
  int index;
  DetailLoker({super.key, required this.index});

  @override
  State<DetailLoker> createState() => _DetailLokerState();
}

class _DetailLokerState extends State<DetailLoker> {
  List<String> ketlain = [
    "Tidak takut hewan",
    "Mabuk perjalanan",
    "Sepeda Motor",
    "Memasak",
    "Warnen"
  ];

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
        // title: Text(
        //   "Detail Loker",
        //   style: GoogleFonts.poppins(
        //       textStyle: TextStyle(
        //           color: Color(int.parse(globals.color_primary)),
        //           fontWeight: FontWeight.w500)),
        // ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/person-4.jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        MListLoker.isiListLoker[widget.index].kategori,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      Text(
                        'Rosa Fiore',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        "${MListLoker.isiListLoker[0].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 13,
                                color: Color.fromARGB(255, 138, 138, 138))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Informasi Singkat",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum lalalaa",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 15,
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Uraian Tugas",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: MListLoker.isiListLoker[widget.index].kriteria
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
                            textStyle: const TextStyle(fontSize: 13)),
                      ), //text
                    )
                  ]);
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Keterangan Lain",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ketlain.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 217, 217, 217),
                            width: 1)),
                    child: Center(
                      child: Text(
                        ketlain[index],
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 14)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Range Gaji Yang Ditawarkan",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              MListLoker.isiListLoker[0].rangegaji,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(int.parse(globals.color_secondary)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    "Lamar Sekarang",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
