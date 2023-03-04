// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as globals;
import './verifktp_satu.dart';

class IntroVerifikasi extends StatefulWidget {
  const IntroVerifikasi({super.key});

  @override
  State<IntroVerifikasi> createState() => _IntroVerifikasiState();
}

class _IntroVerifikasiState extends State<IntroVerifikasi> {
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
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/check_done.gif",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Pendaftaran akun berhasil, Yuk sekalian Verifikasi KTP mu",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Color(int.parse(globals.color_primary)),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifikasiKTPS()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(int.parse(globals.color_primary)),
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
        ),
      ),
    );
  }
}
