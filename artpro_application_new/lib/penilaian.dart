import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as globals;

class Penilaian extends StatefulWidget {
  const Penilaian({super.key});

  @override
  State<Penilaian> createState() => _PenilaianState();
}

class _PenilaianState extends State<Penilaian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Color(int.parse(globals.color_primary)),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ));
  }
}
