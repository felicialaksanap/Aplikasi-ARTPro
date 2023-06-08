// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'global.dart' as globals;
import 'services/services.dart';

class EditAlamat extends StatefulWidget {
  const EditAlamat({super.key});

  @override
  State<EditAlamat> createState() => _EditAlamatState();
}

class _EditAlamatState extends State<EditAlamat> {
  String longitude = "";
  String latitude = "";
  String dropProvinsi = "-Pilih-";
  String dropKota = "-Pilih-";
  String dropKelu = "-Pilih-";
  String dropKec = "-Pilih-";

  bool getDataDone = false;

  TextEditingController alamatdomctr = TextEditingController();

  List<DetailProvinsi> listProvinsi = [];
  List<String> menuProvinsi = [];
  String idProvinsi = "";

  List<DetailKotKab> listKotKab = [];
  List<String> menuKotKab = [];
  String idKota = "";

  List<DetailKecamatan> listKecamatan = [];
  List<String> menuKecamatan = [];
  String idKecamatan = "";

  List<DetailKelurahan> listKelurahan = [];
  List<String> menuKelurahan = [];
  String idKelurahan = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuProvinsi.add("-Pilih-");
    menuKotKab.add("-Pilih-");
    menuKecamatan.add("-Pilih-");
    menuKelurahan.add("-Pilih-");

    checkValue();
  }

  Future<void> getDetailProvinsi() async {
    DetailProvinsi.getData().then((value) async {
      setState(() {
        listProvinsi = [];
        listProvinsi = value;

        menuProvinsi = [];
        menuProvinsi.add("-Pilih-");
        for (int i = 0; i < listProvinsi.length; i++) {
          menuProvinsi.add(listProvinsi[i].nama);
          if (listProvinsi[i].nama == dropProvinsi) {
            idProvinsi = listProvinsi[i].idProvinsi.toString();
          }
        }

        getDetailKotKab(idProvinsi);
      });
    });
  }

  Future<void> getDetailKotKab(String idProv) async {
    DetailKotKab.getData(idProv).then((value) async {
      setState(() {
        listKotKab = [];
        listKotKab = value;

        menuKotKab = [];
        menuKotKab.add("-Pilih-");
        for (int i = 0; i < listKotKab.length; i++) {
          menuKotKab.add(listKotKab[i].nama);
          if (listKotKab[i].nama == dropKota) {
            idKota = listKotKab[i].idKotKab.toString();
          }
        }

        getDetailKecamatan(idKota);
      });
    });
  }

  Future<void> getDetailKecamatan(String idKotKab) async {
    DetailKecamatan.getData(idKotKab).then((value) async {
      setState(() {
        listKecamatan = [];
        listKecamatan = value;

        menuKecamatan = [];
        menuKecamatan.add("-Pilih-");
        for (int i = 0; i < listKecamatan.length; i++) {
          menuKecamatan.add(listKecamatan[i].nama);
          if (listKecamatan[i].nama == dropKec) {
            idKecamatan = listKecamatan[i].idKecamatan.toString();
          }
        }

        getDetailKelurahan(idKecamatan);
      });
    });
  }

  Future<void> getDetailKelurahan(String idKecamatan) async {
    DetailKelurahan.getData(idKecamatan).then((value) async {
      setState(() {
        listKelurahan = [];
        listKelurahan = value;

        menuKelurahan = [];
        menuKelurahan.add("-Pilih-");
        for (int i = 0; i < listKelurahan.length; i++) {
          menuKelurahan.add(listKelurahan[i].nama);
          if (listKelurahan[i].nama == dropKelu) {
            idKelurahan = listKelurahan[i].idKelurahan.toString();
          }
        }

        getDataDone = true;
      });
    });
  }

  void checkValue() {
    setState(() {
      alamatdomctr.text = globals.alamatdom;

      dropProvinsi = globals.provdom;
      dropKota = globals.kotadom;
      dropKec = globals.kecdom;
      dropKelu = globals.keldom;
      getDetailProvinsi();
    });
  }

  void getLongLat(String street, String city) async {
    List<Location> locations = await locationFromAddress("$street, $city");
    Location loc = locations[0];
    setState(() {
      latitude = "${loc.latitude}";
      longitude = "${loc.longitude}";
    });

    updateData();
  }

  void updateData() async {
    setState(() {
      globals.alamatdom = alamatdomctr.text;
      globals.provdom = dropProvinsi;
      globals.kotadom = dropKota;
      globals.kecdom = dropKec;
      globals.keldom = dropKelu;
      globals.longitude = longitude;
      globals.latitude = latitude;
    });

    var url = "${globals.urlapi}edituserdomisili";
    // ignore: unused_local_variable
    var response = await http.put(Uri.parse(url), body: {
      "iduser": globals.iduser,
      "alamat": globals.alamatdom,
      "kecamatan": globals.kecdom,
      "kelurahan": globals.keldom,
      "provinsi": globals.provdom,
      "kota": globals.kotadom,
      "longitude": globals.longitude,
      "latitude": globals.latitude
    });

    messagetoBack();
  }

  messagetoBack() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              'Alamat berhasil diganti, silahkan kembali ke menu profile',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "OK",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color:
                                  Color(int.parse(globals.color_secondary)))),
                    )),
              )
            ],
          );
        });
  }

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
            "Ganti Alamat Domisili",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Color(int.parse(globals.color_primary)),
                    fontWeight: FontWeight.bold)),
          ),
        ),
        body: getDataDone == false
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
                      "Memuat data....",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 138, 138, 138))),
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
                    Row(
                      children: [
                        Text(
                          "Alamat Domisili",
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
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                        )
                      ],
                    ),
                    Container(
                      child: TextField(
                        controller: alamatdomctr,
                        cursorColor: Color(int.parse(globals.color_primary)),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black)),
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 138, 138, 138),
                                  width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 138, 138, 138),
                                  width: 1.0),
                            ),
                            hintText: "Mawar No.57",
                            contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                        maxLines: 4,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Provinsi',
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
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                        )
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 138, 138)),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropProvinsi,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(int.parse(globals.color_primary)),
                            ),
                            items: menuProvinsi.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                dropProvinsi = newValue!;
                                for (int i = 0; i < listProvinsi.length; i++) {
                                  if (listProvinsi[i].nama == dropProvinsi) {
                                    idProvinsi =
                                        listProvinsi[i].idProvinsi.toString();
                                  }
                                }
                                getDetailKotKab(idProvinsi);
                              });
                            },
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Kabupaten/Kota',
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
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                        )
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 138, 138)),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropKota,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(int.parse(globals.color_primary)),
                            ),
                            items: menuKotKab.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 15, color: Colors.black)),
                                ),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                dropKota = newValue!;
                                getDataDone = false;
                                dropKec = "-Pilih-";
                                dropKelu = "-Pilih-";
                                for (int i = 0; i < listKotKab.length; i++) {
                                  if (listKotKab[i].nama == dropKota) {
                                    idKota = listKotKab[i].idKotKab.toString();
                                  }
                                }
                                getDetailKecamatan(idKota);
                              });
                            },
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Kecamatan',
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
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                        )
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 138, 138)),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropKec,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(int.parse(globals.color_primary)),
                            ),
                            items: menuKecamatan.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 15, color: Colors.black)),
                                ),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                if (dropKelu != "-Pilih-") {
                                  getDataDone = false;
                                  dropKelu = "-Pilih-";
                                }
                                dropKec = newValue!;
                                for (int i = 0; i < listKecamatan.length; i++) {
                                  if (listKecamatan[i].nama == dropKec) {
                                    idKecamatan =
                                        listKecamatan[i].idKecamatan.toString();
                                  }
                                }
                                getDetailKelurahan(idKecamatan);
                              });
                            },
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Kelurahan/Desa',
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
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                        )
                      ],
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 138, 138, 138)),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: dropKelu,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black)),
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Color(int.parse(globals.color_primary)),
                            ),
                            items: menuKelurahan.map((item) {
                              return DropdownMenuItem(
                                child: Text(
                                  item,
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 15, color: Colors.black)),
                                ),
                                value: item,
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                dropKelu = newValue!;
                                for (int i = 0; i < listKelurahan.length; i++) {
                                  if (listKelurahan[i].nama == dropKelu) {
                                    idKelurahan =
                                        listKelurahan[i].idKelurahan.toString();
                                  }
                                }
                              });
                            },
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (alamatdomctr.text != "" &&
                                  dropProvinsi != "-Pilih-" &&
                                  dropKota != "-Pilih-" &&
                                  dropKec != "-Pilih-" &&
                                  dropKelu != "-Pilih-") {
                                getLongLat(alamatdomctr.text, dropKota);
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text(
                                          'Silahkan mengisi bagian yang diberi tanda * atau melakukan klik centang untuk persetujuan',
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600)),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          Center(
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "OK",
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              int.parse(globals
                                                                  .color_secondary)))),
                                                )),
                                          )
                                        ],
                                      );
                                    });
                              }
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
              ));
  }
}
