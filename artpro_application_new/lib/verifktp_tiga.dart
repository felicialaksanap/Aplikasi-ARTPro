import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter_camera_overlay/flutter_camera_overlay.dart';
// import 'package:flutter_camera_overlay/model.dart';
// import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import './global.dart' as globals;
import './sum_verif.dart';

class VerifikasiKTPT extends StatefulWidget {
  const VerifikasiKTPT({super.key});

  @override
  State<VerifikasiKTPT> createState() => _VerifikasiKTPTState();
}

class _VerifikasiKTPTState extends State<VerifikasiKTPT> {
  XFile? imagektp;
  XFile? imageselfiektp;
  final ImagePicker picker = ImagePicker();

  String pathPhoto = "";

  Future getImage(ImageSource media, String take) async {
    var img = await picker.pickImage(source: media);

    if (take == "ktp") {
      setState(() {
        imagektp = img;
        globals.fotoktp = imagektp;
      });
    } else {
      setState(() {
        imageselfiektp = img;
        globals.selfiektp = imageselfiektp;
      });
    }
  }

  // OverlayFormat format = OverlayFormat.cardID1;

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
        title: Text(
          "Formulir Verifikasi",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(int.parse(globals.color_primary)),
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 75,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    color: Color(int.parse(globals.color_secondary)),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 75,
                  height: 10,
                  color: Color(int.parse(globals.color_secondary)),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 75,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color(int.parse(globals.color_secondary)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "3 dari 3",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(int.parse(globals.color_primary)))),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Ambil Foto',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                // KTP
                getImage(ImageSource.gallery, "ktp");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: DottedBorder(
                  color: const Color.fromARGB(255, 138, 138, 138),
                  strokeWidth: 1,
                  dashPattern: const [10, 6],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          color: const Color.fromARGB(255, 138, 138, 138),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Foto KTP",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                            Text(
                              'Ambil foto KTP kamu',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 138, 138, 138),
                                      fontSize: 12)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                // Selfie KTP
                getImage(ImageSource.gallery, "selfiektp");
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: DottedBorder(
                  color: const Color.fromARGB(255, 138, 138, 138),
                  strokeWidth: 1,
                  dashPattern: const [10, 6],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          color: const Color.fromARGB(255, 138, 138, 138),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Selfie dengan KTP",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ),
                              Text(
                                'Ambil foto kamu sambil memegang KTP',
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 138, 138, 138),
                                        fontSize: 12)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SummaryVerifikasi()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
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
          ],
        ),
      ),
    );
  }
}
