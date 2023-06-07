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
        gajiawal: object['gajiawal'].toString(),
        gajiakhir: object['gajiakhir'].toString(),
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

class LokerbyFilter {
  int idloker = 0;
  String idpencari = "";
  double innerproduct = 0.0;
  double x = 0.0;
  double y = 0.0;
  double cosinesimilarity = 0.0;
  int iduser = 0;
  String judul = "";
  int gajiawal = 0;
  int gajiakhir = 0;
  String informasi = "";
  String tugas = "";
  int kprt = 0;
  int kbabysitter = 0;
  int kseniorcare = 0;
  int ksupir = 0;
  int kofficeboy = 0;
  int ktukangkebun = 0;
  int hewan = 0;
  int masak = 0;
  int mabukjalan = 0;
  int sepedamotor = 0;
  int mobil = 0;
  int tkmenginap = 0;
  int tkwarnen = 0;
  int ssingle = 0;
  int smarried = 0;
  String tglpost = "";
  String namalengkap = "";
  String jeniskelamin = "";
  String kecamatan = "";
  String kota = "";
  double jarak = 0.0;

  LokerbyFilter(
      {required this.idloker,
      required this.idpencari,
      required this.innerproduct,
      required this.x,
      required this.y,
      required this.cosinesimilarity,
      required this.iduser,
      required this.judul,
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
      required this.namalengkap,
      required this.jeniskelamin,
      required this.kecamatan,
      required this.kota,
      required this.jarak});

  factory LokerbyFilter.createData(Map<String, dynamic> object) {
    return LokerbyFilter(
        idloker: object['idloker'],
        idpencari: object['idpencari'],
        innerproduct: double.parse(object['innerproduct'].toString()),
        x: double.parse(object['x'].toString()),
        y: double.parse(object['y'].toString()),
        cosinesimilarity: double.parse(object['cosinesimilarity'].toString()),
        iduser: object['iduser'],
        judul: object['judul'],
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
        namalengkap: object['namalengkap'],
        jeniskelamin: object['jeniskelamin'],
        kecamatan: object['kecamatan'],
        kota: object['kota'],
        jarak: double.parse(object['jarak'].toString()));
  }

  static Future<List<LokerbyFilter>> getData(String params) async {
    var url = "${globals.urlapi}getlokerfilter?$params";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<LokerbyFilter> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(LokerbyFilter.createData(data[i]));
      }
      return listData;
    }
  }

  static Future<String> makeCopyTable(String param) async {
    var url = "${globals.urlapi}createcopytable?$param";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed');
    }
  }
}
