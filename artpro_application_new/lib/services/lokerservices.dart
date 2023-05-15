import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:artpro_application_new/global.dart' as globals;

class Loker {
  String idloker;
  String iduser;
  String judulloker;
  String gajiawal;
  String gajiakhir;
  String informasi;
  String tugas; // string pakai '.'
  int kprt;
  int kbabysitter;
  int kseniorcare;
  int ksupir;
  int kofficeboy;
  int ktukangkebun;
  int hewan;
  int masak;
  int mabukjalan;
  int sepedamotor;
  int mobil;
  int tkmenginap;
  int tkwarnen;
  int ssingle;
  int smarried;
  String tglpost;
  int statusloker;
  String namalengkap;
  String jeniskelamin;
  String kecamatan;
  String kota;
  bool expand;

  Loker(
      {required this.idloker,
      required this.iduser,
      required this.judulloker,
      required this.gajiawal,
      required this.gajiakhir,
      required this.informasi,
      required this.tugas,
      required this.kprt,
      required this.kbabysitter,
      required this.kseniorcare,
      required this.ksupir,
      required this.kofficeboy,
      required this.ktukangkebun,
      required this.hewan,
      required this.masak,
      required this.mabukjalan,
      required this.sepedamotor,
      required this.mobil,
      required this.tkmenginap,
      required this.tkwarnen,
      required this.ssingle,
      required this.smarried,
      required this.tglpost,
      required this.statusloker,
      required this.namalengkap,
      required this.jeniskelamin,
      required this.kecamatan,
      required this.kota,
      required this.expand});

  factory Loker.createData(Map<String, dynamic> object) {
    return Loker(
        idloker: object['idloker'].toString(),
        iduser: object['iduser'].toString(),
        judulloker: object['judulloker'],
        gajiawal: object['gajiawal'],
        gajiakhir: object['gajiakhir'],
        informasi: object['informasi'],
        tugas: object['tugas'],
        kprt: object['kprt'],
        kbabysitter: object['kbabysitter'],
        kseniorcare: object['kseniorcare'],
        ksupir: object['ksupir'],
        kofficeboy: object['kofficeboy'],
        ktukangkebun: object['ktukangkebun'],
        hewan: object['hewan'],
        masak: object['masak'],
        mabukjalan: object['mabukjalan'],
        sepedamotor: object['sepedamotor'],
        mobil: object['mobil'],
        tkmenginap: object['tkmenginap'],
        tkwarnen: object['tkwarnen'],
        ssingle: object['ssingle'],
        smarried: object['smarried'],
        tglpost: object['tglpost'],
        statusloker: object['statusloker'],
        namalengkap: object['namalengkap'],
        jeniskelamin: object['jeniskelamin'],
        kecamatan: object['kecamatan'],
        kota: object['kota'],
        expand: false);
  }

  static Future<List<Loker>> getDataLokerperUser(String iduser) async {
    var url = "${globals.urlapi}datalokerperuser?iduser=${int.parse(iduser)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<Loker> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(Loker.createData(data[i]));
      }
      return listData;
    }
  }

  static Future<List<Loker>> getDataLokerperIdLoker(String idloker) async {
    var url = "${globals.urlapi}datalokerperid?idloker=${int.parse(idloker)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<Loker> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(Loker.createData(data[i]));
      }
      return listData;
    }
  }

  static Future<List<Loker>> getAllData() async {
    var url = "${globals.urlapi}alldatalowongankerja";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<Loker> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(Loker.createData(data[i]));
      }
      return listData;
    }
  }
}
