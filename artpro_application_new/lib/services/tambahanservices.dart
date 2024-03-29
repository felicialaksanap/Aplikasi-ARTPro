import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:artpro_application_new/global.dart' as globals;

class BeritaTips {
  int idberita;
  String judul;
  String isi;
  String url;
  String tglpost;

  BeritaTips(
      {required this.idberita,
      required this.judul,
      required this.isi,
      required this.url,
      required this.tglpost});

  factory BeritaTips.createData(Map<String, dynamic> object) {
    return BeritaTips(
        idberita: object['idberita'],
        judul: object['judul'],
        isi: object['isi'],
        url: object['url'],
        tglpost: object['tglpost']);
  }

  static Future<List<BeritaTips>> getAllData() async {
    var url = "${globals.urlapi}getallberita";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<BeritaTips> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(BeritaTips.createData(data[i]));
      }
      return listData;
    }
  }
}

class InfoPelatihan {
  int idinfo = 0;
  String judul = "";
  String isi = "";
  String url = "";
  String tglpost = "";

  InfoPelatihan(
      {required this.idinfo,
      required this.judul,
      required this.isi,
      required this.url,
      required this.tglpost});

  factory InfoPelatihan.createData(Map<String, dynamic> object) {
    return InfoPelatihan(
        idinfo: object['idinfo'],
        judul: object['judul'],
        isi: object['isi'],
        url: object['url'],
        tglpost: object['tglpost']);
  }

  static Future<List<InfoPelatihan>> getAllData() async {
    var url = "${globals.urlapi}getallinfo";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<InfoPelatihan> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(InfoPelatihan.createData(data[i]));
      }
      return listData;
    }
  }
}

class Notifikasi {
  int idnotif = 0;
  int idmajikan = 0;
  int idart = 0;
  String title = "";
  String message = "";
  String status = "";

  Notifikasi(
      {required this.idnotif,
      required this.idmajikan,
      required this.idart,
      required this.title,
      required this.message,
      required this.status});

  factory Notifikasi.createData(Map<String, dynamic> object) {
    return Notifikasi(
        idnotif: object['idnotif'],
        idmajikan: object['idmajikan'],
        idart: object['idart'],
        title: object['title'],
        message: object['message'],
        status: object['status']);
  }

  static Future<List<Notifikasi>> getAllData(int idmajikan) async {
    var url = "${globals.urlapi}getnotifikasi?idmajikan=$idmajikan";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<Notifikasi> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(Notifikasi.createData(data[i]));
      }
      return listData;
    }
  }
}
