import 'dart:convert';
import 'package:artpro_application_new/detailloker.dart';
import 'package:artpro_application_new/listloker.dart';
import 'package:artpro_application_new/services/lokerservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import './global.dart' as globals;

class TambahLoker extends StatefulWidget {
  String konten;
  int index;
  final String? pagefrom;
  TambahLoker(
      {super.key, required this.konten, required this.index, this.pagefrom});

  @override
  State<TambahLoker> createState() => _TambahLokerState();
}

class _TambahLokerState extends State<TambahLoker> {
  bool k_prt = false;
  bool k_bs = false;
  bool k_sc = false; // senior care
  bool k_supir = false;
  bool k_obog = false;
  bool k_tk = false;
  int count = 0;

  static const _locale = 'en';
  String _formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency =>
      NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  bool tthewan = false;
  bool masak = false;
  bool tmperj = false;
  bool mspdmtr = false;
  bool mmobil = false;
  bool menginap = false;
  bool warnen = false;
  bool ssingle = false;
  bool smarried = false;

  TextEditingController judulctr = TextEditingController();
  TextEditingController mingajictr = TextEditingController();
  TextEditingController maxgajictr = TextEditingController();
  TextEditingController infoctr = TextEditingController();

  bool tgsprt1 = false;
  bool tgsprt2 = false;
  bool tgsprt3 = false;

  bool tgsbs1 = false;
  bool tgsbs2 = false;
  bool tgsbs3 = false;

  bool tgssc1 = false;
  bool tgssc2 = false;
  bool tgssc3 = false;

  bool tgssupir1 = false;
  bool tgssupir2 = false;
  bool tgssupir3 = false;

  bool tgsobog1 = false;
  bool tgsobog2 = false;
  bool tgsobog3 = false;

  bool tgstk1 = false;
  bool tgstk2 = false;
  bool tgstk3 = false;

  List<TextEditingController> tugasctr = [];
  List<TextField> tugasfield = [];
  int countctr = 0;

  String tugas = "";
  String kriteria = "";
  String kategori = "";

  DateTime date = DateTime.now();
  String tglpost = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    judulctr.dispose();
    mingajictr.dispose();
    maxgajictr.dispose();
    infoctr.dispose();
    for (final controller in tugasctr) {
      controller.dispose();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.konten == "edit") {
      judulctr.text = globals.listLokerAktif[widget.index].judulloker;
      mingajictr.text = globals.listLokerAktif[widget.index].gajiawal;
      maxgajictr.text = globals.listLokerAktif[widget.index].gajiakhir;
      infoctr.text = globals.listLokerAktif[widget.index].informasi;
      k_prt = globals.listLokerAktif[widget.index].kprt == 1 ? true : false;
      k_bs =
          globals.listLokerAktif[widget.index].kbabysitter == 1 ? true : false;
      k_sc =
          globals.listLokerAktif[widget.index].kseniorcare == 1 ? true : false;
      k_supir = globals.listLokerAktif[widget.index].ksupir == 1 ? true : false;
      k_obog =
          globals.listLokerAktif[widget.index].kofficeboy == 1 ? true : false;
      k_tk =
          globals.listLokerAktif[widget.index].ktukangkebun == 1 ? true : false;
      tthewan = globals.listLokerAktif[widget.index].hewan == 1 ? true : false;
      masak = globals.listLokerAktif[widget.index].masak == 1 ? true : false;
      tmperj =
          globals.listLokerAktif[widget.index].mabukjalan == 1 ? true : false;
      mspdmtr =
          globals.listLokerAktif[widget.index].sepedamotor == 1 ? true : false;
      mmobil = globals.listLokerAktif[widget.index].mobil == 1 ? true : false;
      menginap =
          globals.listLokerAktif[widget.index].tkmenginap == 1 ? true : false;
      warnen =
          globals.listLokerAktif[widget.index].tkwarnen == 1 ? true : false;
      ssingle =
          globals.listLokerAktif[widget.index].ssingle == 1 ? true : false;
      smarried =
          globals.listLokerAktif[widget.index].smarried == 1 ? true : false;

      // set count for max 3 choice kategori
      if (k_prt == true) {
        count++;
      }
      if (k_bs == true) {
        count++;
      }
      if (k_sc == true) {
        count++;
      }
      if (k_supir == true) {
        count++;
      }
      if (k_obog == true) {
        count++;
      }
      if (k_tk == true) {
        count++;
      }

      for (int i = 0; i < globals.listTugas.length; i++) {
        if (globals.listTugas[i] == "Membersihkan debu, menyapu, mengepel") {
          tgsprt1 = true;
        } else if (globals.listTugas[i] ==
            "Mencuci, melipat, dan menyetrika pakaian") {
          tgsprt2 = true;
        } else if (globals.listTugas[i] == "Membersihkan dan membuang sampah") {
          tgsprt3 = true;
        } else if (globals.listTugas[i] == "Mencuci pakaian bayi") {
          tgsbs1 = true;
        } else if (globals.listTugas[i] == "Membersihkan kamar") {
          tgsbs2 = true;
        } else if (globals.listTugas[i] ==
            "Mengurus keperluan pribadi bayi / anak") {
          tgsbs3 = true;
        } else if (globals.listTugas[i] == "Menyiapkan obat-obatan") {
          tgssc1 = true;
        } else if (globals.listTugas[i] ==
            "Memandikan / menyiapkan keperluan mandi") {
          tgssc2 = true;
        } else if (globals.listTugas[i] == "Menolong buang air besar / kecil") {
          tgssc3 = true;
        } else if (globals.listTugas[i] == "Menjaga kebersihan mobil") {
          tgssupir1 = true;
        } else if (globals.listTugas[i] ==
            "Melakukan pengecekan terhadap kendaraan") {
          tgssupir2 = true;
        } else if (globals.listTugas[i] ==
            "Bertanggungjawab atas keselamatan penumpang dan mobil") {
          tgssupir3 = true;
        } else if (globals.listTugas[i] ==
            "Menyiapkan minum untuk para karyawan") {
          tgsobog1 = true;
        } else if (globals.listTugas[i] ==
            "Membereskan gelas dan perlengkapan lain setelah karyawan pulang") {
          tgsobog2 = true;
        } else if (globals.listTugas[i] ==
            "Mempersiapkan ruang rapat / pertemuan") {
          tgsobog3 = true;
        } else if (globals.listTugas[i] ==
            "Perawatan dan pemeliharaan berbagai tanaman, dari bunga hingga pohon dan semak") {
          tgstk1 = true;
        } else if (globals.listTugas[i] ==
            "Pengolahan tanah, pemupukan dan nutrisi tanaman") {
          tgstk2 = true;
        } else if (globals.listTugas[i] ==
            "Bersihkan area hijau daun, potong rumput, dan puing-puing") {
          tgstk3 = true;
        } else {
          final controller = TextEditingController();
          final field = TextField(
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
              hintText: "Masukkan uraian tugas",
              contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            ),
            maxLines: 1,
          );
          tugasctr.add(controller);
          tugasfield.add(field);
          tugasctr[countctr].text = globals.listTugas[i];
          countctr++;
        }
      }
    }
    tglpost = DateFormat('dd-MM-yyyy').format(date);
  }

  Widget addTugas() {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(int.parse(globals.color_primary)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: Text(
          "+ Tambah data tugas",
          style: GoogleFonts.poppins(
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ),
        onPressed: () {
          final controller = TextEditingController();
          final field = TextField(
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
              hintText: "Masukkan uraian tugas",
              contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4),
            ),
            maxLines: 1,
          );

          setState(() {
            tugasctr.add(controller);
            tugasfield.add(field);
          });
        },
      ),
    );
  }

  Widget listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tugasfield.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: [
              Expanded(child: tugasfield[index]),
              IconButton(
                  onPressed: () {
                    setState(() {
                      tugasctr.removeAt(index);
                      tugasfield.removeAt(index);
                      if (widget.konten == "edit") {
                        countctr--;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Color(int.parse(globals.color_secondary)),
                  )),
            ],
          ),
        );
      },
    );
  }

  popUpDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              'Silahkan mengisi bagian yang diberi tanda *',
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

  void prepareData() {
    setState(() {
      globals.listTugas.clear();
      // Set Tugas dan String Tugas untuk detail
      tugas = "";
      if (tgsprt1 == true) {
        tugas = tugas + "Membersihkan debu, menyapu, mengepel. ";
        globals.listTugas.add("Membersihkan debu, menyapu, mengepel");
      }
      if (tgsprt2 == true) {
        tugas = tugas + "Mencuci, melipat, dan menyetrika pakaian. ";
        globals.listTugas.add("Mencuci, melipat, dan menyetrika pakaian");
      }
      if (tgsprt3 == true) {
        tugas = tugas + "Membersihkan dan membuang sampah. ";
        globals.listTugas.add("Membersihkan dan membuang sampah");
      }
      if (tgsbs1 == true) {
        tugas = tugas + "Mencuci pakaian bayi. ";
        globals.listTugas.add("Mencuci pakaian bayi");
      }
      if (tgsbs2 == true) {
        tugas = tugas + "Membersihkan kamar. ";
        globals.listTugas.add("Membersihkan kamar");
      }
      if (tgsbs3 == true) {
        tugas = tugas + "Mengurus keperluan pribadi bayi / anak. ";
        globals.listTugas.add("Mengurus keperluan pribadi bayi / anak");
      }
      if (tgssc1 == true) {
        tugas = tugas + "Menyiapkan obat-obatan. ";
        globals.listTugas.add("Menyiapkan obat-obatan");
      }
      if (tgssc2 == true) {
        tugas = tugas + "Memandikan / menyiapkan keperluan mandi. ";
        globals.listTugas.add("Memandikan / menyiapkan keperluan mandi");
      }
      if (tgssc3 == true) {
        tugas = tugas + "Menolong buang air besar / kecil. ";
        globals.listTugas.add("Menolong buang air besar / kecil");
      }
      if (tgssupir1 == true) {
        tugas = tugas + "Menjaga kebersihan mobil. ";
        globals.listTugas.add("Menjaga kebersihan mobil");
      }
      if (tgssupir2 == true) {
        tugas = tugas + "Melakukan pengecekan terhadap kendaraan. ";
        globals.listTugas.add("Melakukan pengecekan terhadap kendaraan");
      }
      if (tgssupir3 == true) {
        tugas =
            tugas + "Bertanggungjawab atas keselamatan penumpang dan mobil. ";
        globals.listTugas
            .add("Bertanggungjawab atas keselamatan penumpang dan mobil");
      }
      if (tgsobog1 == true) {
        tugas = tugas + "Menyiapkan minum untuk para karyawan. ";
        globals.listTugas.add("Menyiapkan minum untuk para karyawan");
      }
      if (tgsobog2 == true) {
        tugas = tugas +
            "Membereskan gelas dan perlengkapan lain setelah karyawan pulang. ";
        globals.listTugas.add(
            "Membereskan gelas dan perlengkapan lain setelah karyawan pulang");
      }
      if (tgsobog3 == true) {
        tugas = tugas + "Mempersiapkan ruang rapat / pertemuan. ";
        globals.listTugas.add("Mempersipakan ruang rapat / pertemuan");
      }
      if (tgstk1 == true) {
        tugas = tugas +
            "Perawatan dan pemeliharaan berbagai tanaman, dari bunga hingga pohon dan semak. ";
        globals.listTugas.add(
            "Perawatan dan pemeliharaan berbagai tanaman, dari bungan hingga pohon dan semak");
      }
      if (tgstk2 == true) {
        tugas = tugas + "Pengolahan tanah, pemupukan dan nutrisi tanaman. ";
        globals.listTugas
            .add("Pengolahan tanah, pemupukan dan nutrisi tanaman");
      }
      if (tgstk3 == true) {
        tugas = tugas +
            "Bersihkan area hijau daun, potong rumput, dan puing-puing. ";
        globals.listTugas
            .add("Bersihkan area hijau daun, potong rambut, dan puing-puing");
      }
      if (tugasctr.isNotEmpty) {
        for (int i = 0; i < tugasctr.length; i++) {
          tugas = tugas + tugasctr[i].text + ". ";
          globals.listTugas.add(tugasctr[i].text);
        }
      }
      tugas = tugas.substring(0, tugas.length - 2);
      globals.listTugas[widget.index] = tugas;

      globals.listKriteria.clear();
      // Set Kriteria
      if (tthewan == true) {
        kriteria = kriteria + "Tidak takut hewan, ";
        globals.listKriteria.add("Tidak takut hewan");
      }
      if (masak == true) {
        kriteria = kriteria + "Memasak, ";
        globals.listKriteria.add("Memasak");
      }
      if (tmperj == true) {
        kriteria = kriteria + "Tidak mabuk perjalanan, ";
        globals.listKriteria.add("Tidak mabuk perjalanan");
      }
      if (mspdmtr == true) {
        kriteria = kriteria + "Menyetir sepeda motor, ";
        globals.listKriteria.add("Menyetir sepeda motor");
      }
      if (mmobil == true) {
        kriteria = kriteria + "Menyetir mobil, ";
        globals.listKriteria.add("Menyetir mobil");
      }
      if (menginap == true) {
        kriteria = kriteria + "Menginap, ";
        globals.listKriteria.add("Menginap");
      }
      if (warnen == true) {
        kriteria = kriteria + "Warnen, ";
        globals.listKriteria.add("Warnen");
      }
      if (ssingle == true) {
        kriteria = kriteria + "Belum menikah, ";
        globals.listKriteria.add("Belum menikah");
      }
      if (smarried == true) {
        kriteria = kriteria + "Sudah menikah,  ";
        globals.listKriteria.add("Sudah menikah");
      }
      kriteria = kriteria.substring(0, kriteria.length - 2);

      if (k_prt == true) {
        kategori = kategori + "Pembantu, ";
      }
      if (k_bs == true) {
        kategori = kategori + "Babysitter, ";
      }
      if (k_sc == true) {
        kategori = kategori + "Pendamping Lansia, ";
      }
      if (k_supir == true) {
        kategori = kategori + "Supir, ";
      }
      if (k_obog == true) {
        kategori = kategori + "Office Boy / Girl, ";
      }
      if (k_tk == true) {
        kategori = kategori + "Tukang Kebun, ";
      }
      kategori = kategori.substring(0, kategori.length - 2);
    });

    if (widget.konten == "edit") {
      updateDatabase();
    } else {
      sendToDatabase();
    }
  }

  Future<void> sendToDatabase() async {
    // Simpan Lowongan Kerja
    var url = "${globals.urlapi}addlowongankerja";
    var response = await http.post(Uri.parse(url), body: {
      "iduser": globals.iduser,
      "judulloker": judulctr.text,
      "gajiawal": mingajictr.text,
      "gajiakhir": maxgajictr.text,
      "informasi": infoctr.text,
      "tugas": tugas,
      "kprt": k_prt == true ? "1" : "0",
      "kbabysitter": k_bs == true ? "1" : "0",
      "kseniorcare": k_sc == true ? "1" : "0",
      "ksupir": k_supir == true ? "1" : "0",
      "kofficeboy": k_obog == true ? "1" : "0",
      "ktukangkebun": k_tk == true ? "1" : "0",
      "hewan": tthewan == true ? "1" : "0",
      "masak": masak == true ? "1" : "0",
      "mabukjalan": tmperj == true ? "1" : "0",
      "sepedamotor": mspdmtr == true ? "1" : "0",
      "mobil": mmobil == true ? "1" : "0",
      "tkmenginap": menginap == true ? "1" : "0",
      "tkwarnen": warnen == true ? "1" : "0",
      "ssingle": ssingle == true ? "1" : "0",
      "smarried": smarried == true ? "1" : "0",
      "tglpost": tglpost,
      "statusloker": "1"
    });
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    //   var lastId = data['data']['getIdLast'];

    //   Loker.getDataLokerperIdLoker(lastId.toString()).then((value) {
    //     setState(() {
    //       globals.listLokerAktif.add(value[0]);
    //       globals.kategori.add(kategori);
    //       globals.kriteria.add(kriteria);
    //     });
    //   });
    // }
    messagetoBack();
  }

  Future<void> updateDatabase() async {
    // Edit Lowongan Kerja
    var url =
        "${globals.urlapi}editlowongankerja?idloker=${int.parse(globals.listLokerAktif[widget.index].idloker)}";
    var response = await http.put(Uri.parse(url), body: {
      "idloker": globals.listLokerAktif[widget.index].idloker,
      "judulloker": judulctr.text,
      "gajiawal": mingajictr.text,
      "gajiakhir": maxgajictr.text,
      "informasi": infoctr.text,
      "tugas": tugas,
      "kprt": k_prt == true ? "1" : "0",
      "kbabysitter": k_bs == true ? "1" : "0",
      "kseniorcare": k_sc == true ? "1" : "0",
      "ksupir": k_supir == true ? "1" : "0",
      "kofficeboy": k_obog == true ? "1" : "0",
      "ktukangkebun": k_tk == true ? "1" : "0",
      "hewan": tthewan == true ? "1" : "0",
      "masak": masak == true ? "1" : "0",
      "mabukjalan": tmperj == true ? "1" : "0",
      "sepedamotor": mspdmtr == true ? "1" : "0",
      "mobil": mmobil == true ? "1" : "0",
      "tkmenginap": menginap == true ? "1" : "0",
      "tkwarnen": warnen == true ? "1" : "0",
      "ssingle": ssingle == true ? "1" : "0",
      "smarried": smarried == true ? "1" : "0",
      "tglpost": tglpost
    });

    setState(() {
      globals.listLokerAktif[widget.index].judulloker = judulctr.text;
      globals.listLokerAktif[widget.index].gajiawal = mingajictr.text;
      globals.listLokerAktif[widget.index].gajiakhir = maxgajictr.text;
      globals.listLokerAktif[widget.index].informasi = infoctr.text;
      globals.listLokerAktif[widget.index].kprt = k_prt == true ? 1 : 0;
      globals.listLokerAktif[widget.index].kbabysitter = k_bs == true ? 1 : 0;
      globals.listLokerAktif[widget.index].kseniorcare = k_sc == true ? 1 : 0;
      globals.listLokerAktif[widget.index].ksupir = k_supir == true ? 1 : 0;
      globals.listLokerAktif[widget.index].kofficeboy = k_obog == true ? 1 : 0;
      globals.listLokerAktif[widget.index].ktukangkebun = k_tk == true ? 1 : 0;
      globals.listLokerAktif[widget.index].hewan = tthewan == true ? 1 : 0;
      globals.listLokerAktif[widget.index].masak = masak == true ? 1 : 0;
      globals.listLokerAktif[widget.index].mabukjalan = tmperj == true ? 1 : 0;
      globals.listLokerAktif[widget.index].sepedamotor =
          mspdmtr == true ? 1 : 0;
      globals.listLokerAktif[widget.index].mobil = mmobil == true ? 1 : 0;
      globals.listLokerAktif[widget.index].tkmenginap =
          menginap == true ? 1 : 0;
      globals.listLokerAktif[widget.index].tkwarnen = warnen == true ? 1 : 0;
      globals.listLokerAktif[widget.index].ssingle = ssingle == true ? 1 : 0;
      globals.listLokerAktif[widget.index].smarried = smarried == true ? 1 : 0;
      globals.listLokerAktif[widget.index].tglpost = tglpost;

      globals.kategori[widget.index] = kategori;
      globals.kriteria[widget.index] = kriteria;
    });

    messagetoBack();
  }

  messagetoBack() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              widget.konten == "edit"
                  ? "Berhasil mengubah data lowongan pekerjaan, silahkan kembali ke menu Lihat Lowongan Kerja"
                  : 'Berhasil membuat lowongan pekerjaan, silahkan kembali ke menu Lihat Lowongan',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () {
                      if (widget.pagefrom == "detailloker") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailLoker(index: widget.index)));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListLoker()));
                      }
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
            if (widget.konten == "edit" && widget.pagefrom != "detailloker") {
              globals.listTugas.clear();
              globals.listKriteria.clear();
            }
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
        ),
        title: Text(
          "Tambah Loker",
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
              children: [
                Text(
                  "Judul Lowongan Kerja",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: judulctr,
              cursorColor: Color(int.parse(globals.color_primary)),
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 15, color: Colors.black)),
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
                  ),
                  hintText: "Pembantu Yang Creative",
                  contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
              maxLines: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Kisaran gaji yang diberikan',
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
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  'Rp',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: mingajictr,
                        cursorColor: Color(int.parse(globals.color_primary)),
                        keyboardType: TextInputType.number,
                        onChanged: (string) {
                          string =
                              '${_formatNumber(string.replaceAll(',', ''))}';
                          mingajictr.value = TextEditingValue(
                            text: string,
                            selection:
                                TextSelection.collapsed(offset: string.length),
                          );
                        },
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
                            hintText: "3,500,000",
                            contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '-',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextField(
                        controller: maxgajictr,
                        cursorColor: Color(int.parse(globals.color_primary)),
                        keyboardType: TextInputType.number,
                        onChanged: (string) {
                          string =
                              '${_formatNumber(string.replaceAll(',', ''))}';
                          maxgajictr.value = TextEditingValue(
                            text: string,
                            selection:
                                TextSelection.collapsed(offset: string.length),
                          );
                        },
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
                            hintText: "5,500,000",
                            contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                        maxLines: 1,
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Informasi Lowongan Kerja",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: infoctr,
              cursorColor: Color(int.parse(globals.color_primary)),
              style: GoogleFonts.poppins(
                  textStyle:
                      const TextStyle(fontSize: 15, color: Colors.black)),
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 138, 138, 138), width: 1.0),
                  ),
                  hintText:
                      "Ceritakan sedikit tentang suasana di rumah, lingkungan kerja, dan lainnya",
                  contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
              maxLines: 7,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Kategori pekerjaan',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                Text(" *",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_secondary)))))
              ],
            ),
            Text(
              '(bisa memilih lebih dari 1)',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Color.fromARGB(255, 22, 15, 41),
                fontSize: 12,
              )),
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_prt,
                    onChanged: count > 2 && k_prt == false
                        ? null
                        : (value) {
                            setState(() {
                              k_prt = value!;
                              if (k_prt == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Expanded(
                  child: Text(
                    "Pekerja/Pembantu Rumah Tangga",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_bs,
                    onChanged: count > 2 && k_bs == false
                        ? null
                        : (value) {
                            setState(() {
                              k_bs = value!;
                              if (k_bs == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Baby Sitter",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_sc,
                    onChanged: count > 2 && k_sc == false
                        ? null
                        : (value) {
                            setState(() {
                              k_sc = value!;
                              if (k_sc == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Pendamping Lansia",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_supir,
                    onChanged: count > 2 && k_supir == false
                        ? null
                        : (value) {
                            setState(() {
                              k_supir = value!;
                              if (k_supir == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Supir Pribadi",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_obog,
                    onChanged: count > 2 && k_obog == false
                        ? null
                        : (value) {
                            setState(() {
                              k_obog = value!;
                              if (k_obog == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Office Boy/Office Girl",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    activeColor: Color(int.parse(globals.color_primary)),
                    value: k_tk,
                    onChanged: count > 2 && k_tk == false
                        ? null
                        : (value) {
                            setState(() {
                              k_tk = value!;
                              if (k_tk == true) {
                                count++;
                              } else {
                                count--;
                              }
                            });
                          }),
                Text(
                  "Tukang Kebun",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Uraian Tugas",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            Visibility(
              visible: k_prt == true ? true : false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsprt1,
                          onChanged: (value) {
                            setState(() {
                              tgsprt1 = !tgsprt1;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Membersihkan debu, menyapu, mengepel",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsprt2,
                          onChanged: (value) {
                            setState(() {
                              tgsprt2 = !tgsprt2;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Mencuci, melipat, dan menyetrika pakaian",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsprt3,
                          onChanged: (value) {
                            setState(() {
                              tgsprt3 = !tgsprt3;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Membersihkan dan membuang sampah",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: k_bs == true ? true : false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsbs1,
                          onChanged: (value) {
                            setState(() {
                              tgsbs1 = !tgsbs1;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Mencuci pakaian bayi",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsbs2,
                          onChanged: (value) {
                            setState(() {
                              tgsbs2 = !tgsbs2;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Membersihkan kamar",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsbs3,
                          onChanged: (value) {
                            setState(() {
                              tgsbs3 = !tgsbs3;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Mengurus keperluan pribadi bayi / anak",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: k_sc == true ? true : false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgssc1,
                          onChanged: (value) {
                            setState(() {
                              tgssc1 = !tgssc1;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Menyiapkan obat-obatan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgssc2,
                          onChanged: (value) {
                            setState(() {
                              tgssc2 = !tgssc2;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Memandikan / menyiapkan keperluan mandi",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgssc3,
                          onChanged: (value) {
                            setState(() {
                              tgssc3 = !tgssc3;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Menolong buang air besar / kecil",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: k_supir == true ? true : false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgssupir1,
                          onChanged: (value) {
                            setState(() {
                              tgssupir1 = !tgssupir1;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Menjaga kebersihan mobil",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgssupir2,
                          onChanged: (value) {
                            setState(() {
                              tgssupir2 = !tgssupir2;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Melakukan pengecekan terhadap kendaraan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgssupir3,
                          onChanged: (value) {
                            setState(() {
                              tgssupir3 = !tgssupir3;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Bertanggungjawab atas keselamatan penumpang dan mobil",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: k_obog == true ? true : false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsobog1,
                          onChanged: (value) {
                            setState(() {
                              tgsobog1 = !tgsobog1;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Menyiapkan minum untuk para karyawan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsobog2,
                          onChanged: (value) {
                            setState(() {
                              tgsobog2 = !tgsobog2;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Membereskan gelas dan perlengkapan lain setelah karyawan pulang",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgsobog3,
                          onChanged: (value) {
                            setState(() {
                              tgsobog3 = !tgsobog3;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Mempersiapkan ruang rapat / pertemuan",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: k_tk == true ? true : false,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgstk1,
                          onChanged: (value) {
                            setState(() {
                              tgstk1 = !tgstk1;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Perawatan dan pemeliharaan berbagai tanaman, dari bunga hingga pohon dan semak",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgstk2,
                          onChanged: (value) {
                            setState(() {
                              tgstk2 = !tgstk2;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Pengolahan tanah, pemupukan dan nutrisi tanaman",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Color(int.parse(globals.color_primary)),
                          value: tgstk3,
                          onChanged: (value) {
                            setState(() {
                              tgstk3 = !tgstk3;
                            });
                          }),
                      Expanded(
                        child: Text(
                          "Bersihkan area hijau daun, potong rumput, dan puing-puing",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            addTugas(),
            const SizedBox(
              height: 5,
            ),
            listView(),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Kriteria Lowongan kerja",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Text(
                  " *",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 15,
                          color: Color(int.parse(globals.color_secondary)))),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      tthewan = !tthewan;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: tthewan == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: tthewan == true ? 2 : 1)),
                    child: Text(
                      "Tidak Takut Hewan",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: tthewan == true
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: tthewan == true
                                  ? Color(int.parse(globals.color_primary))
                                  : Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      masak = !masak;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: masak == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: masak == true ? 2 : 1)),
                    child: Text(
                      "Memasak",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: masak == true
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: masak == true
                                  ? Color(int.parse(globals.color_primary))
                                  : Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  tmperj = !tmperj;
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: tmperj == true
                            ? Color(int.parse(globals.color_primary))
                            : const Color.fromARGB(255, 138, 138, 138),
                        width: tmperj == true ? 2 : 1)),
                child: Text(
                  "Tidak Mabuk Perjalanan",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: tmperj == true
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: tmperj == true
                              ? Color(int.parse(globals.color_primary))
                              : Colors.black)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  mspdmtr = !mspdmtr;
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: mspdmtr == true
                            ? Color(int.parse(globals.color_primary))
                            : const Color.fromARGB(255, 138, 138, 138),
                        width: mspdmtr == true ? 2 : 1)),
                child: Text(
                  "Menyetir Sepeda Motor",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: mspdmtr == true
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: mspdmtr == true
                              ? Color(int.parse(globals.color_primary))
                              : Colors.black)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  mmobil = !mmobil;
                });
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    border: Border.all(
                        color: mmobil == true
                            ? Color(int.parse(globals.color_primary))
                            : const Color.fromARGB(255, 138, 138, 138),
                        width: mmobil == true ? 2 : 1)),
                child: Text(
                  "Menyetir Mobil",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: mmobil == true
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: mmobil == true
                              ? Color(int.parse(globals.color_primary))
                              : Colors.black)),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      menginap = !menginap;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: menginap == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: menginap == true ? 2 : 1)),
                    child: Text(
                      "Menginap",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: menginap == true
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: menginap == true
                                  ? Color(int.parse(globals.color_primary))
                                  : Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      warnen = !warnen;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: warnen == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: warnen == true ? 2 : 1)),
                    child: Text(
                      "Warnen",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: warnen == true
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: warnen == true
                                  ? Color(int.parse(globals.color_primary))
                                  : Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      ssingle = !ssingle;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: ssingle == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: ssingle == true ? 2 : 1)),
                    child: Text(
                      "Belum Menikah",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: ssingle == true
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: ssingle == true
                                  ? Color(int.parse(globals.color_primary))
                                  : Colors.black)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      smarried = !smarried;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                            color: smarried == true
                                ? Color(int.parse(globals.color_primary))
                                : const Color.fromARGB(255, 138, 138, 138),
                            width: smarried == true ? 2 : 1)),
                    child: Text(
                      "Sudah Menikah",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: smarried == true
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: smarried == true
                                  ? Color(int.parse(globals.color_primary))
                                  : Colors.black)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      int countnull = 0;

                      if (k_prt == true ||
                          k_bs == true ||
                          k_sc == true ||
                          k_supir == true ||
                          k_obog == true ||
                          k_tk == true) {
                        if (tthewan == true ||
                            masak == true ||
                            tmperj == true ||
                            mspdmtr == true ||
                            mmobil == true ||
                            menginap == true ||
                            warnen == true ||
                            ssingle == true ||
                            smarried == true) {
                          if (tgsprt1 == true ||
                              tgsprt2 == true ||
                              tgsprt3 == true ||
                              tgsbs1 == true ||
                              tgsbs2 == true ||
                              tgsbs3 == true ||
                              tgssc1 == true ||
                              tgssc2 == true ||
                              tgssc3 == true ||
                              tgssupir1 == true ||
                              tgssupir2 == true ||
                              tgssupir3 == true ||
                              tgsobog1 == true ||
                              tgsobog2 == true ||
                              tgsobog3 == true ||
                              tgstk1 == true ||
                              tgstk2 == true ||
                              tgstk3 == true) {
                            if (judulctr.text != "" &&
                                mingajictr.text != "" &&
                                maxgajictr.text != "" &&
                                infoctr.text != "") {
                              for (int i = 0; i < tugasctr.length; i++) {
                                if (tugasctr[i].text == "") {
                                  countnull++;
                                }
                              }
                              if (countnull == 0) {
                                prepareData();
                              } else {
                                popUpDialog();
                              }
                            } else {
                              popUpDialog();
                            }
                          } else {
                            popUpDialog();
                          }
                        } else {
                          popUpDialog();
                        }
                      } else {
                        popUpDialog();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      widget.konten == "edit"
                          ? "Ubah Lowongan Kerja"
                          : "Tambah Lowongan Kerja",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15,
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
