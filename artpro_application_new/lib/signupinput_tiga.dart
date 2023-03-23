import 'package:artpro_application_new/intro_verif.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class SignUpInputT extends StatefulWidget {
  const SignUpInputT({super.key});

  @override
  State<SignUpInputT> createState() => _SignUpInputTState();
}

class _SignUpInputTState extends State<SignUpInputT> {
  bool k_prt = false;
  bool k_bs = false;
  bool k_sc = false; // senior care
  bool k_supir = false;
  bool k_obog = false;
  bool k_tk = false;

  TextEditingController expctr = TextEditingController();
  TextEditingController mingajictr = TextEditingController();
  TextEditingController maxgajictr = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    expctr.dispose();
    mingajictr.dispose();
    maxgajictr.dispose();
  }

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
          "Form Data Diri",
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
            const SizedBox(
              height: 10,
            ),
            Row(
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
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
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
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Ceritakan pengalaman kerja anda!',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            FormFieldTemplate("pengalaman", expctr),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Berapa gaji yang diinginkan?',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
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
                    children: [FormFieldTemplate("gaji", mingajictr)],
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
                    children: [FormFieldTemplate("gaji", maxgajictr)],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (k_prt == true ||
                          k_bs == true ||
                          k_sc == true ||
                          k_supir == true ||
                          k_obog == true ||
                          k_tk == true) {
                        if (expctr.text != "" &&
                            mingajictr.text != "" &&
                            maxgajictr.text != "") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const IntroVerifikasi()));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                    'Silahkan mengisi bagian yang diberi tanda *',
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600)),
                                    textAlign: TextAlign.center,
                                  ),
                                  actions: [
                                    Center(
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "OK",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(int.parse(
                                                        globals
                                                            .color_secondary)))),
                                          )),
                                    )
                                  ],
                                );
                              });
                        }
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  'Silahkan mengisi bagian yang diberi tanda *',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  textAlign: TextAlign.center,
                                ),
                                actions: [
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "OK",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(int.parse(globals
                                                      .color_secondary)))),
                                        )),
                                  )
                                ],
                              );
                            });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "Selanjutnya",
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
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

Widget FormFieldTemplate(String? fill, TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
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
      maxLines: fill == "pengalaman" ? 7 : 1,
    ),
  );
}
