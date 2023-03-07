// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // date format
import 'global.dart' as globals;
import './intro_verif.dart';

class SignUpMajikan extends StatefulWidget {
  const SignUpMajikan({super.key});

  @override
  State<SignUpMajikan> createState() => _SignUpMajikanState();
}

class _SignUpMajikanState extends State<SignUpMajikan> {
  DateTime date = DateTime.now();
  String dateformat = "";
  bool hide_pass = true;
  bool is_selected = false;

  String dropProvinsi = '-Pilih-';
  String dropKota = '-Pilih-';
  String dropKelu = '-Pilih-';
  String dropKec = '-Pilih-';

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
            "Formulir Pendaftaran Akun",
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
              // kata pengantar lagi ??
              Text(
                'Email',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              FormFieldTemplate("email"),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Nomor Telephone',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              FormFieldTemplate("telephone"),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Alamat Domisili',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              FormFieldTemplate("alamat"),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Provinsi',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 138, 138, 138)),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropProvinsi,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Color(int.parse(globals.color_primary)),
                      ),
                      items: <String>[
                        '-Pilih-',
                        'Jawa Barat',
                        'Banten',
                        'Jawa Tengah',
                        'Jawa Timur',
                        'DKI Jakarta'
                      ].map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black)),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropProvinsi = newValue!;
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Kabupaten/Kota',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 138, 138, 138)),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropKota,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Color(int.parse(globals.color_primary)),
                      ),
                      items: <String>[
                        '-Pilih-',
                        'Kota Surabaya',
                        'Kota Malang',
                        'Kota Blitar',
                        'Kota Sidoarjo',
                      ].map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black)),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropKota = newValue!;
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Kecamatan',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 138, 138, 138)),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropKec,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Color(int.parse(globals.color_primary)),
                      ),
                      items: <String>[
                        '-Pilih-',
                        'Bubutan',
                        'Genteng',
                        'Simokerto',
                        'Tegalsari',
                      ].map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black)),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropKec = newValue!;
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Kelurahan',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color.fromARGB(255, 138, 138, 138)),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: dropKelu,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, color: Colors.black)),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Color(int.parse(globals.color_primary)),
                      ),
                      items: <String>[
                        '-Pilih-',
                        'Kapasan',
                        'Sidodadi',
                        'Simokerto',
                        'Simolawang',
                        'Tambakrejo'
                      ].map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15, color: Colors.black)),
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropProvinsi = newValue!;
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Password',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                height: 50,
                child: TextField(
                  obscureText: hide_pass,
                  cursorColor: Color(int.parse(globals.color_primary)),
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 15, color: Colors.black)),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 138, 138, 138))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 138, 138, 138))),
                    hintText: '*******',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                    contentPadding: const EdgeInsets.only(top: 2.0, left: 8.0),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide_pass = !hide_pass;
                          });
                        },
                        icon: Icon(
                          hide_pass ? Icons.visibility : Icons.visibility_off,
                          color: Color(int.parse(globals.color_primary)),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Konfirmasi Password',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                height: 50,
                child: TextField(
                  obscureText: hide_pass,
                  cursorColor: Color(int.parse(globals.color_primary)),
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 15, color: Colors.black)),
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 138, 138, 138))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 138, 138, 138))),
                    hintText: '*******',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                    contentPadding: const EdgeInsets.only(top: 2.0, left: 8.0),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hide_pass = !hide_pass;
                          });
                        },
                        icon: Icon(
                          hide_pass ? Icons.visibility : Icons.visibility_off,
                          color: Color(int.parse(globals.color_primary)),
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: RichText(
                    text: TextSpan(
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                        children: [
                          const TextSpan(text: 'Saya setuju dengan '),
                          TextSpan(
                              text: 'Syarat & Kondisi ',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 77, 0)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Syarat&Kondisi');
                                }),
                          const TextSpan(text: 'yang berlaku'),
                        ]),
                  ),
                  activeColor: Color(int.parse(globals.color_primary)),
                  checkColor: Colors.white,
                  selected: is_selected,
                  value: is_selected,
                  onChanged: (value) {
                    setState(() {
                      is_selected = value!;
                    });
                  },
                ), //CheckboxListTile
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
                                builder: (context) => const IntroVerifikasi()));
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
        ));
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
      maxLines: fill == "alamat" ? 4 : 1,
    ),
  );
}
