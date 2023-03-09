// ignore_for_file: prefer_final_fields

import 'package:artpro_application_new/beranda.dart';
import 'package:artpro_application_new/karir.dart';
import 'package:artpro_application_new/profilemenu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class MainBeranda extends StatefulWidget {
  const MainBeranda({super.key});

  @override
  State<MainBeranda> createState() => _MainBerandaState();
}

class _MainBerandaState extends State<MainBeranda> {
  int _selectIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    const Beranda(),
    const Karir(),
    const ProfileMenu()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Karir'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Profile'),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Color(int.parse(globals.color_primary)),
        unselectedItemColor: const Color.fromARGB(255, 67, 67, 67),
        onTap: _onItemTapped,
      ),
    );
  }
}
