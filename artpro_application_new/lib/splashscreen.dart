// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './loginmenu.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigation();
  }

  _navigation() async {
    await Future.delayed(
      const Duration(milliseconds: 5000),
      () {},
    );

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginMenu()));
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
