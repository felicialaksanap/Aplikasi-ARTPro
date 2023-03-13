import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;
import './modeltemp/modeltemp.dart';
import './detailart.dart';

class ListARTKarir extends StatefulWidget {
  const ListARTKarir({super.key});

  @override
  State<ListARTKarir> createState() => _ListARTKarirState();
}

class _ListARTKarirState extends State<ListARTKarir> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme:
            IconThemeData(color: Color(int.parse(globals.color_primary))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: MListART.isiListART.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailART()));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            MListART
                                                .isiListART[index].gambarUrl,
                                          ),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 40,
                                  padding: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                      color: Color(
                                          int.parse(globals.color_primary)),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text(
                                    MListART.isiListART[index].rating,
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            ],
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
                                MListART.isiListART[index].nama,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Text(
                                "${MListART.isiListART[index].umur} | ${MListART.isiListART[index].jarak}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 14,
                                )),
                              )
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.call,
                              size: 30,
                              color: Color(int.parse(globals.color_primary)),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
