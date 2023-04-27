// ignore_for_file: non_constant_identifier_names

import 'package:image_picker/image_picker.dart';

String color_primary = '0xFF246A73';
String color_secondary = '0xFFFF4D00';

int select_index = 0;

String urlapi = "http://192.168.1.22:1234/";

// Akun User //
String email = "";
String password = "";
String status_user = "";

// Profile User //
String iduser = "";
String namalengkap = "";
String jeniskelamin = "";
String tempatlahir = "";
String tanggallahir = "";
String telephone = "";
XFile? profpicpath;

// Alamat Domisili User //
String alamatdom = "";
String kecdom = "";
String keldom = "";
String provdom = "";
String kotadom = "";
String longitude = "";
String latitude = "";

// Verifikasi Data User //
String nik = "";
String alamatktp = "";
String kecktp = "";
String kelktp = "";
String provktp = "";
String kotaktp = "";
String rt = "";
String rw = "";
XFile? fotoktp;
XFile? selfiektp;
String statusverifikasi = "";

// Id detail address of verifikasi user //
String idprovktp = "";
String idkotktp = "";
String idkecktp = "";
String idkelktp = "";

// Profile ART //
String pendidikanterakhir = "";
String berat = "";
String tinggi = "";
String agama = "";
String tipekerja =
    ""; // more than one choices, use ",", for easy to filter it to list
String hewan = "";
String mabukJalan = "";
String spdmotor = "";
String mobil = "";
String masak = "";

// Detail kerja ART //
String kategori =
    ""; // it can be more than one, so use "," for easy to convert it to list
String pengalaman = "";
String gajiawal = "";
String gajiakhir = "";
