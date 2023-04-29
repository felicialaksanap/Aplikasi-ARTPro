// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:artpro_application_new/mainberanda.dart';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './global.dart' as globals;
import './loginmenu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<AkunUser> listAkunUser = [];
  List<ProfileUser> listProfileUser = [];
  List<DomisiliUser> listDomisiliUser = [];
  List<DetailProfileART> listDetailProfART = [];
  List<DetailKerjaART> listDetailKerjaART = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedprefAkunUser();
  }

  navigationpage() async {
    await Future.delayed(
      const Duration(milliseconds: 5000),
      () {},
    );

    if (globals.status_user != "") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const MainBeranda()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginMenu()));
    }
  }

  void getSharedprefAkunUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    globals.email = prefs.getString("email") ?? "";
    globals.password = prefs.getString("password") ?? "";

    if (globals.email != "") {
      AkunUser.getData(globals.email, globals.password).then((value) {
        setState(() {
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
          }
        });
      });
    }

    navigationpage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Teman Digital\nMencari\nART",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.black),
                    )),
              ],
            ),
            Image.asset(
              'assets/images/splash_screen.jpg',
              width: MediaQuery.of(context).size.width,
            ),
            CircularProgressIndicator(
              color: Color(int.parse(globals.color_primary)),
              strokeWidth: 5,
            )
          ],
        ),
      ),
    );
  }
}
