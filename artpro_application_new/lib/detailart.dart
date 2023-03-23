import 'package:artpro_application_new/listkomen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_charts/multi_charts.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';

class DetailART extends StatefulWidget {
  const DetailART({super.key});

  @override
  State<DetailART> createState() => _DetailARTState();
}

class _DetailARTState extends State<DetailART> {
  List<String> ketlain = [
    "Tidak takut hewan",
    "Mabuk perjalanan",
    "Sepeda Motor",
    "Memasak"
  ];

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
            Container(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ketlain.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 217, 217, 217),
                            width: 1)),
                    child: Center(
                      child: Text(
                        ketlain[index],
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 14)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
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
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color:
                                    const Color.fromARGB(255, 217, 217, 217)),
                          ),
                          Text(
                            "title",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 15)),
                          )
                        ],
                      ),
                      index == 4
                          ? const SizedBox(
                              width: 0,
                            )
                          : const SizedBox(
                              width: 10,
                            )
                    ],
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
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
                    "Penilaian",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: 350,
                height: 350,
                child: RadarChart(
                  values: const [1, 2, 4, 7, 9],
                  labels: const [
                    "Etika",
                    "Estetika",
                    "Kebersihan",
                    "Kerapian",
                    "Kecepatan"
                  ],
                  strokeColor: Color(int.parse(globals.color_primary)),
                  labelColor: Color(int.parse(globals.color_primary)),
                  maxValue: 10,
                  fillColor: Color(int.parse(globals.color_secondary)),
                  chartRadiusFactor: 0.7,
                ),
              ),
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
                    "Komentar & Review",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListKomen()));
                    },
                    child: Text(
                      "Lihat semua >>",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  Color(int.parse(globals.color_secondary)))),
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 400,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        image: DecorationImage(
                                            image: AssetImage(MListKomen
                                                .isiKomen[index].foto),
                                            fit: BoxFit.fill)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        MListKomen.isiKomen[index].nama,
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                        MListKomen.isiKomen[index].tanggal,
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                    255, 138, 138, 138))),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                MListKomen.isiKomen[index].isikomen,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          color: const Color.fromARGB(255, 138, 138, 138),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
