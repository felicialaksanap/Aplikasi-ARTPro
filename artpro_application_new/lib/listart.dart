import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';
import './detailart.dart';

class ListART extends StatefulWidget {
  String konten;
  ListART({super.key, required this.konten});

  @override
  State<ListART> createState() => _ListARTState();
}

class _ListARTState extends State<ListART> {
  bool inapSelect = false;
  bool warnenSelect = false;
  double curLokasiVal = 0.0;
  bool islamSel = false;
  bool katolikSel = false;
  bool kristenSel = false;
  bool hinduSel = false;
  bool budhaSel = false;
  bool konghucuSel = false;
  bool singleSel = false;
  bool marriedSel = false;
  bool petSelect = false;
  bool motorSel = false;
  bool mobilSel = false;
  bool maPerSel = false;
  bool masakSel = false;

  List<String> kriteria = [];
  String tempkriteria = "";

  List<String> kategori = [];
  String tempkategori = "";

  String titlekategori = "";

  bool getAlldata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getListARTbyKategori();

    if (widget.konten == "prt") {
      titlekategori = "Pembantu Rumah Tangga";
    } else if (widget.konten == "babysitter") {
      titlekategori = "Baby Sitter";
    } else if (widget.konten == "seniorcare") {
      titlekategori = "Penjaga Lansia";
    } else if (widget.konten == "supir") {
      titlekategori = "Supir";
    } else if (widget.konten == "officeboy") {
      titlekategori = "Office Boy / Girl";
    } else if (widget.konten == "tukangkebun") {
      titlekategori = "Tukang Kebun";
    }
  }

  void getListARTbyKategori() {
    DataARTbyKategori.getData(widget.konten).then((value) {
      setState(() {
        globals.listARTbyKategori.clear();
        globals.listARTbyKategori = value;

        for (int i = 0; i < globals.listARTbyKategori.length; i++) {
          // arrange kategori to string
          if (globals.listARTbyKategori[i].kprt == 1) {
            tempkategori = tempkategori + "Pembantu Rumah Tangga, ";
          }
          if (globals.listARTbyKategori[i].kbabysitter == 1) {
            tempkategori = tempkategori + "Babysitter, ";
          }
          if (globals.listARTbyKategori[i].kseniorcare == 1) {
            tempkategori = tempkategori + "Pendamping Lansia, ";
          }
          if (globals.listARTbyKategori[i].ksupir == 1) {
            tempkategori = tempkategori + "Supir, ";
          }
          if (globals.listARTbyKategori[i].kofficeboy == 1) {
            tempkategori = tempkategori + "Office Boy / Girl, ";
          }
          if (globals.listARTbyKategori[i].ktukangkebun == 1) {
            tempkategori = tempkategori + "Tukang Kebun, ";
          }
          tempkategori = tempkategori.substring(0, tempkategori.length - 2);
          kategori.add(tempkategori);
          tempkategori = "";

          // arrange kriteria to string
          if (globals.listARTbyKategori[i].hewan == 1) {
            tempkriteria = tempkriteria + "Tidak takut hewan, ";
          }
          if (globals.listARTbyKategori[i].masak == 1) {
            tempkriteria = tempkriteria + "Memasak, ";
          }
          if (globals.listARTbyKategori[i].mabukjalan == 1) {
            tempkriteria = tempkriteria + "Tidak mabuk perjalanan, ";
          }
          if (globals.listARTbyKategori[i].sepedamotor == 1) {
            tempkriteria = tempkriteria + "Menyetir sepeda motor, ";
          }
          if (globals.listARTbyKategori[i].mobil == 1) {
            tempkriteria = tempkriteria + "Menyetir mobil, ";
          }
          if (globals.listARTbyKategori[i].tkmenginap == 1) {
            tempkriteria = tempkriteria + "Menginap, ";
          }
          if (globals.listARTbyKategori[i].tkwarnen == 1) {
            tempkriteria = tempkriteria + "Warnen, ";
          }
          if (globals.listARTbyKategori[i].ssingle == 1) {
            tempkriteria = tempkriteria + "Belum menikah, ";
          }
          if (globals.listARTbyKategori[i].smarried == 1) {
            tempkriteria = tempkriteria + "Sudah menikah, ";
          }
          tempkriteria = tempkriteria.substring(0, tempkriteria.length - 2);
          kriteria.add(tempkriteria);
          tempkriteria = "";
        }

        getAlldata = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme:
              IconThemeData(color: Color(int.parse(globals.color_primary))),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(int.parse(globals.color_primary)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Builder(builder: (BuildContext context) {
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
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              );
            }),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      "Pengalaman Kerja",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
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
                      "Agama",
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
                          islamSel = !islamSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: islamSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: islamSel ? 2 : 1)),
                        child: Text("Islam",
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
                          katolikSel = !katolikSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: katolikSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: katolikSel ? 2 : 1)),
                        child: Text("Katolik",
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
                          kristenSel = !kristenSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: kristenSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: kristenSel ? 2 : 1)),
                        child: Text("Kristen",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    )
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
                          hinduSel = !hinduSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: hinduSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: hinduSel ? 2 : 1)),
                        child: Text("Hindu",
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
                          budhaSel = !budhaSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: budhaSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: budhaSel ? 2 : 1)),
                        child: Text("Buddha",
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
                          konghucuSel = !konghucuSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: konghucuSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: konghucuSel ? 2 : 1)),
                        child: Text("Konghucu",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
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
                      "Status Pernikahan",
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
                          singleSel = !singleSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: singleSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: singleSel ? 2 : 1)),
                        child: Text("Single",
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
                          marriedSel = !marriedSel;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            border: Border.all(
                                color: marriedSel
                                    ? Color(int.parse(globals.color_primary))
                                    : const Color.fromARGB(255, 217, 217, 217),
                                width: marriedSel ? 2 : 1)),
                        child: Text("Menikah",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 14))),
                      ),
                    ),
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
                      "Kriteria",
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              side: BorderSide(
                                  width: 1,
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                          child: Text(
                            "Batal",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          )),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  Color(int.parse(globals.color_secondary)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text(
                            "Terapkan",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500)),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        body: getAlldata == false
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Color(int.parse(globals.color_primary)),
                      strokeWidth: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Memuat data ...",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)))),
                    )
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kategori: $titlekategori",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: globals.listARTbyKategori.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  globals.kriteria.clear();

                                  if (globals.listARTbyKategori[index].hewan ==
                                      1) {
                                    globals.kriteria.add("Tidak takut hewan");
                                  }
                                  if (globals.listARTbyKategori[index].masak ==
                                      1) {
                                    globals.kriteria.add("Memasak");
                                  }
                                  if (globals.listARTbyKategori[index]
                                          .mabukjalan ==
                                      1) {
                                    globals.kriteria
                                        .add("Tidak mabuk perjalanan");
                                  }
                                  if (globals.listARTbyKategori[index]
                                          .sepedamotor ==
                                      1) {
                                    globals.kriteria
                                        .add("Menyetir sepeda motor");
                                  }
                                  if (globals.listARTbyKategori[index].mobil ==
                                      1) {
                                    globals.kriteria.add("Menyetir mobil");
                                  }
                                  if (globals.listARTbyKategori[index]
                                          .tkmenginap ==
                                      1) {
                                    globals.kriteria.add("Menginap");
                                  }
                                  if (globals
                                          .listARTbyKategori[index].tkwarnen ==
                                      1) {
                                    globals.kriteria.add("Warnen");
                                  }
                                  if (globals
                                          .listARTbyKategori[index].ssingle ==
                                      1) {
                                    globals.kriteria.add("Belum menikah");
                                  }
                                  if (globals
                                          .listARTbyKategori[index].smarried ==
                                      1) {
                                    globals.kriteria.add("Sudah menikah");
                                  }
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailART(
                                              index: index,
                                              kategori: kategori[index],
                                            )));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 70,
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            '${globals.urlapi}getimage?id=${globals.listARTbyKategori[index].idart}&folder=profpic'),
                                                        fit: BoxFit.fill)),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 0,
                                              child: Container(
                                                width: 40,
                                                padding:
                                                    const EdgeInsets.all(2.0),
                                                decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                        globals.color_primary)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0)),
                                                child: Text(
                                                  globals
                                                      .listARTbyKategori[index]
                                                      .rating
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      textStyle:
                                                          const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  )),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              globals.listARTbyKategori[index]
                                                  .namalengkap,
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Asal: ${globals.listARTbyKategori[index].tempatlahir}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 14,
                                              )),
                                            ),
                                            Text(
                                              "Agama: ${globals.listARTbyKategori[index].agama}",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 14,
                                              )),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Penawaran Gaji",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              "Rp ${globals.listARTbyKategori[index].gajiawal} - ${globals.listARTbyKategori[index].gajiakhir} per bulan",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 13,
                                              )),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
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
                                                fontSize: 13,
                                              )),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Kategori",
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              kategori[index],
                                              style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                fontSize: 13,
                                              )),
                                            )
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.call,
                                            size: 30,
                                            color: Color(int.parse(
                                                globals.color_primary)),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ));
  }
}
