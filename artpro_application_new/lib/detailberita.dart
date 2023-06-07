import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'global.dart' as globals;

class DetailBerita extends StatefulWidget {
  int index;
  String konten = "";
  DetailBerita({super.key, required this.index, required this.konten});

  @override
  State<DetailBerita> createState() => _DetailBeritaState();
}

class _DetailBeritaState extends State<DetailBerita> {
  // openBerita() async {
  //   var url = Uri.parse(globals.listBeritaTips[widget.index].url);
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.konten == "berita"
                  ? globals.listBeritaTips[widget.index].judul
                  : globals.ListInfoPelatihan[widget.index].judul,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage(widget.konten == "berita"
                          ? '${globals.urlapi}getimage?id=${globals.listBeritaTips[widget.index].idberita}&folder=berita'
                          : '${globals.urlapi}getimage?id=${globals.ListInfoPelatihan[widget.index].idinfo}&folder=info'),
                      fit: BoxFit.fitWidth)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.konten == "berita"
                      ? "Diunggah pada: ${globals.listBeritaTips[widget.index].tglpost}"
                      : "Diunggah pada: ${globals.ListInfoPelatihan[widget.index].tglpost}",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 138, 138, 138))),
                ),
                InkWell(
                  child: Text(
                    widget.konten == "berita"
                        ? "Sumber berita : ${globals.listBeritaTips[widget.index].url}"
                        : "Sumber berita : ${globals.ListInfoPelatihan[widget.index].url}",
                    style: GoogleFonts.poppins(
                        textStyle:
                            const TextStyle(fontSize: 15, color: Colors.blue)),
                  ),
                  onTap: () => widget.konten == "berita"
                      ? launchUrl(
                          Uri.parse(globals.listBeritaTips[widget.index].url))
                      : launchUrl(Uri.parse(
                          globals.ListInfoPelatihan[widget.index].url)),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.konten == "berita"
                  ? globals.listBeritaTips[widget.index].isi
                  : globals.ListInfoPelatihan[widget.index].isi,
              style:
                  GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 15)),
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
