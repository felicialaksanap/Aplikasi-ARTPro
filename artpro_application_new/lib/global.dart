// ignore_for_file: non_constant_identifier_names

import 'package:image_picker/image_picker.dart';

String color_primary = '0xFF246A73';
String color_secondary = '0xFFFF4D00';

int select_index = 0; // navigasi beranda

String urlapi = "http://192.168.170.219:1234/";

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
String profpicpathdb = "";

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
String fotoktpdb = "";
String selfiektpdb = "";

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
String tkmenginap = "";
String tkwarnen = "";
String hewan = "";
String mabukJalan = "";
String spdmotor = "";
String mobil = "";
String masak = "";

// Detail kerja ART //
String kprt = "";
String kbabysitter = "";
String kseniorcare = "";
String ksupir = "";
String kofficeboy = "";
String ktukangkebun = "";
String pengalaman = "";
String gajiawal = "";
String gajiakhir = "";

// Lowongan Kerja //
// --- store data from database to see loker at specific iduser ---
List<String> idloker = [];
List<String> iduserloker = [];
List<String> judulloker = [];
List<String> gajiawalloker = [];
List<String> gajiakhirloker = [];
List<String> informasiloker = [];
List<String> tugasloker = [];
List<String> kriteria = [];
List<String> kprtloker = [];
List<String> kbabysitterloker = [];
List<String> kseniorcareloker = [];
List<String> ksupirloker = [];
List<String> kofficeboyloker = [];
List<String> ktukangkebunloker = [];
List<String> tglpost = [];
List<String> namamajikan = [];
List<String> jeniskelaminloker = [];
List<String> kecamatanloker = [];
List<String> kotaloker = [];
List<bool> expandloker = [];

List<String> stringtugas = [];
List<String> stringkriteria = [];
List<String> kategori = [];
