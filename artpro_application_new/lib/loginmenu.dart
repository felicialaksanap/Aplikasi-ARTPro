// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './mainberanda.dart';
import './signupmenu.dart';

class LoginMenu extends StatefulWidget {
  const LoginMenu({super.key});

  @override
  State<LoginMenu> createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> {
  bool hide_pass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainBeranda()));
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
    );
  }
}
