import 'package:artpro_application_new/listart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_active_rounded,
                      color: Color(int.parse(globals.color_primary)),
                      size: 28,
                    ))
              ],
            ),
            Text(
              'Cari Layanan',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
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
                            builder: (context) => const ListART()));
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
                                  image:
                                      AssetImage('assets/images/household.jpg'),
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
                    print('baby sitter/nanny');
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
                    print('penjaga lansia');
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
                    print('office boy/girl');
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
                    print('supir pribadi');
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
                                  image:
                                      AssetImage('assets/images/cardriver.jpg'),
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
                    print('tukang kebun');
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
                                  image:
                                      AssetImage('assets/images/gardener.jpg'),
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
            const SizedBox(
              height: 40,
            ),
            Text(
              'Berita & Tips',
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
        ),
      ),
    );
  }
}
