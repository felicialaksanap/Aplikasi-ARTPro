import 'dart:io';

import 'package:artpro_application_new/editakun.dart';
import 'package:artpro_application_new/editalamat.dart';
import 'package:artpro_application_new/mainberanda.dart';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import './global.dart' as globals;

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  DateTime date = DateTime.now();
  String dateformat = "";

  bool statusedit = false;

  TextEditingController namactr = TextEditingController();
  TextEditingController tmplahirctr = TextEditingController();
  TextEditingController notelpctr = TextEditingController();

  XFile? imageprofpic;
  final ImagePicker picker = ImagePicker();
  List<ProfileUser> listProfileUser = [];

  String jeniskelamin = "";
  List<String> menuJenisKelamin = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namactr.text = globals.namalengkap;
    tmplahirctr.text = globals.tempatlahir;
    notelpctr.text = globals.telephone;
    dateformat = globals.tanggallahir;

    if (globals.jeniskelamin == "P") {
      jeniskelamin = "Perempuan";
      menuJenisKelamin.add("Perempuan");
      menuJenisKelamin.add("Laki-Laki");
    } else {
      jeniskelamin = "Laki-Laki";
      menuJenisKelamin.add("Laki-Laki");
      menuJenisKelamin.add("Perempuan");
    }
  }

  Future getImage(ImageSource media, String take) async {
    var img = await picker.pickImage(source: media, imageQuality: 10);

    setState(() {
      imageprofpic = img;
      globals.profpicpath = imageprofpic;
      print("profpic file click: ${globals.profpicpath?.path}");
    });

    var url = "${globals.urlapi}uploadimage";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['id'] = globals.iduser.toString();
    request.fields['folder'] = take;
    request.files.add(
        await http.MultipartFile.fromPath('photo', globals.profpicpath!.path));
    var res = await request.send();
  }

  void getAkunProfileUser() async {
    ProfileUser.getData(globals.iduser).then((value) {
      listProfileUser = value;
      if (listProfileUser.isNotEmpty) {
        setState(() {
          globals.namalengkap = listProfileUser[0].namalengkap;
          globals.jeniskelamin = listProfileUser[0].jeniskelamin;
          globals.tempatlahir = listProfileUser[0].tempatlahir;
          globals.tanggallahir = listProfileUser[0].tanggallahir;
          globals.telephone = listProfileUser[0].telephone;
          globals.profpicpathdb = listProfileUser[0].profilepicpath;
        });
      }
    });

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MainBeranda()));
  }

  void updateData() async {
    setState(() {
      globals.namalengkap = namactr.text;
      if (jeniskelamin == "Perempuan") {
        globals.jeniskelamin = "P";
      } else {
        globals.jeniskelamin = "L";
      }
      globals.tempatlahir = tmplahirctr.text;
      globals.tanggallahir = dateformat;
      globals.telephone = notelpctr.text;
    });

    var url = "${globals.urlapi}editprofileuser";
    // ignore: unused_local_variable
    var response = await http.put(Uri.parse(url), body: {
      "iduser": globals.iduser,
      "namalengkap": globals.namalengkap,
      "jeniskelamin": globals.jeniskelamin,
      "tempatlahir": globals.tempatlahir,
      "tanggallahir": globals.tanggallahir,
      "telephone": globals.telephone
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
            getAkunProfileUser();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
        ),
        title: Text(
          statusedit == true ? "Ubah Profile" : "Lihat Profile",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(int.parse(globals.color_primary)),
                  fontWeight: FontWeight.bold)),
        ),
        actions: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      if (statusedit == true) {
                        updateData();
                      }
                      statusedit = !statusedit;
                    });
                  },
                  child: Text(
                    statusedit == true ? 'Selesai' : "Ubah",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Color(int.parse(globals.color_secondary)),
                            fontWeight: FontWeight.bold)),
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                globals.profpicpath != null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            image: DecorationImage(
                                image: FileImage(
                                    File("${globals.profpicpath?.path}")),
                                fit: BoxFit.fill)),
                      )
                    : globals.profpicpathdb != "-"
                        ? Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${globals.urlapi}getimage?id=${globals.iduser}&folder=profpic'),
                                    fit: BoxFit.fill)),
                          )
                        : Icon(
                            Icons.account_circle_rounded,
                            size: 100,
                            color: Color(int.parse(globals.color_primary)),
                          ),
              ],
            ),
            Visibility(
              visible: statusedit == true ? true : false,
              child: Center(
                child: TextButton(
                    onPressed: () {
                      getImage(ImageSource.gallery, "profpic");
                    },
                    child: Text(
                      'Ganti Gambar',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)))),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Nama Lengkap",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.namalengkap}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 15,
                    )),
                  )
                : Container(
                    child: TextField(
                      controller: namactr,
                      cursorColor: Color(int.parse(globals.color_primary)),
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
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Jenis Kelamin",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     $jeniskelamin",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )
                : Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 138, 138, 138)),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: jeniskelamin,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black)),
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Color(int.parse(globals.color_primary)),
                        ),
                        items: menuJenisKelamin.map((item) {
                          return DropdownMenuItem(
                            child: Text(
                              item,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.black, fontSize: 15)),
                            ),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            jeniskelamin = newValue!;
                            globals.jeniskelamin = jeniskelamin;

                            print(
                                "jenis kelamin baru: ${globals.jeniskelamin}");
                          });
                        },
                      ),
                    )),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Tempat Lahir",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.tempatlahir}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 15,
                    )),
                  )
                : Container(
                    child: TextField(
                      controller: tmplahirctr,
                      cursorColor: Color(int.parse(globals.color_primary)),
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
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tanggal Lahir',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.tanggallahir}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )
                : Container(
                    height: 50,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromARGB(255, 138, 138, 138),
                              width: 1.0),
                          borderRadius: BorderRadius.circular(5.0)),
                      onTap: () async {
                        DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        if (newDate == null) return;
                        setState(() {
                          date = newDate;
                          dateformat = DateFormat('dd-MM-yyyy').format(date);
                        });
                      },
                      trailing: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          Icons.calendar_month,
                          size: 30,
                          color: Color(int.parse(globals.color_primary)),
                        ),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          dateformat,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15, color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "No. Telephone",
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(
              height: 5,
            ),
            statusedit == false
                ? Text(
                    "     ${globals.telephone}",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 15)),
                  )
                : Container(
                    child: TextField(
                      controller: notelpctr,
                      cursorColor: Color(int.parse(globals.color_primary)),
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
                          contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                    ),
                  ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 1,
              color: Colors.black26,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verifikasi KTP",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 15,
                            color: Color(int.parse(globals.color_primary)),
                            fontWeight: FontWeight.w500)),
                  ),
                  Text(
                    "Belum verifikasi",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                      fontSize: 14,
                      color: Colors.black38,
                    )),
                  ),
                  Icon(
                    Icons.cancel,
                    color: Color(int.parse(globals.color_secondary)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditAkun(kontenEdit: "email")));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 2))
                    ]),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ganti Email",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      ">>>>>",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            EditAkun(kontenEdit: "password")));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 2))
                    ]),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ganti Password",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      ">>>>>",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditAlamat()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 4,
                          offset: const Offset(0, 2))
                    ]),
                padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ganti Alamat Domisili",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.w500)),
                    ),
                    Text(
                      ">>>>>",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15,
                              color: Color(int.parse(globals.color_primary)),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
