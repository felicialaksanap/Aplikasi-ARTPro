// ignore_for_file: prefer_const_constructors

import 'package:artpro_application_new/listloker.dart';
import 'package:artpro_application_new/profileedit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.asset(
                'assets/images/logo_theme.png',
                width: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Delaney Hill',
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileEdit()));
                              },
                              icon: Icon(
                                Icons.create,
                                size: 20,
                                color: Color(int.parse(globals.color_primary)),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'keeling.horacio@email.com',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 67, 67, 67))),
                      ),
                      Text(
                        '+6281246053145',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 67, 67, 67))),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 1,
                color: Colors.black26,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileEdit()));
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
                        "Ubah Profile Akun",
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
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ListLoker()));
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
                        "Buka Lowongan Kerja",
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
                        "Bantuan",
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
                        "Kebijakan Privasi",
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
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(int.parse(globals.color_secondary)),
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
                        "Keluar",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ),
                      Text(
                        ">>>>>",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Versi App.\n 1.0",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 10)),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
