// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:artpro_application_new/services/services.dart';
import 'package:artpro_application_new/signupinput_dua.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // date format
import 'global.dart' as globals;
import './intro_verif.dart';

class SignUpInput extends StatefulWidget {
  const SignUpInput({super.key});

  @override
  State<SignUpInput> createState() => _SignUpInputState();
}

class _SignUpInputState extends State<SignUpInput> {
  bool hide_pass = true;
  bool hide_konfpass = true;
  bool is_selected = false;

  String message = "";
  String dropProvinsi = '-Pilih-';
  String dropKota = '-Pilih-';
  String dropKelu = '-Pilih-';
  String dropKec = '-Pilih-';

  TextEditingController emailctr = TextEditingController();
  TextEditingController notelpctr = TextEditingController();
  TextEditingController alamatdctr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  TextEditingController konfpassctr = TextEditingController();

  List<DetailProvinsi> listProvinsi = [];
  List<String> menuProvinsi = [];

  List<DetailKotKab> listKotKab = [];
  List<String> menuKotKab = [];

  List<DetailKecamatan> listKecamatan = [];
  List<String> menuKecamatan = [];

  List<DetailKelurahan> listKelurahan = [];
  List<String> menuKelurahan = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailctr.dispose();
    notelpctr.dispose();
    alamatdctr.dispose();
    passctr.dispose();
    konfpassctr.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetailProvinsi();
    menuKotKab.add("-Pilih-");
    menuKecamatan.add("-Pilih-");
    menuKelurahan.add("-Pilih-");
  }

  Future<void> getDetailProvinsi() async {
    DetailProvinsi.getData().then((value) async {
      setState(() {
        listProvinsi = [];
        listProvinsi = value;

        menuProvinsi.add("-Pilih-");
        for (int i = 0; i < listProvinsi.length; i++) {
          menuProvinsi.add(listProvinsi[i].nama);
        }
      });
    });
  }

  Future<void> getDetailKotKab(String idProv) async {
    DetailKotKab.getData(idProv).then((value) async {
      setState(() {
        listKotKab = [];
        listKotKab = value;

        menuKotKab = [];
        menuKotKab.add("-Pilih-");
        for (int i = 0; i < listKotKab.length; i++) {
          menuKotKab.add(listKotKab[i].nama);
        }
      });
    });
  }

  Future<void> getDetailKecamatan(String idKotKab) async {
    DetailKecamatan.getData(idKotKab).then((value) async {
      setState(() {
        listKecamatan = [];
        listKecamatan = value;

        menuKecamatan = [];
        menuKecamatan.add("-Pilih-");
        for (int i = 0; i < listKecamatan.length; i++) {
          menuKecamatan.add(listKecamatan[i].nama);
        }
      });
    });
  }

  Future<void> getDetailKelurahan(String idKecamatan) async {
    DetailKelurahan.getData(idKecamatan).then((value) async {
      setState(() {
        listKelurahan = [];
        listKelurahan = value;

        menuKelurahan = [];
        menuKelurahan.add("-Pilih-");
        for (int i = 0; i < listKelurahan.length; i++) {
          menuKelurahan.add(listKelurahan[i].nama);
        }
      });
    });
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
            "Form Daftar Akun",
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
              Row(
                children: [
                  Text(
                    'Email',
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
              FormFieldTemplate("email", emailctr),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Nomor Telephone',
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
              FormFieldTemplate("telephone", notelpctr),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Alamat Domisili',
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
              FormFieldTemplate("alamat", alamatdctr),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Provinsi',
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
                      items: menuProvinsi.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black, fontSize: 15)),
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          String idProvinsi = "";
                          dropProvinsi = newValue!;
                          for (int i = 0; i < listProvinsi.length; i++) {
                            if (listProvinsi[i].nama == dropProvinsi) {
                              idProvinsi =
                                  listProvinsi[i].idProvinsi.toString();
                            }
                          }
                          getDetailKotKab(idProvinsi);
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Kabupaten/Kota',
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
                      items: menuKotKab.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          String idKotKab = "";
                          dropKota = newValue!;
                          for (int i = 0; i < listKotKab.length; i++) {
                            if (listKotKab[i].nama == dropKota) {
                              idKotKab = listKotKab[i].idKotKab.toString();
                            }
                          }
                          getDetailKecamatan(idKotKab);
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Kecamatan',
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
                      items: menuKecamatan.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          String idKecamatan = "";
                          dropKec = newValue!;
                          for (int i = 0; i < listKecamatan.length; i++) {
                            if (listKecamatan[i].nama == dropKec) {
                              idKecamatan =
                                  listKecamatan[i].idKecamatan.toString();
                            }
                          }
                          getDetailKecamatan(idKecamatan);
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Kelurahan',
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
                      items: menuKelurahan.map((item) {
                        return DropdownMenuItem(
                          child: Text(
                            item,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                          ),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          String idKelurahan = "";
                          dropKelu = newValue!;
                          for (int i = 0; i < listKelurahan.length; i++) {
                            if (listKelurahan[i].nama == dropKelu) {
                              idKelurahan =
                                  listKelurahan[i].idKelurahan.toString();
                            }
                          }
                          getDetailKelurahan(idKelurahan);
                        });
                      },
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Password',
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
              Container(
                height: 50,
                child: TextField(
                  controller: passctr,
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
              Row(
                children: [
                  Text(
                    'Konfirmasi Password',
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
              Container(
                height: 50,
                child: TextField(
                  controller: konfpassctr,
                  onChanged: (value) {
                    if (value != passctr.text) {
                      setState(() {
                        message = "password tidak sama";
                      });
                    } else {
                      setState(() {
                        message = "";
                      });
                    }
                  },
                  obscureText: hide_konfpass,
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
                            hide_konfpass = !hide_konfpass;
                          });
                        },
                        icon: Icon(
                          hide_pass ? Icons.visibility : Icons.visibility_off,
                          color: Color(int.parse(globals.color_primary)),
                        )),
                  ),
                ),
              ),
              Visibility(
                visible: message != "" ? true : false,
                child: Text(
                  message,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: Color(int.parse(globals.color_secondary)))),
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
                        if (emailctr.text != "" &&
                            notelpctr.text != "" &&
                            alamatdctr.text != "" &&
                            passctr.text != "" &&
                            konfpassctr.text != "" &&
                            is_selected == true &&
                            dropProvinsi != "-Pilih-" &&
                            dropKota != "-Pilih-" &&
                            dropKelu != "-Pilih-" &&
                            dropKec != "-Pilih-") {
                          if (globals.status_user == "majikan") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const IntroVerifikasi()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpInputD()));
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Text(
                                    'Silahkan mengisi bagian yang diberi tanda * atau melakukan klik centang untuk persetujuan',
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
      maxLines: fill == "alamat" ? 4 : 1,
    ),
  );
}
