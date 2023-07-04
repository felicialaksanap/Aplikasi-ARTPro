// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:artpro_application_new/modeltemp/modeltemp.dart';
import 'package:artpro_application_new/penilaian.dart';
import 'package:artpro_application_new/services/tambahanservices.dart';
import 'package:http/http.dart' as http;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotifikasi();
  }

  void getNotifikasi() async {
    await Notifikasi.getAllData(int.parse(globals.iduser)).then((value) {
      setState(() {
        setState(() {
          globals.listNotifikasi.clear();
          globals.listNotifikasi = value;
        });
      });
    });
  }

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
              itemCount: globals.listNotifikasi.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    if (globals.listNotifikasi[index].status == "active") {
                      var url = "${globals.urlapi}updatestatusnotif";
                      var response = await http.put(Uri.parse(url), body: {
                        "idnotif":
                            globals.listNotifikasi[index].idnotif.toString(),
                        "status": "inactive"
                      });
                      setState(() {
                        globals.listNotifikasi[index].status = "inactive";
                      });
                    }

                    if (globals.listNotifikasi[index].title == "Penilaian") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Penilaian(
                                    idart: globals.listNotifikasi[index].idart,
                                  )));
                    }
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
                                globals.listNotifikasi[index].message,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 15,
                                        fontWeight: globals
                                                    .listNotifikasi[index]
                                                    .status ==
                                                "active"
                                            ? FontWeight.bold
                                            : FontWeight.normal)),
                              )),
                              Visibility(
                                visible: globals.listNotifikasi[index].status ==
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
