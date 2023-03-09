import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';

class DetailART extends StatefulWidget {
  const DetailART({super.key});

  @override
  State<DetailART> createState() => _DetailARTState();
}

class _DetailARTState extends State<DetailART> {
  int _length = 3;
  List<double> values1 = [0.4, 0.8, 0.65];
  List<double> values2 = [0.5, 0.3, 0.85];

  void _incrementCounter() {
    setState(() {
      final random = Random(12341);
      _length++;
      values1.add(random.nextDouble());
      values2.add(random.nextDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    const ticks = [7, 14, 21, 28, 35];
    var features = ["Etika", "Estetika", "Kebersihan", "Kecepatan", "Kerapian"];
    var data = [
      [10, 20, 28, 5, 16]
    ];

    features = features.sublist(0, 5);
    data = data
        .map(
          (graph) => graph.sublist(0, 5),
        )
        .toList();
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  child: Stack(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    MListART.isiListART[0].gambarUrl),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(50.0)),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 50,
                          padding: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Color(int.parse(globals.color_primary)),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            MListART.isiListART[0].rating,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Pembantu Rumah Tangga | Warnen",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rp 2.000.000 - 3.500.000",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Informasi Pribadi",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Lengkap",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          MListART.isiListART[0].nama,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jenis Kelamin",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Perempuan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tanggal Lahir",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "03-07-2003 | ${MListART.isiListART[0].umur}",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pendidikan Terakhir",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "SMA",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tempat Tinggal",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Kec. Tambaksari, Kota Surabaya | ${MListART.isiListART[0].jarak}",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 135),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Berat Badan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "50 kg",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 15)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Tinggi Badan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "155 cm",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 15)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Agama",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Katolik",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 15)),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Pengalaman Kerja",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Quisque at ut odio ullamcorper. Gravida egestas urna massa egestas sit habitant. Sed quam nisl tristique adipiscing dolor vel nisl. Morbi duis id fermentum diam est.",
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Keterangan Lain",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 217, 217, 217),
                          width: 1)),
                  child: Text(
                    "Tidak takut hewan",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 14)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 217, 217, 217),
                          width: 1)),
                  child: Text(
                    "Tidak mabuk perjalanan",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 14)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 217, 217, 217),
                          width: 1)),
                  child: Text(
                    "Sepeda Motor",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 14)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      border: Border.all(
                          color: const Color.fromARGB(255, 217, 217, 217),
                          width: 1)),
                  child: Text(
                    "Memasak",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 14)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
                  decoration: BoxDecoration(
                      color: Color(int.parse(globals.color_primary)),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0))),
                  child: Text(
                    "Sertifikat Pelatihan",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Lihat semua >>",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(int.parse(globals.color_primary)))),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color.fromARGB(255, 217, 217, 217)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: const Color.fromARGB(255, 217, 217, 217)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 350,
              child: RadarChart.light(
                ticks: ticks,
                features: features,
                data: data,
                reverseAxis: true,
                useSides: true,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(4, 4, 32, 4),
              decoration: BoxDecoration(
                  color: Color(int.parse(globals.color_primary)),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0))),
              child: Text(
                "Komentar & Review",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
