import 'package:artpro_application_new/gantipass.dart';
import 'package:artpro_application_new/mainberanda.dart';
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

  bool statusedit = false;

  TextEditingController namactr = TextEditingController();
  TextEditingController tmplahirctr = TextEditingController();
  TextEditingController alamatctr = TextEditingController();
  TextEditingController notelpctr = TextEditingController();
  TextEditingController emailctr = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namactr.text = globals.namalengkap;
    tmplahirctr.text = globals.tempatlahir;
    alamatctr.text = globals.alamatdom;
    notelpctr.text = globals.telephone;
    emailctr.text = globals.email;

    dateformat = globals.tanggallahir;
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
          statusedit == true ? "Ubah Profile" : "Lihat Profile",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(int.parse(globals.color_primary)),
                  fontWeight: FontWeight.bold)),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      statusedit = !statusedit;
                    });
                  },
                  child: Text(
                    statusedit == true ? 'Selesai' : "Ubah",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(int.parse(globals.color_secondary)),
                            fontWeight: FontWeight.bold)),
                  )),
              const SizedBox(
                width: 10,
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
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.namalengkap}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 15,
                    )),
                  )
                : Container(
                    child: TextField(
                      controller: namactr,
                      cursorColor: Color(int.parse(globals.color_primary)),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Jenis Kelamin",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "     ${globals.jeniskelamin == "P" ? "Perempuan" : "Laki-Laki"}",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Tempat Lahir",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.tempatlahir}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 15,
                    )),
                  )
                : Container(
                    child: TextField(
                      controller: tmplahirctr,
                      cursorColor: Color(int.parse(globals.color_primary)),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tanggal Lahir',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.tanggallahir}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )
                : Container(
                    height: 50,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 138, 138, 138),
                              width: 1.0),
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
                          dateformat,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Alamat Domisili",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.alamatdom}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )
                : Container(
                    child: TextField(
                      controller: alamatctr,
                      cursorColor: Color(int.parse(globals.color_primary)),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "No. Telephone",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.telephone}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )
                : Container(
                    child: TextField(
                      controller: notelpctr,
                      cursorColor: Color(int.parse(globals.color_primary)),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Email",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.email}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )
                : Container(
                    child: TextField(
                      controller: emailctr,
                      cursorColor: Color(int.parse(globals.color_primary)),
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 138, 138, 138),
                                width: 1.0),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GantiPassword()));
              },
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
