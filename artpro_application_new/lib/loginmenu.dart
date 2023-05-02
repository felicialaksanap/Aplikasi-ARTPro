// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:artpro_application_new/beranda.dart';
import 'package:artpro_application_new/editakun.dart';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './global.dart' as globals;
import './mainberanda.dart';
import './signupmenu.dart';
import 'package:artpro_application_new/services/services.dart';

class LoginMenu extends StatefulWidget {
  const LoginMenu({super.key});

  @override
  State<LoginMenu> createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> {
  TextEditingController emailctr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  bool hide_pass = true;

  List<AkunUser> listAkunUser = [];
  List<ProfileUser> listProfileUser = [];
  List<DomisiliUser> listDomisiliUser = [];
  List<DetailProfileART> listDetailProfART = [];
  List<DetailKerjaART> listDetailKerjaART = [];

  Future<void> getAkunUser() async {
    AkunUser.getData(emailctr.text, passctr.text).then((value) async {
      listAkunUser = value;
      if (listAkunUser.isNotEmpty) {
        globals.iduser = listAkunUser[0].iduser;
        globals.email = listAkunUser[0].email;
        globals.password = listAkunUser[0].password;
        globals.status_user = listAkunUser[0].statususer;

        // GET PROFILE USER
        ProfileUser.getData(globals.iduser).then((value) {
          listProfileUser = value;
          if (listProfileUser.isNotEmpty) {
            globals.namalengkap = listProfileUser[0].namalengkap;
            globals.jeniskelamin = listProfileUser[0].jeniskelamin;
            globals.tempatlahir = listProfileUser[0].tempatlahir;
            globals.tanggallahir = listProfileUser[0].tanggallahir;
            globals.telephone = listProfileUser[0].telephone;
            globals.profpicpathdb = listProfileUser[0].profilepicpath;
          }
        });

        // GET ALAMAT DOMISILI USER
        DomisiliUser.getData(globals.iduser).then((value) {
          listDomisiliUser = value;
          if (listDomisiliUser.isNotEmpty) {
            globals.alamatdom = listDomisiliUser[0].alamat;
            globals.kecdom = listDomisiliUser[0].kecamatan;
            globals.keldom = listDomisiliUser[0].kelurahan;
            globals.provdom = listDomisiliUser[0].provinsi;
            globals.kotadom = listDomisiliUser[0].kota;
            globals.longitude = listDomisiliUser[0].longitude;
            globals.latitude = listDomisiliUser[0].latitude;
          }
        });

        // GET DETAIL ART
        if (globals.status_user == "pekerja") {
          DetailProfileART.getData(globals.iduser).then((value) {
            listDetailProfART = value;
            if (listDetailProfART.isNotEmpty) {
              globals.pendidikanterakhir =
                  listDetailProfART[0].pendidikanterakhir;
              globals.berat = listDetailProfART[0].beratbadan;
              globals.tinggi = listDetailProfART[0].tinggibadan;
              globals.agama = listDetailProfART[0].agama;
              globals.tkmenginap = listDetailProfART[0].tkmenginap;
              globals.tkwarnen = listDetailProfART[0].tkwarnen;
              globals.hewan = listDetailProfART[0].hewan;
              globals.mabukJalan = listDetailProfART[0].mabukjalan;
              globals.spdmotor = listDetailProfART[0].sepedamotor;
              globals.mobil = listDetailProfART[0].mobil;
              globals.masak = listDetailProfART[0].masak;
            }
          });

          DetailKerjaART.getData(globals.iduser).then((value) {
            listDetailKerjaART = value;
            if (listDetailKerjaART.isNotEmpty) {
              globals.kprt = listDetailKerjaART[0].kprt;
              globals.kbabysitter = listDetailKerjaART[0].kbabysitter;
              globals.kseniorcare = listDetailKerjaART[0].kseniorcare;
              globals.ksupir = listDetailKerjaART[0].ksupir;
              globals.kofficeboy = listDetailKerjaART[0].kofficeboy;
              globals.ktukangkebun = listDetailKerjaART[0].ktukangkebun;
              globals.pengalaman = listDetailKerjaART[0].pengalaman;
              globals.gajiawal = listDetailKerjaART[0].gajiawal;
              globals.gajiakhir = listDetailKerjaART[0].gajiakhir;
            }
          });
        }

        sharedprefAkunUser();

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MainBeranda()));
      } else {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    "Email atau password salah",
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          )),
                    )
                  ],
                ));
      }
    });
  }

  sharedprefAkunUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", globals.email);
    prefs.setString("password", globals.password);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Image.asset(
                  'assets/images/login_menu.jpg',
                  width: 300,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Masuk",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.alternate_email,
                  color: Color(int.parse(globals.color_primary)),
                  size: 25,
                ),
                title: TextField(
                  controller: emailctr,
                  cursorColor: Color(int.parse(globals.color_primary)),
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 15, color: Colors.black)),
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(int.parse(globals.color_primary)))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(int.parse(globals.color_primary)))),
                      hintText: 'Enter your username',
                      hintStyle: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 138, 138, 138)))),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.vpn_key,
                  color: Color(int.parse(globals.color_primary)),
                  size: 25,
                ),
                title: TextField(
                  controller: passctr,
                  obscureText: hide_pass,
                  cursorColor: Color(int.parse(globals.color_primary)),
                  style: GoogleFonts.poppins(
                      textStyle:
                          const TextStyle(fontSize: 15, color: Colors.black)),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(int.parse(globals.color_primary)))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(int.parse(globals.color_primary)))),
                    hintText: 'Enter your username',
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
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
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            globals.email = emailctr.text;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EditAkun(kontenEdit: "password")));
                        },
                        child: Text(
                          'forgot password ?',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  decoration: TextDecoration.underline,
                                  color:
                                      Color(int.parse(globals.color_primary)))),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailctr.text != "" && passctr.text != "") {
                      getAkunUser();
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text(
                                'Username atau password yang dimasukkan salah',
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
                                                    globals.color_secondary)))),
                                      )),
                                )
                              ],
                            );
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(int.parse(globals.color_primary)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Text(
                    "Masuk",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'belum punya akun?',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 12,
                        color: Color(int.parse(globals.color_primary)))),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpMenu()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      side: BorderSide(
                          width: 2,
                          color: Color(int.parse(globals.color_primary)))),
                  child: Text(
                    "Buat Akun",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(int.parse(globals.color_primary)))),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
