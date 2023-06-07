import 'package:artpro_application_new/detailberita.dart';
import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as globals;

class ListBerita extends StatefulWidget {
  String konten = "";

  ListBerita({super.key, required this.konten});

  @override
  State<ListBerita> createState() => _ListBeritaState();
}

class _ListBeritaState extends State<ListBerita> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme:
              IconThemeData(color: Color(int.parse(globals.color_primary))),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(int.parse(globals.color_primary)),
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/logo_theme.png',
                width: 100,
              ),
            ],
          )),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: ListView.builder(
            itemCount: widget.konten == "berita"
                ? globals.listBeritaTips.length
                : globals.ListInfoPelatihan.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailBerita(
                                    index: index,
                                    konten: widget.konten,
                                  )));
                    },
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            widget.konten == "berita"
                                ? '${globals.urlapi}getimage?id=${globals.listBeritaTips[index].idberita}&folder=berita'
                                : '${globals.urlapi}getimage?id=${globals.ListInfoPelatihan[index].idinfo}&folder=info',
                            height: 100,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.konten == "berita"
                                    ? globals.listBeritaTips[index].judul
                                    : globals.ListInfoPelatihan[index].judul,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.konten == "berita"
                                    ? "diunggah pada ${globals.listBeritaTips[index].tglpost}"
                                    : "diunggah pada ${globals.ListInfoPelatihan[index].tglpost}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Color.fromARGB(
                                            255, 138, 138, 138))),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
