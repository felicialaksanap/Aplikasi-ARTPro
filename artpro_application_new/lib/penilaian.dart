import 'package:artpro_application_new/customize/custom_slider_thumb_circle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as globals;

class Penilaian extends StatefulWidget {
  const Penilaian({super.key});

  @override
  State<Penilaian> createState() => _PenilaianState();
}

class _PenilaianState extends State<Penilaian> {
  String pathsmile = "assets/icons/smile-green.png";
  String pathsmilealt = "assets/icons/smile-alt-green.png";
  String pathdis = "assets/icons/dis-green.png";

  double estval = 0.0;
  double etval = 0.0;
  double kebval = 0.0;
  double kecval = 0.0;
  double kerval = 0.0;
  double average = 0.0;

  TextEditingController komenctr = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    komenctr.dispose();
  }

  void calAverage() {
    setState(() {
      average = (estval + etval + kebval + kecval + kerval) / 5;
      print("average: $average");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        title: Text(
          "Penilaian",
          style: GoogleFonts.poppins(
              textStyle:
                  TextStyle(color: Color(int.parse(globals.color_primary)))),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      image: const DecorationImage(
                          image: AssetImage('assets/images/person-5.jpg'),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Michelle Maryati',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "Pembantu Rumah Tangga",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 138, 138, 138))),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Nilai per Indikator",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Estetika",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       Text(
                      //         "1",
                      //         style: GoogleFonts.poppins(
                      //             textStyle: const TextStyle(fontSize: 15)),
                      //       ),
                      //       Text(
                      //         "5",
                      //         style: GoogleFonts.poppins(
                      //             textStyle: const TextStyle(fontSize: 15)),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor:
                                Color(int.parse(globals.color_secondary)),
                            valueIndicatorTextStyle: GoogleFonts.poppins(
                                textStyle:
                                    const TextStyle(color: Colors.white))),
                        child: Slider(
                            value: estval,
                            max: 5,
                            divisions: 5,
                            activeColor:
                                Color(int.parse(globals.color_primary)),
                            thumbColor: Color(int.parse(globals.color_primary)),
                            inactiveColor: const Color(0x1A246A73),
                            label: estval.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                estval = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Etika",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor:
                                Color(int.parse(globals.color_secondary)),
                            valueIndicatorTextStyle: GoogleFonts.poppins(
                                textStyle:
                                    const TextStyle(color: Colors.white))),
                        child: Slider(
                            value: etval,
                            max: 5,
                            divisions: 5,
                            activeColor:
                                Color(int.parse(globals.color_primary)),
                            thumbColor: Color(int.parse(globals.color_primary)),
                            inactiveColor: const Color(0x1A246A73),
                            label: etval.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                etval = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kebersihan",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor:
                                Color(int.parse(globals.color_secondary)),
                            valueIndicatorTextStyle: GoogleFonts.poppins(
                                textStyle:
                                    const TextStyle(color: Colors.white))),
                        child: Slider(
                            value: kebval,
                            max: 5,
                            divisions: 5,
                            activeColor:
                                Color(int.parse(globals.color_primary)),
                            thumbColor: Color(int.parse(globals.color_primary)),
                            inactiveColor: const Color(0x1A246A73),
                            label: kebval.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                kebval = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kecepatan",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            valueIndicatorColor:
                                Color(int.parse(globals.color_secondary)),
                            valueIndicatorTextStyle: GoogleFonts.poppins(
                                textStyle:
                                    const TextStyle(color: Colors.white))),
                        child: Slider(
                            value: kecval,
                            max: 5,
                            divisions: 5,
                            activeColor:
                                Color(int.parse(globals.color_primary)),
                            thumbColor: Color(int.parse(globals.color_primary)),
                            inactiveColor: const Color(0x1A246A73),
                            label: kecval.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                kecval = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kerapian",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor:
                              Color(int.parse(globals.color_primary)),
                          inactiveTrackColor: const Color(0x1A246A73),
                          trackHeight: 4,
                          // valueIndicatorColor:
                          //     Color(int.parse(globals.color_secondary)),
                          // valueIndicatorTextStyle: GoogleFonts.poppins(
                          //     textStyle:
                          //         const TextStyle(color: Colors.white)),
                          thumbShape: const CustomSliderThumbCircle(
                              thumbRadius: 48 * .3, min: 0, max: 5),
                          thumbColor: Colors.white,
                          overlayColor: const Color.fromARGB(50, 36, 106, 115),
                          activeTickMarkColor:
                              Color(int.parse(globals.color_primary)),
                          inactiveTickMarkColor: Colors.red.withOpacity(.7),
                        ),
                        child: Slider(
                            value: kerval,
                            // max: 5,
                            // divisions: 5,
                            // activeColor:
                            //     Color(int.parse(globals.color_primary)),
                            // thumbColor: Color(int.parse(globals.color_primary)),
                            // inactiveColor: const Color(0x1A246A73),
                            // label: kerval.round().toString(),
                            onChanged: (value) {
                              setState(() {
                                kerval = value;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: const Color.fromARGB(255, 138, 138, 138),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Komentar & Review",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                controller: komenctr,
                cursorColor: Color(int.parse(globals.color_primary)),
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 15, color: Colors.black)),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(int.parse(globals.color_primary)),
                          width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color(int.parse(globals.color_primary)),
                          width: 1.0),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    hintText: "Tulis komentar & review di sini",
                    hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138)))),
                maxLines: 7,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      calAverage();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      "Kirim Penilaian",
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
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
