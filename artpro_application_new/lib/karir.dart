import 'package:artpro_application_new/listartkarir.dart';
import 'package:artpro_application_new/listlokerkarir.dart';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:developer';
// import 'package:url_launcher/url_launcher.dart';
import './global.dart' as globals;
import 'detailloker.dart';
import 'modeltemp/modeltemp.dart';

class Karir extends StatefulWidget {
  const Karir({super.key});

  @override
  State<Karir> createState() => _KarirState();
}

class _KarirState extends State<Karir> {
  DateTime? date;
  DateTime curdate = DateTime.now();
  bool finishgetdata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKontakART();
  }

  void getKontakART() {
    int umur = curdate.year;
    String kategori = "";
    DataKontakART.getData(globals.iduser).then((value) {
      setState(() {
        globals.listDataKontakArt = value;

        for (int i = 0; i < globals.listDataKontakArt.length; i++) {
          date = convertStringToDate(globals.listDataKontakArt[i].tanggallahir);
          umur = umur - date!.year;

          if (globals.listDataKontakArt[i].kprt == 1) {
            kategori = kategori + "pembantu rumah tangga, ";
          }
          if (globals.listDataKontakArt[i].kbabysitter == 1) {
            kategori = kategori + "baby sitter, ";
          }
          if (globals.listDataKontakArt[i].kseniorcare == 1) {
            kategori = kategori + "penjaga lanjut usia, ";
          }
          if (globals.listDataKontakArt[i].ksupir == 1) {
            kategori = kategori + "supir, ";
          }
          if (globals.listDataKontakArt[i].kofficeboy == 1) {
            kategori = kategori + "office boy, ";
          }
          if (globals.listDataKontakArt[i].ktukangkebun == 1) {
            kategori = kategori + "tukang kebun, ";
          }
          kategori = kategori.substring(0, kategori.length - 2);

          globals.listDataKontakArt[i].umur = umur;
          globals.listDataKontakArt[i].kategori = kategori;

          umur = curdate.year;
          kategori = "";
        }

        finishgetdata = true;
      });
    });
  }

  DateTime? convertStringToDate(String dateString) {
    try {
      var format = DateFormat('dd-MM-yyyy');
      return format.parse(dateString);
    } catch (e) {
      print('Error converting string to date: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: finishgetdata == false
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
          : SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        globals.status_user == "majikan"
                            ? "Lihat Pelamar"
                            : "Lihat Lamaran",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                          onPressed: () {
                            if (globals.status_user == "majikan") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ListARTKarir()));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ListLokerKarir()));
                            }
                          },
                          child: Text(
                            'Lihat Semua',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          ))
                    ],
                  ),
                  Visibility(
                      visible: globals.status_user == "majikan" ? true : false,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/person-4.jpg',
                                                      ),
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
                                                "4.3",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
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
                                            "Michelle Maryati",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text(
                                            "20 thn | PRT",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              fontSize: 14,
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
                                          color: Color(
                                              int.parse(globals.color_primary)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                        'assets/images/person-4.jpg',
                                                      ),
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
                                                "4.3",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
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
                                            "Michelle Maryati",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text(
                                            "20 thn | PRT",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              fontSize: 14,
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
                                          color: Color(
                                              int.parse(globals.color_primary)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  Visibility(
                      visible: globals.status_user == "pekerja" ? true : false,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailLoker(
                                            index: 0,
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/person-4.jpg'),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                MListLoker
                                                    .isiListLoker[0].kategori,
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Text(
                                                'Rosa Fiore',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                              Text(
                                                "${MListLoker.isiListLoker[0].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromARGB(
                                                            255,
                                                            138,
                                                            138,
                                                            138))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Status : menunggu konfirmasi",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 11,
                                              color: Color(int.parse(
                                                  globals.color_secondary)))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailLoker(
                                            index: 1,
                                          )));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/person-4.jpg'),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                MListLoker
                                                    .isiListLoker[1].kategori,
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Text(
                                                'Baim Wong',
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                              Text(
                                                "${MListLoker.isiListLoker[1].kecamatan}, ${MListLoker.isiListLoker[1].asalkota} | ${MListLoker.isiListLoker[1].jaraklokasi}",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 13,
                                                        color: Color.fromARGB(
                                                            255,
                                                            138,
                                                            138,
                                                            138))),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Status : menunggu konfirmasi",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 11,
                                              color: Color(int.parse(
                                                  globals.color_secondary)))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        globals.status_user == "majikan"
                            ? "Lihat Kontak ART"
                            : "Lihat Kontak Majikan",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListARTKarir()));
                          },
                          child: Text(
                            'Lihat Semua',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Color(
                                        int.parse(globals.color_secondary)))),
                          ))
                    ],
                  ),
                  Visibility(
                      visible: globals.status_user == "majikan" ? true : false,
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                                        '${globals.urlapi}getimage?id=${globals.listDataKontakArt[0].idart}&folder=profpic',
                                                      ),
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
                                                    .listDataKontakArt[0].rating
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
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
                                            globals.listDataKontakArt[0]
                                                .namalengkap,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text(
                                            "${globals.listDataKontakArt[0].umur} tahun | ${globals.listDataKontakArt[0].kategori}",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              fontSize: 14,
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
                                          color: Color(
                                              int.parse(globals.color_primary)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
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
                                                        '${globals.urlapi}getimage?id=${globals.listDataKontakArt[1].idart}&folder=profpic',
                                                      ),
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
                                                    .listDataKontakArt[1].rating
                                                    .toString(),
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
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
                                            globals.listDataKontakArt[1]
                                                .namalengkap,
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text(
                                            "${globals.listDataKontakArt[1].umur} tahun | ${globals.listDataKontakArt[1].kategori}",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                              fontSize: 14,
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
                                          color: Color(
                                              int.parse(globals.color_primary)),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  Visibility(
                      visible: globals.status_user == "pekerja" ? true : false,
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              'assets/images/person-4.jpg',
                                            ),
                                            fit: BoxFit.fill)),
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
                                          "Rosa Fiore",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Text(
                                          "Lowongan Kerja : Pembantu Rumah Tangga",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                            fontSize: 14,
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
                                        color: Color(
                                            int.parse(globals.color_primary)),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                              'assets/images/person-4.jpg',
                                            ),
                                            fit: BoxFit.fill)),
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
                                          "Baim Wong",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Text(
                                          "Lowongan Kerja : Supir Pribadi",
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                            fontSize: 14,
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
                                        color: Color(
                                            int.parse(globals.color_primary)),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
    );
  }
}
