// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:artpro_application_new/mainberanda.dart';
import 'package:artpro_application_new/verifktp_dua.dart';
import 'package:artpro_application_new/verifktp_satu.dart';
import 'package:artpro_application_new/verifktp_tiga.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import './global.dart' as globals;

class SummaryVerifikasi extends StatefulWidget {
  const SummaryVerifikasi({super.key});

  @override
  State<SummaryVerifikasi> createState() => _SummaryVerifikasiState();
}

class _SummaryVerifikasiState extends State<SummaryVerifikasi> {
  bool is_selected = false;

  Future<void> sentToDatabase() async {
    // === SIMPAN PROFILE ===
    var url = "${globals.urlapi}addprofileuser";
    var response = await http.post(Uri.parse(url), body: {
      "iduser": globals.iduser,
      "namalengkap": globals.namalengkap,
      "jeniskelamin": globals.jeniskelamin,
      "tempatlahir": globals.tempatlahir,
      "tanggallahir": globals.tanggallahir,
      "telephone": globals.telephone,
      "profilepicpath": "-"
    });
    // END OF SIMPAN PROFILE

    // SIMPAN DATA VERIFIKASI //
    var url2 = "${globals.urlapi}addverifikasidata";
    var response2 = await http.post(Uri.parse(url2), body: {
      "iduser": globals.iduser,
      "nik": globals.nik,
      "tempatlahir": globals.tempatlahir,
      "tanggallahir": globals.tanggallahir,
      "alamat": globals.alamatktp,
      "kecamatan": globals.kecktp,
      "kelurahan": globals.kelktp,
      "rt": globals.rt,
      "rw": globals.rw,
      "fotoktp": "-",
      "selfiektp": "-",
      "statusverifikasi": "belum validasi"
    });
    // END OF SIMPAN DATA VERIFIKASI

    // SIMPAN DOMISILI USER
    var url3 = "${globals.urlapi}adduserdomisili";
    var response3 = await http.post(Uri.parse(url3), body: {
      "iduser": globals.iduser,
      "alamat": globals.alamatdom,
      "kecamatan": globals.kecdom,
      "kelurahan": globals.keldom,
      "provinsi": globals.provdom,
      "kota": globals.kotadom,
      "longitude": globals.longitude,
      "latitude": globals.latitude
    });
    // END OF SIMPAN DOMISILI USER

    // === UPLOAD IMAGE ===
    var url4 = "${globals.urlapi}uploadimage";
    var request = http.MultipartRequest('POST', Uri.parse(url4));
    request.fields['id'] = globals.iduser.toString();
    request.fields['folder'] = 'fotoktp';
    request.files
        .add(await http.MultipartFile.fromPath('photo', globals.fotoktp!.path));
    var res = await request.send();

    var request2 = http.MultipartRequest('POST', Uri.parse(url4));
    request2.fields['id'] = globals.iduser.toString();
    request2.fields['folder'] = 'selfiektp';
    request2.files.add(
        await http.MultipartFile.fromPath('photo', globals.selfiektp!.path));
    var res2 = await request2.send();
    // === END UPLOAD IMAGE ===

    if (globals.status_user == "pekerja") {
      // SIMPAN DETAIL PROFILE ART
      var url5 = "${globals.urlapi}addprofileart";
      var response5 = await http.post(Uri.parse(url5), body: {
        "iduser": globals.iduser,
        "pendidikanterakhir": globals.pendidikanterakhir,
        "beratbadan": globals.berat,
        "tinggibadan": globals.tinggi,
        "agama": globals.agama,
        "tkmenginap": globals.tkmenginap,
        "tkwarnen": globals.tkwarnen,
        "hewan": globals.hewan,
        "mabukjalan": globals.mabukJalan,
        "sepedamotor": globals.spdmotor,
        "mobil": globals.mobil,
        "masak": globals.masak
      });
      // END OF SIMPAN DETAIL PROFILE ART

      // SIMPAN DETAIL KERJA ART
      var url6 = "${globals.urlapi}addkerjaart";
      var response6 = await http.post(Uri.parse(url6), body: {
        "iduser": globals.iduser,
        "kprt": globals.kprt,
        "kbabysitter": globals.kbabysitter,
        "kseniorcare": globals.kseniorcare,
        "ksupir": globals.ksupir,
        "kofficeboy": globals.kofficeboy,
        "ktukangkebun": globals.ktukangkebun,
        "pengalaman": globals.pengalaman,
        "gajiawal": globals.gajiawal,
        "gajiakhir": globals.gajiakhir
      });
      // END OF SIMPAN DETAIL KERJA ART
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainBeranda()));
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
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Silahkan periksa kembali informasi yang sudah dimasukkan. Informasi yang dikirim untuk verifikasi harus sesuai dengan KTP.",
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 15,
                      color: Color(int.parse(globals.color_secondary)),
                      fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              color: Color(int.parse(globals.color_primary)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Informasi Pribadi",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifikasiKTPS()));
                  },
                  child: Text(
                    'Ubah',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_secondary)))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "No. KTP",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.nik,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Nama Lengkap",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.namalengkap,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Tempat Lahir",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.tempatlahir,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Tanggal Lahir",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.tanggallahir,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Jenis Kelamin",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.jeniskelamin == "L" ? "Laki - Laki" : "Perempuan",
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Color(int.parse(globals.color_primary)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Informasi Tempat Tinggal",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifikasiKTPD()));
                  },
                  child: Text(
                    'Ubah',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_secondary)))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Alamat sesuai KTP",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.alamatktp,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Provinsi",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.provktp,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Kabupaten/Kota",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.kotaktp,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Kecamatan",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.kecktp,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Kelurahan/Desa",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.kelktp,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "RT",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.rt,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "RW",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 138, 138, 138))),
                  ),
                ),
                Expanded(
                  child: Text(
                    globals.rw,
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.black)),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: Color(int.parse(globals.color_primary)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Keperluan Foto",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VerifikasiKTPT()));
                  },
                  child: Text(
                    'Ubah',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_secondary)))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(File('${globals.fotoktp!.path}')))),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(File('${globals.selfiektp!.path}')))),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                  text: TextSpan(
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w400)),
                      children: [
                        const TextSpan(
                            text:
                                'Saya setuju dengan menyimpan informasi di aplikasi ARTPro untuk proses verifikasi sesuai dengan  '),
                        TextSpan(
                            text: 'Syarat & Kondisi ',
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 77, 0)),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Syarat&Kondisi');
                              }),
                        const TextSpan(text: 'yang berlaku'),
                      ]),
                ),
                activeColor: Color(int.parse(globals.color_primary)),
                checkColor: Colors.white,
                selected: is_selected,
                value: is_selected,
                onChanged: (value) {
                  setState(() {
                    is_selected = value!;
                  });
                },
              ), //CheckboxListTile
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
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(
                          'Konfirmasi Verifikasi',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        content: Text(
                            'Informasi pribadi sudah terkirim, silahkan masuk ke aplikasi'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                          int.parse(globals.color_secondary)))),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (is_selected == true) {
                                sentToDatabase();
                              }
                            },
                            child: Text(
                              'Masuk',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                          int.parse(globals.color_primary)))),
                            ),
                          ),
                        ],
                      ),
                    ),
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
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
