import 'package:artpro_application_new/detailberita.dart';
import 'package:artpro_application_new/listart.dart';
import 'package:artpro_application_new/listberita.dart';
import 'package:artpro_application_new/notifikasi.dart';
import 'package:artpro_application_new/services/tambahanservices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  bool finishgetdata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBerita();
  }

  void getBerita() {
    BeritaTips.getAllData().then((value) {
      setState(() {
        globals.listBeritaTips.clear();
        globals.listBeritaTips = value;

        for (int i = 0; i < globals.listBeritaTips.length; i++) {
          globals.listBeritaTips[i].isi =
              globals.listBeritaTips[i].isi.replaceAll("<br>", "\n");
        }
        finishgetdata = true;
      });
    });
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
                                      builder: (context) =>
                                          const NotifikasiPage()));
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
                                                konten: "prt",
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
                                                konten: "babysitter",
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
                                                konten: "seniorcare",
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
                                                konten: "officeboy",
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
                                                konten: "supir",
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
                                                konten: "tukangkebun",
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
                                    builder: (context) => ListBerita(
                                          konten: "berita",
                                        )));
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailBerita(
                                          index: index,
                                          konten: "berita",
                                        )));
                          },
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      '${globals.urlapi}getimage?id=${globals.listBeritaTips[index].idberita}&folder=berita',
                                      height: 150,
                                      width: 250,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 250,
                                    child: Text(
                                      globals.listBeritaTips[index].judul,
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )
                                ],
                              ),
                              index != 4
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
                ],
              ),
            ),
    );
  }
}
