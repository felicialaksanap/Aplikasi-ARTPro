import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as globals;
import 'signupinput.dart';

class SignUpMenu extends StatefulWidget {
  const SignUpMenu({super.key});

  @override
  State<SignUpMenu> createState() => _SignUpMenuState();
}

class _SignUpMenuState extends State<SignUpMenu> {
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
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(
              'assets/images/signup_menu.jpg',
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Mendaftar sebagai apa?',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    globals.status_user = "majikan";
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpInput()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(int.parse(globals.color_primary)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Text(
                  "Pemberi Kerja",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
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
                  setState(() {
                    globals.status_user = "pekerja";
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpInput()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    side: BorderSide(
                        width: 2,
                        color: Color(int.parse(globals.color_primary)))),
                child: Text(
                  "Pekerja",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(int.parse(globals.color_primary)))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
