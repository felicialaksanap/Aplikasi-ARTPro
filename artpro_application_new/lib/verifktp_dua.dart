import 'package:artpro_application_new/verifktp_tiga.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import 'package:artpro_application_new/services/services.dart';

class VerifikasiKTPD extends StatefulWidget {
  const VerifikasiKTPD({super.key});

  @override
  State<VerifikasiKTPD> createState() => _VerifikasiKTPDState();
}

class _VerifikasiKTPDState extends State<VerifikasiKTPD> {
  String dropProvinsi = '-Pilih-';
  String dropKota = '-Pilih-';
  String dropKelu = '-Pilih-';
  String dropKec = '-Pilih-';

  TextEditingController alamatkctr = TextEditingController();
  TextEditingController rtctr = TextEditingController();
  TextEditingController rwctr = TextEditingController();

  List<DetailProvinsi> listProvinsi = [];
  List<String> menuProvinsi = [];

  List<DetailKotKab> listKotKab = [];
  List<String> menuKotKab = [];

  List<DetailKecamatan> listKecamatan = [];
  List<String> menuKecamatan = [];

  List<DetailKelurahan> listKelurahan = [];
  List<String> menuKelurahan = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    alamatkctr.dispose();
    rtctr.dispose();
    rwctr.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuProvinsi.add("-Pilih-");
    menuKotKab.add("-Pilih-");
    menuKecamatan.add("-Pilih-");
    menuKelurahan.add("-Pilih-");
    getDetailProvinsi();
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
        }
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
        }
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
        }
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
        }
      });
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
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color.fromARGB(255, 138, 138, 138),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "2 dari 3",
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
            Text(
              'Alamat sesuai KTP',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            FormFieldTemplate("alamat", alamatkctr),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Provinsi',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 138, 138, 138)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropProvinsi,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
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
                        String idProvinsi = "";
                        dropProvinsi = newValue!;
                        for (int i = 0; i < listProvinsi.length; i++) {
                          if (listProvinsi[i].nama == dropProvinsi) {
                            idProvinsi = listProvinsi[i].idProvinsi.toString();
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
            Text(
              'Kabupaten/Kota',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 138, 138, 138)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropKota,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
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
                        String idKotKab = "";
                        dropKota = newValue!;
                        for (int i = 0; i < listKotKab.length; i++) {
                          if (listKotKab[i].nama == dropKota) {
                            idKotKab = listKotKab[i].idKotKab.toString();
                          }
                        }
                        getDetailKecamatan(idKotKab);
                      });
                    },
                  ),
                )),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Kecamatan',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 138, 138, 138)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropKec,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
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
                        String idKecamatan = "";
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
            Text(
              'Kelurahan/Desa',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: const Color.fromARGB(255, 138, 138, 138)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropKelu,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
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
                        String idKelurahan = "";
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
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RT',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      FormFieldTemplate("rt", rtctr)
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RW',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ),
                      FormFieldTemplate("rw", rwctr)
                    ],
                  ),
                ),
              ],
            ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VerifikasiKTPT()));
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

Widget FormFieldTemplate(String? fill, TextEditingController controller) {
  return Container(
    child: TextField(
      controller: controller,
      cursorColor: Color(int.parse(globals.color_primary)),
      style: GoogleFonts.poppins(
          textStyle: const TextStyle(fontSize: 15, color: Colors.black)),
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
          ),
          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
      maxLines: fill == "alamat" ? 4 : 1,
    ),
  );
}
