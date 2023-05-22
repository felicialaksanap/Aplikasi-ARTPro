// ignore_for_file: non_constant_identifier_names

import 'package:artpro_application_new/services/lokerservices.dart';
import 'package:artpro_application_new/services/userservices.dart';
import 'package:image_picker/image_picker.dart';

String color_primary = '0xFF246A73';
String color_secondary = '0xFFFF4D00';

int select_index = 0; // navigasi beranda

String urlapi = "http://192.168.1.15:1234/";

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
int tkmenginap = 0;
int tkwarnen = 0;
int hewan = 0;
int mabukJalan = 0;
int spdmotor = 0;
int mobil = 0;
int masak = 0;
int ssingle = 0;
int smarried = 0;

// Detail kerja ART //
int kprt = 0;
int kbabysitter = 0;
int kseniorcare = 0;
int ksupir = 0;
int kofficeboy = 0;
int ktukangkebun = 0;
String pengalaman = "";
String gajiawal = "";
String gajiakhir = "";

// Lowongan Kerja //
// --- store data from database to see loker at specific iduser ---
List<Loker> listLokerAktif = [];
List<Loker> listLokerTidakAktif = [];

List<String> listTugas = [];
List<String> kategori = [];
List<String> kriteria = [];
List<String> listKriteria = [];

List<String> kategorina = [];
List<String> kriteriana = [];

List<DataARTbyKategori> listARTbyKategori = [];
List<ReviewMajikan> listReviewMajikan = [];
// ==== Penilaian ====
