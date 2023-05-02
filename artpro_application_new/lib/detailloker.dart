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
  // List<String> ketlain = [
  //   "Tidak takut hewan",
  //   "Mabuk perjalanan",
  //   "Sepeda Motor",
  //   "Memasak",
  //   "Warnen"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
            Text(
              MListLoker.isiListLoker[widget.index].judul,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse(globals.color_primary)))),
            ),
            Text(
              widget.index != 1
                  ? "Ibu ${MListLoker.isiListLoker[widget.index].namamajikan}"
                  : "Bapak ${MListLoker.isiListLoker[widget.index].namamajikan}",
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${MListLoker.isiListLoker[1].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text(
              "${MListLoker.isiListLoker[widget.index].rangegaji} per bulan",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Post pada ${MListLoker.isiListLoker[widget.index].tglpost}",
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 13, color: Colors.black)),
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
              "${MListLoker.isiListLoker[1].informasi}",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                fontSize: 13,
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
                children:
                    MListLoker.isiListLoker[widget.index].jobdesc.map((strone) {
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
                "Kriteria",
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
                itemCount:
                    MListLoker.isiListLoker[widget.index].kriteria.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
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
                        MListLoker.isiListLoker[widget.index].kriteria[index],
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
                "Kategori Pekerjaan",
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
              MListLoker.isiListLoker[widget.index].kategori,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
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
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)),
                  )),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
