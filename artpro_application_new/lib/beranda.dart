import 'package:artpro_application_new/detailberita.dart';
import 'package:artpro_application_new/listart.dart';
import 'package:artpro_application_new/listberita.dart';
import 'package:artpro_application_new/listloker.dart';
import 'package:artpro_application_new/notifikasi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';
import 'detailloker.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<String> kriteria = [];
  String tempkriteria = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (globals.status_user == "pekerja") {}
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo_theme.png',
                  width: 100,
                ),
                IconButton(
                    onPressed: () {
                      if (globals.status_user == "majikan") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NotifikasiPage()));
                      }
                    },
                    icon: Icon(
                      Icons.notifications_active_rounded,
                      color: Color(int.parse(globals.color_primary)),
                      size: 28,
                    ))
              ],
            ),
            Visibility(
                visible: globals.status_user == "majikan" ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cari Layanan',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListART(
                                          konten: "Pembantu Rumah Tangga",
                                        )));
                          },
                          child: Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height: 60,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/household.jpg'),
                                          fit: BoxFit.fitWidth)),
                                ),
                                Text(
                                  'Pembantu Rumah Tangga',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListART(
                                          konten: "Baby Sitter",
                                        )));
                          },
                          child: Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height: 60,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/babysitter.jpg'),
                                          fit: BoxFit.fitWidth)),
                                ),
                                Text(
                                  'Baby Sitter\n Nanny',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListART(
                                          konten: "Penjaga Lansia",
                                        )));
                          },
                          child: Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height: 60,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/seniorcare.jpg'),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Text(
                                  'Penjaga Lansia',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListART(
                                          konten: "Office Boy/Girl",
                                        )));
                          },
                          child: Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height: 60,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/officegirl.jpg'),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Text(
                                  'Office Boy\n Office Girl',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListART(
                                          konten: "Supir Pribadi",
                                        )));
                          },
                          child: Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height: 60,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/cardriver.jpg'),
                                          fit: BoxFit.fitWidth)),
                                ),
                                Text(
                                  'Supir Pribadi',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListART(
                                          konten: "Tukang Kebun",
                                        )));
                          },
                          child: Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2))
                                ]),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  height: 60,
                                  width: 85,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/gardener.jpg'),
                                          fit: BoxFit.fitHeight)),
                                ),
                                Text(
                                  'Tukang Kebun',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            Visibility(
                visible: globals.status_user == "pekerja" ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cari Lowongan Kerja',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ListLoker()));
                            },
                            child: Text(
                              "Lihat semua",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      color: Color(
                                          int.parse(globals.color_secondary)))),
                            ))
                      ],
                    ),
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
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                MListLoker.isiListLoker[0].judul,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                            int.parse(globals.color_primary)))),
                              ),
                              Text(
                                "Ibu ${MListLoker.isiListLoker[0].namamajikan}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${MListLoker.isiListLoker[0].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Text(
                                "${MListLoker.isiListLoker[0].rangegaji} per bulan",
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
                                "${MListLoker.isiListLoker[0].informasi}",
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
                                    "Post pada ${MListLoker.isiListLoker[0].tglpost}",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 11, color: Colors.black)),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          MListLoker.isiListLoker[0].expand =
                                              !MListLoker
                                                  .isiListLoker[0].expand;
                                        });
                                      },
                                      icon: MListLoker.isiListLoker[0].expand ==
                                              false
                                          ? Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(int.parse(
                                                  globals.color_primary)),
                                            )
                                          : Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color: Color(int.parse(
                                                  globals.color_primary)),
                                            ))
                                ],
                              ),
                              Visibility(
                                  visible:
                                      MListLoker.isiListLoker[0].expand == true
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
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                        kriteria[0],
                                        style: GoogleFonts.poppins(
                                            textStyle:
                                                const TextStyle(fontSize: 13)),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Kategori Pekerjaan",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                        MListLoker.isiListLoker[0].kategori,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color(int.parse(
                                                    globals.color_primary)))),
                                      )
                                    ],
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
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                MListLoker.isiListLoker[1].judul,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                            int.parse(globals.color_primary)))),
                              ),
                              Text(
                                "Bapak ${MListLoker.isiListLoker[1].namamajikan}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15, color: Colors.black)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${MListLoker.isiListLoker[1].kecamatan}, ${MListLoker.isiListLoker[0].asalkota} | ${MListLoker.isiListLoker[0].jaraklokasi}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                              Text(
                                "${MListLoker.isiListLoker[1].rangegaji} per bulan",
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
                                "${MListLoker.isiListLoker[1].informasi}",
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
                                    "Post pada ${MListLoker.isiListLoker[1].tglpost}",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 11, color: Colors.black)),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          MListLoker.isiListLoker[1].expand =
                                              !MListLoker
                                                  .isiListLoker[1].expand;
                                        });
                                      },
                                      icon: MListLoker.isiListLoker[1].expand ==
                                              false
                                          ? Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(int.parse(
                                                  globals.color_primary)),
                                            )
                                          : Icon(
                                              Icons.keyboard_arrow_up_rounded,
                                              color: Color(int.parse(
                                                  globals.color_primary)),
                                            ))
                                ],
                              ),
                              Visibility(
                                  visible:
                                      MListLoker.isiListLoker[1].expand == true
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
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                        kriteria[1],
                                        style: GoogleFonts.poppins(
                                            textStyle:
                                                const TextStyle(fontSize: 13)),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Kategori Pekerjaan",
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                        MListLoker.isiListLoker[1].kategori,
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Color(int.parse(
                                                    globals.color_primary)))),
                                      )
                                    ],
                                  ))
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Berita & Tips',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 22, 15, 41),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ListBerita()));
                    },
                    child: Text(
                      "Lihat semua",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color:
                                  Color(int.parse(globals.color_secondary)))),
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: MBerita.isiBerita.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailBerita(index: index)));
                    },
                    child: Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                MBerita.isiBerita[index].gambarUrl,
                                height: 150,
                                width: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 250,
                              child: Text(
                                MBerita.isiBerita[index].judul,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ),
                            )
                          ],
                        ),
                        index != MBerita.isiBerita.length - 1
                            ? const SizedBox(
                                width: 20,
                              )
                            : const SizedBox(
                                width: 0,
                              )
                      ],
                    ),
                  );
                },
              ),
            ),
            Visibility(
                visible: globals.status_user == "pekerja" ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Materi',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 22, 15, 41),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: MBerita.isiBerita.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print("selected index berita: $index");
                            },
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        MBerita.isiBerita[index].gambarUrl,
                                        height: 150,
                                        width: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      width: 250,
                                      child: Text(
                                        MBerita.isiBerita[index].judul,
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    )
                                  ],
                                ),
                                index != MBerita.isiBerita.length - 1
                                    ? const SizedBox(
                                        width: 20,
                                      )
                                    : const SizedBox(
                                        width: 0,
                                      )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
