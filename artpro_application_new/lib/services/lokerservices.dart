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
  String tugas;
  String kriteria;
  String kprt;
  String kbabysitter;
  String kseniorcare;
  String ksupir;
  String kofficeboy;
  String ktukangkebun;
  String tglpost;
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
      required this.kriteria,
      required this.kprt,
      required this.kbabysitter,
      required this.kseniorcare,
      required this.ksupir,
      required this.kofficeboy,
      required this.ktukangkebun,
      required this.tglpost,
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
        kriteria: object['kriteria'],
        kprt: object['kprt'],
        kbabysitter: object['kbabysitter'],
        kseniorcare: object['kseniorcare'],
        ksupir: object['ksupir'],
        kofficeboy: object['kofficeboy'],
        ktukangkebun: object['ktukangkebun'],
        tglpost: object['tglpost'],
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
