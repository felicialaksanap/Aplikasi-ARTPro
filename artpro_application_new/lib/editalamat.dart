import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  TextEditingController alamatdomctr = TextEditingController();

  List<DetailProvinsi> listProvinsi = [];
  List<String> menuProvinsi = [];

  List<DetailKotKab> listKotKab = [];
  List<String> menuKotKab = [];

  List<DetailKecamatan> listKecamatan = [];
  List<String> menuKecamatan = [];

  List<DetailKelurahan> listKelurahan = [];
  List<String> menuKelurahan = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    menuProvinsi.add("-Pilih-");
    menuKotKab.add("-Pilih-");
    menuKecamatan.add("-Pilih-");
    menuKelurahan.add("-Pilih-");

    getDetailAddress();
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

        if (globals.alamatktp != "") {
          dropProvinsi = globals.provktp;
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

        if (globals.alamatktp != "") {
          dropKota = globals.kotaktp;
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

        if (globals.alamatktp != "") {
          dropKec = globals.kecktp;
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

        if (globals.alamatktp != "") {
          dropKelu = globals.kelktp;
          checkValue();
        }
      });
    });
  }

  void getDetailAddress() async {
    await getDetailProvinsi();
    await getDetailKotKab(globals.idprovktp);
    await getDetailKecamatan(globals.idkotktp);
    await getDetailKelurahan(globals.idkecktp);
  }

  void checkValue() {
    setState(() {
      alamatdomctr.text = globals.alamatktp;

      dropProvinsi = globals.provktp;
      dropKota = globals.kotaktp;
      dropKec = globals.kecktp;
      dropKelu = globals.kelktp;
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
      body: Padding(
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
                  'Alamat sesuai KTP',
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
                ),
                Container(
                  child: TextField(
                    controller: alamatdomctr,
                    cursorColor: Color(int.parse(globals.color_primary)),
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
