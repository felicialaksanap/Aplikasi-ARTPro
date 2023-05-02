// ignore_for_file: sort_child_properties_last

import 'package:artpro_application_new/detailloker.dart';
import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:artpro_application_new/tambahloker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class ListLoker extends StatefulWidget {
  const ListLoker({super.key});

  @override
  State<ListLoker> createState() => _ListLokerState();
}

class _ListLokerState extends State<ListLoker> {
  bool inapSelect = false;
  bool warnenSelect = false;
  double curLokasiVal = 0.0;
  bool prtSel = false;
  bool babySel = false;
  bool seniorSel = false;
  bool supirSel = false;
  bool officeSel = false;
  bool gardenerSel = false;
  bool petSelect = false;
  bool motorSel = false;
  bool mobilSel = false;
  bool maPerSel = false;
  bool masakSel = false;

  List<String> kriteria = [];
  String tempkriteria = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < MListLoker.isiListLoker.length; i++) {
      for (int j = 0; j < MListLoker.isiListLoker[i].kriteria.length; j++) {
        if (j != MListLoker.isiListLoker[i].kriteria.length - 1) {
          tempkriteria =
              tempkriteria + MListLoker.isiListLoker[i].kriteria[j] + ", ";
        } else {
          tempkriteria = tempkriteria + MListLoker.isiListLoker[i].kriteria[j];
        }
      }
      kriteria.add(tempkriteria);
      tempkriteria = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Color(int.parse(globals.color_primary))),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(int.parse(globals.color_primary)),
              )),
          title: globals.status_user == "majikan"
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/logo_theme.png',
                      width: 100,
                    ),
                  ],
                )
              : Container(),
          actions: [
            globals.status_user == "pekerja"
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Builder(builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Row(
                          children: [
                            const Icon(Icons.filter_list_alt),
                            Text(
                              'Filter',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Color(
                                          int.parse(globals.color_primary)),
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      );
                    }),
                  )
                : Container()
          ],
        ),
        endDrawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      color: Color(int.parse(globals.color_primary)),
                    ),
                    Positioned(
                      right: 0,
                      top: 5,
                      child: Image.asset(
                        'assets/images/logo_light.png',
                        height: 110,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Jenis Bekerja",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          inapSelect = !inapSelect;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: inapSelect
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: inapSelect ? 2 : 1)),
                        child: Text("Menginap",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          warnenSelect = !warnenSelect;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: warnenSelect
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: warnenSelect ? 2 : 1)),
                        child: Text("Warnen",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    )
                  ],
                ),
                Visibility(
                    visible: warnenSelect == true ? true : false,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Jarak Lokasi",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "0 km",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                              Text(
                                "5.250 km",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 15)),
                              ),
                            ],
                          ),
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              valueIndicatorColor:
                                  Color(int.parse(globals.color_secondary)),
                              valueIndicatorTextStyle: GoogleFonts.poppins(
                                  textStyle:
                                      const TextStyle(color: Colors.white))),
                          child: Slider(
                              value: curLokasiVal,
                              max: 5250,
                              divisions: 10,
                              activeColor:
                                  Color(int.parse(globals.color_primary)),
                              thumbColor:
                                  Color(int.parse(globals.color_primary)),
                              inactiveColor: const Color(0x1A246A73),
                              label: curLokasiVal.round().toString(),
                              onChanged: (value) {
                                setState(() {
                                  curLokasiVal = value;
                                });
                              }),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Range Gaji(Rp)",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130,
                      height: 30,
                      child: TextField(
                        cursorColor: Color(int.parse(globals.color_primary)),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: 'Min',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 217, 217, 217)),
                            ),
                            contentPadding: const EdgeInsets.only(top: 2)),
                      ),
                    ),
                    Text(
                      "  -  ",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      width: 130,
                      height: 30,
                      child: TextField(
                        cursorColor: Color(int.parse(globals.color_primary)),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 217, 217, 217)),
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: 'Max',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 217, 217, 217)),
                            ),
                            contentPadding: const EdgeInsets.only(top: 2)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Kategori",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            prtSel = !prtSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: prtSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: prtSel ? 2 : 1)),
                          child: Text("Pekerja Rumah Tangga",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            babySel = !babySel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: babySel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: babySel ? 2 : 1)),
                          child: Text("Baby Sitter",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            seniorSel = !seniorSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: seniorSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: seniorSel ? 2 : 1)),
                          child: Text("Penjaga Lansia",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            supirSel = !supirSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: supirSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: supirSel ? 2 : 1)),
                          child: Text("Supir Pribadi",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            officeSel = !officeSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: officeSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: officeSel ? 2 : 1)),
                          child: Text("Office Boy / Girl",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            gardenerSel = !gardenerSel;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              border: Border.all(
                                  color: gardenerSel
                                      ? Color(int.parse(globals.color_primary))
                                      : const Color.fromARGB(
                                          255, 217, 217, 217),
                                  width: gardenerSel ? 2 : 1)),
                          child: Text("Tukang Kebun",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14))),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Lain - Lain",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        petSelect = !petSelect;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: petSelect
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: petSelect ? 2 : 1)),
                      child: Text("Tidak Takut Hewan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        motorSel = !motorSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: motorSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: motorSel ? 2 : 1)),
                      child: Text("Menyetir Sepeda Motor",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        mobilSel = !mobilSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: mobilSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: mobilSel ? 2 : 1)),
                      child: Text("Menyetir Mobil",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maPerSel = !maPerSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: maPerSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: maPerSel ? 2 : 1)),
                      child: Text("Tidak Mabuk Perjalanan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        masakSel = !masakSel;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          border: Border.all(
                              color: masakSel
                                  ? Color(int.parse(globals.color_primary))
                                  : const Color.fromARGB(255, 217, 217, 217),
                              width: masakSel ? 2 : 1)),
                      child: Text("Memasak",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 14))),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: globals.status_user == "pekerja" ? false : true,
                child: Text(
                  "Lowongan Kerja Saat Ini :",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: MListLoker.isiListLoker.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailLoker(
                                            index: index,
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              elevation: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      MListLoker.isiListLoker[index].judul,
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Color(int.parse(
                                                  globals.color_primary)))),
                                    ),
                                    Text(
                                      index != 1
                                          ? "Ibu ${MListLoker.isiListLoker[index].namamajikan}"
                                          : "Bapak ${MListLoker.isiListLoker[index].namamajikan}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "${MListLoker.isiListLoker[index].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                    Text(
                                      "${MListLoker.isiListLoker[index].rangegaji} per bulan",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "${MListLoker.isiListLoker[index].informasi}",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                        fontSize: 13,
                                      )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Post pada ${MListLoker.isiListLoker[index].tglpost}",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black)),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                MListLoker.isiListLoker[index]
                                                        .expand =
                                                    !MListLoker
                                                        .isiListLoker[index]
                                                        .expand;
                                              });
                                            },
                                            icon: MListLoker.isiListLoker[index]
                                                        .expand ==
                                                    false
                                                ? Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: Color(int.parse(
                                                        globals.color_primary)),
                                                  )
                                                : Icon(
                                                    Icons
                                                        .keyboard_arrow_up_rounded,
                                                    color: Color(int.parse(
                                                        globals.color_primary)),
                                                  ))
                                      ],
                                    ),
                                    Visibility(
                                        visible: MListLoker.isiListLoker[index]
                                                    .expand ==
                                                true
                                            ? true
                                            : false,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Kriteria",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              kriteria[index],
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13)),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Kategori Pekerjaan",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              MListLoker
                                                  .isiListLoker[index].kategori,
                                              style: GoogleFonts.poppins(
                                                  textStyle: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(int.parse(
                                                          globals
                                                              .color_primary)))),
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
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
        floatingActionButton: Visibility(
          visible: globals.status_user == "pekerja" ? false : true,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TambahLoker()));
            },
            backgroundColor: Color(int.parse(globals.color_primary)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
        ));
  }
}
