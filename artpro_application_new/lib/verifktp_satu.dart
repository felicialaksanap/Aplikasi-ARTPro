import 'package:artpro_application_new/verifktp_dua.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'global.dart' as globals;

class VerifikasiKTPS extends StatefulWidget {
  const VerifikasiKTPS({super.key});

  @override
  State<VerifikasiKTPS> createState() => _VerifikasiKTPSState();
}

class _VerifikasiKTPSState extends State<VerifikasiKTPS> {
  DateTime date = DateTime.now();
  String dateformat = "";
  String jenisKelamin = "";

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
          "Formulir Verifikasi",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 75,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: Color(int.parse(globals.color_secondary)),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 75,
                  height: 10,
                  color: const Color.fromARGB(255, 138, 138, 138),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 75,
                  height: 10,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color.fromARGB(255, 138, 138, 138),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "1 dari 3",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(int.parse(globals.color_primary)))),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'No. KTP',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Nama Lengkap',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Tempat Lahir',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Tanggal Lahir',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
              height: 50,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
                    borderRadius: BorderRadius.circular(5.0)),
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100));
                  if (newDate == null) return;
                  setState(() {
                    date = newDate;
                    dateformat = DateFormat('dd-MM-yyyy').format(date);
                  });
                },
                trailing: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Icon(
                    Icons.calendar_month,
                    size: 30,
                    color: Color(int.parse(globals.color_primary)),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    dateformat.isEmpty ? 'DD/MM/YYYY' : dateformat,
                    style: GoogleFonts.poppins(
                        textStyle: dateformat.isNotEmpty
                            ? const TextStyle(fontSize: 15, color: Colors.black)
                            : const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Jenis Kelamin',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: "laki-laki",
                              groupValue: jenisKelamin,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  jenisKelamin = value.toString();
                                });
                              }),
                          Text(
                            "Laki - Laki",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 15)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: "perempuan",
                              groupValue: jenisKelamin,
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      Color(int.parse(globals.color_primary))),
                              onChanged: (value) {
                                setState(() {
                                  jenisKelamin = value.toString();
                                });
                              }),
                          Text(
                            "Perempuan",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 15)),
                          ),
                        ],
                      )
                    ],
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
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifikasiKTPD()));
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
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

Widget FormFieldTemplate() {
  return Container(
    height: 50,
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
          contentPadding: EdgeInsets.only(bottom: 2.0, left: 8.0)),
    ),
  );
}
