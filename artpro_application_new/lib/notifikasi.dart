import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:artpro_application_new/penilaian.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'global.dart' as globals;

class NotifikasiPage extends StatefulWidget {
  const NotifikasiPage({super.key});

  @override
  State<NotifikasiPage> createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(int.parse(globals.color_primary)),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Notifikasi",
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(color: Color(int.parse(globals.color_primary)))),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: MListNotif.isiNotif.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (MListNotif.isiNotif[index].statusnotif == "active") {
                      setState(() {
                        MListNotif.isiNotif[index].statusnotif = "inactive";
                      });
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Penilaian()));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                MListNotif.isiNotif[index].isinotif,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: MListNotif.isiNotif[index]
                                                    .statusnotif ==
                                                "active"
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                              Visibility(
                                visible:
                                    MListNotif.isiNotif[index].statusnotif ==
                                            "active"
                                        ? true
                                        : false,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Color(
                                              int.parse(globals.color_primary)),
                                          borderRadius:
                                              BorderRadius.circular(50.0)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ));
  }
}
