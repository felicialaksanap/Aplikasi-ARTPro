import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class ListLoker extends StatefulWidget {
  const ListLoker({super.key});

  @override
  State<ListLoker> createState() => _ListLokerState();
}

class _ListLokerState extends State<ListLoker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Color(int.parse(globals.color_primary)),
                  ),
                ),
                Image.asset(
                  'assets/images/logo_theme.png',
                  width: 110,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Lowongan Kerja",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
            ),
            ListView.builder(
                itemCount: MListLoker.isiListLoker.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(MListLoker.isiListLoker[index].kriteria),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
