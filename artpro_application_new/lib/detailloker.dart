import 'package:artpro_application_new/berandaart.dart';
import 'package:artpro_application_new/listloker.dart';
import 'package:artpro_application_new/mainberanda.dart';
import 'package:artpro_application_new/tambahloker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';

class DetailLoker extends StatefulWidget {
  int index;
  String? pagefrom;
  DetailLoker({super.key, required this.index, this.pagefrom});

  @override
  State<DetailLoker> createState() => _DetailLokerState();
}

class _DetailLokerState extends State<DetailLoker> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
            setState(() {
              globals.listTugas.clear();
              globals.listKriteria.clear();
            });
            if (widget.pagefrom == "berandaart") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainBeranda()));
            } else {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ListLoker()));
            }
          },
        ),
        actions: [
          globals.status_user == "majikan"
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TambahLoker(
                                  konten: "edit",
                                  index: widget.index,
                                  pagefrom: "detailloker",
                                )));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.create_rounded,
                        color: Color(int.parse(globals.color_secondary)),
                      ),
                      Text(
                        "Ubah Data",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color:
                                    Color(int.parse(globals.color_secondary)))),
                      ),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                )
              : Container()
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              globals.listLokerAktif[widget.index].judulloker,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(int.parse(globals.color_primary)))),
            ),
            Text(
              globals.listLokerAktif[widget.index].jeniskelamin == "P"
                  ? "Ibu ${globals.listLokerAktif[widget.index].namalengkap}"
                  : "Bapak ${globals.listLokerAktif[widget.index].namalengkap}",
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 15, color: Colors.black)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${globals.listLokerAktif[widget.index].kecamatan}, ${globals.listLokerAktif[widget.index].kota} | 5.3 km",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text(
              "Rp ${globals.listLokerAktif[widget.index].gajiawal} - ${globals.listLokerAktif[widget.index].gajiakhir} per bulan",
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
              "Post pada ${globals.listLokerAktif[widget.index].tglpost}",
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
              globals.listLokerAktif[widget.index].informasi,
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
                children: globals.listTugas.map((strone) {
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
                itemCount: globals.listKriteria.length,
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
                        globals.listKriteria[index],
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
              globals.kategori[widget.index],
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Visibility(
                visible: globals.status_user == "pekerja" ? true : false,
                child: Column(
                  children: [
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
                  ],
                )),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
