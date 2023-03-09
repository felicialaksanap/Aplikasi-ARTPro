import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  DateTime date = DateTime.now();
  String dateformat = "";

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
          "Ubah Profile",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(int.parse(globals.color_primary)),
                  fontWeight: FontWeight.bold)),
        ),
        actions: [
          Row(
            children: [
              Center(
                child: Text(
                  'Selesai',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Color(int.parse(globals.color_secondary)),
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                width: 10.0,
              )
            ],
          )
        ],
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/person-4.jpg",
                          ),
                          fit: BoxFit.fill)),
                ),
              ],
            ),
            Center(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ganti Gambar',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_primary)))),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Nama Lengkap",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 5,
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Jenis Kelamin",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 5,
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tanggal Lahir',
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 5,
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
              height: 20,
            ),
            Text(
              "Alamat Domisili",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 5,
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "No. Telephone",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 5,
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 5,
            ),
            FormFieldTemplate(),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 1,
              color: Colors.black26,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verifikasi KTP",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_primary)),
                            fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    "Belum verifikasi",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    )),
                  ),
                  Icon(
                    Icons.cancel,
                    color: Color(int.parse(globals.color_secondary)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 2))
                    ]),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ganti Password",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      ">>>>>",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

Widget FormFieldTemplate() {
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
    ),
  );
}
