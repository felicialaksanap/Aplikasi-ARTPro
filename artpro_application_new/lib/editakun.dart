import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import './global.dart' as globals;

class EditAkun extends StatefulWidget {
  String kontenEdit;
  EditAkun({super.key, required this.kontenEdit});

  @override
  State<EditAkun> createState() => _EditAkunState();
}

class _EditAkunState extends State<EditAkun> {
  bool hide_pass = true;
  bool hide_konfpass = true;

  TextEditingController passctr = TextEditingController();
  TextEditingController konfpassctr = TextEditingController();
  TextEditingController emailctr = TextEditingController();

  String msgemail = "";
  String msgpass = "";
  String message = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailctr.text = globals.email;
  }

  void validateEmail(String value) {
    bool validate = EmailValidator.validate(value);
    if (validate == false) {
      setState(() {
        msgemail = "format email tidak sesuai";
      });
    } else {
      setState(() {
        msgemail = "";
      });
    }
  }

  void updateData() async {
    setState(() {
      if (widget.kontenEdit == "email") {
        globals.email = emailctr.text;
      } else {
        globals.password = passctr.text;
      }
    });

    if (widget.kontenEdit == "email") {
      var url = "${globals.urlapi}editemailuser";
      // ignore: unused_local_variable
      var response = await http.put(Uri.parse(url),
          body: {"iduser": globals.iduser, "email": globals.email});
    } else {
      var url = "${globals.urlapi}editpassuser";
      // ignore: unused_local_variable
      var response = await http.put(Uri.parse(url),
          body: {"email": globals.email, "password": globals.password});
    }

    sharedprefAkunUser();
  }

  sharedprefAkunUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", globals.email);
    prefs.setString("password", globals.password);

    messagetoBack();
  }

  messagetoBack() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              widget.kontenEdit == "password"
                  ? "Password berhasil diganti, silahkan kembali ke menu profile"
                  : "Email berhasil diganti, silahkan kembali ke menu profile",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(int.parse(globals.color_primary)),
          ),
        ),
        title: Text(
          widget.kontenEdit == "password" ? "Ganti Password" : "Ganti Email",
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  color: Color(int.parse(globals.color_primary)),
                  fontWeight: FontWeight.bold)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Visibility(
                visible: widget.kontenEdit == "password" ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password Baru",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      child: TextField(
                        controller: passctr,
                        onChanged: (value) {
                          if (value.length > 16) {
                            setState(() {
                              msgpass = "password tidak melebihi 16 Karakter";
                            });
                          } else if (value.length < 6) {
                            setState(() {
                              msgpass = "password minimal 6 karakter";
                            });
                          } else {
                            setState(() {
                              msgpass = "";
                            });
                          }
                        },
                        obscureText: hide_pass,
                        cursorColor: Color(int.parse(globals.color_primary)),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black)),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 138, 138, 138))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 138, 138, 138))),
                          hintText: '*******',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 138, 138, 138))),
                          contentPadding:
                              const EdgeInsets.only(top: 2.0, left: 8.0),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hide_pass = !hide_pass;
                                });
                              },
                              icon: Icon(
                                hide_pass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(int.parse(globals.color_primary)),
                              )),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: msgpass != "" ? true : false,
                        child: Text(
                          msgpass,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Konfirmasi Password",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      child: TextField(
                        controller: konfpassctr,
                        onChanged: (value) {
                          if (value != passctr.text) {
                            setState(() {
                              message = "password tidak sama";
                            });
                          } else {
                            setState(() {
                              message = "";
                            });
                          }
                        },
                        obscureText: hide_konfpass,
                        cursorColor: Color(int.parse(globals.color_primary)),
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 15, color: Colors.black)),
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 138, 138, 138))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 138, 138, 138))),
                          hintText: '*******',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 138, 138, 138))),
                          contentPadding:
                              const EdgeInsets.only(top: 2.0, left: 8.0),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hide_konfpass = !hide_konfpass;
                                });
                              },
                              icon: Icon(
                                hide_konfpass
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(int.parse(globals.color_primary)),
                              )),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: message != "" ? true : false,
                      child: Text(
                        message,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                color:
                                    Color(int.parse(globals.color_secondary)))),
                      ),
                    ),
                  ],
                )),
            Visibility(
                visible: widget.kontenEdit == "email" ? true : false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: TextField(
                        controller: emailctr,
                        onChanged: (value) {
                          validateEmail(value);
                        },
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
                            hintText: "contoh@gmail.com",
                            contentPadding: EdgeInsets.fromLTRB(8, 4, 8, 4)),
                        maxLines: 1,
                      ),
                    ),
                    Visibility(
                        visible: msgemail != "" ? true : false,
                        child: Text(
                          msgemail,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Color(
                                      int.parse(globals.color_secondary)))),
                        )),
                  ],
                )),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      updateData();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(int.parse(globals.color_primary)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Text(
                      widget.kontenEdit == "email"
                          ? "Ganti Email"
                          : "Ganti Password",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
