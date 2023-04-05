import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class TambahLoker extends StatefulWidget {
  const TambahLoker({super.key});

  @override
  State<TambahLoker> createState() => _TambahLokerState();
}

class _TambahLokerState extends State<TambahLoker> {
  bool k_prt = false;
  bool k_bs = false;
  bool k_sc = false; // senior care
  bool k_supir = false;
  bool k_obog = false;
  bool k_tk = false;

  bool tthewan = false;
  bool masak = false;
  bool tmperj = false;
  bool mspdmtr = false;
  bool mmobil = false;
  bool menginap = false;
  bool warnen = false;

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
          ),
        ),
        title: Text(
          "Tambah Loker",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(int.parse(globals.color_primary)),
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori pekerjaan',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Text(
              '(bisa memilih lebih dari 1)',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 22, 15, 41),
                fontSize: 12,
              )),
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_prt,
                    onChanged: (value) {
                      setState(() {
                        k_prt = value!;
                      });
                    }),
                Expanded(
                  child: Text(
                    "Pekerja/Pembantu Rumah Tangga",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_bs,
                    onChanged: (value) {
                      setState(() {
                        k_bs = value!;
                      });
                    }),
                Text(
                  "Baby Sitter",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_sc,
                    onChanged: (value) {
                      setState(() {
                        k_sc = value!;
                      });
                    }),
                Text(
                  "Pendamping Lansia",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_supir,
                    onChanged: (value) {
                      setState(() {
                        k_supir = value!;
                      });
                    }),
                Text(
                  "Supir Pribadi",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_obog,
                    onChanged: (value) {
                      setState(() {
                        k_obog = value!;
                      });
                    }),
                Text(
                  "Office Boy/Office Girl",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_tk,
                    onChanged: (value) {
                      setState(() {
                        k_tk = value!;
                      });
                    }),
                Text(
                  "Tukang Kebun",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Berapa gaji yang diinginkan?',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Rp',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [FormFieldTemplate("gaji")],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '-',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [FormFieldTemplate("gaji")],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Kenapa membuka lowongan kerja ini?',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 5,
            ),
            FormFieldTemplate("kriteria"),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Jelaskan uraian tugas untuk lowongan ini?',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 5,
            ),
            FormFieldTemplate("kriteria"),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Pilih kriteria yang sesuai dengan loker ini!',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tthewan = !tthewan;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: tthewan == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: tthewan == true ? 2 : 1)),
                    child: Text(
                      "Tidak Takut Hewan",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      masak = !masak;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: masak == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: masak == true ? 2 : 1)),
                    child: Text(
                      "Memasak",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  tmperj = !tmperj;
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: tmperj == true
                            ? Color(int.parse(globals.color_primary))
                            : const Color.fromARGB(255, 138, 138, 138),
                        width: tmperj == true ? 2 : 1)),
                child: Text(
                  "Tidak Mabuk Perjalanan",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 14)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  mspdmtr = !mspdmtr;
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: mspdmtr == true
                            ? Color(int.parse(globals.color_primary))
                            : const Color.fromARGB(255, 138, 138, 138),
                        width: mspdmtr == true ? 2 : 1)),
                child: Text(
                  "Menyetir Sepeda Motor",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 14)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  mmobil = !mmobil;
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: mmobil == true
                            ? Color(int.parse(globals.color_primary))
                            : const Color.fromARGB(255, 138, 138, 138),
                        width: mmobil == true ? 2 : 1)),
                child: Text(
                  "Menyetir Mobil",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 14)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      menginap = !menginap;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: menginap == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: menginap == true ? 2 : 1)),
                    child: Text(
                      "Menginap",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      warnen = !warnen;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: warnen == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: warnen == true ? 2 : 1)),
                    child: Text(
                      "Warnen",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 14)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "Tambah Lowongan Kerja",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

Widget FormFieldTemplate(String? fill) {
  return Container(
    child: TextField(
      cursorColor: Color(int.parse(globals.color_primary)),
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 15, color: Colors.black)),
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
          ),
          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
      maxLines: fill == "gaji" ? 1 : 5,
    ),
  );
}
