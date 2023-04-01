import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailProvinsi {
  int idProvinsi;
  String nama;

  DetailProvinsi({required this.idProvinsi, required this.nama});

  factory DetailProvinsi.createData(Map<String, dynamic> object) {
    return DetailProvinsi(idProvinsi: object["id"], nama: object["nama"]);
  }

  static Future<List<DetailProvinsi>> getData() async {
    var url = "https://dev.farizdotid.com/api/daerahindonesia/provinsi";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['provinsi'];
    List<DetailProvinsi> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DetailProvinsi.createData(data[i]));
      }
      return listData;
    }
  }
}

class DetailKotKab {
  int idKotKab;
  String idProvinsi;
  String nama;

  DetailKotKab(
      {required this.idKotKab, required this.idProvinsi, required this.nama});

  factory DetailKotKab.createData(Map<String, dynamic> object) {
    return DetailKotKab(
        idKotKab: object["id"],
        idProvinsi: object["id_provinsi"],
        nama: object["nama"]);
  }

  static Future<List<DetailKotKab>> getData(String idprov) async {
    var url =
        "http://dev.farizdotid.com/api/daerahindonesia/kota?id_provinsi=$idprov";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['kota_kabupaten'];
    List<DetailKotKab> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DetailKotKab.createData(data[i]));
      }
      return listData;
    }
  }
}

class DetailKecamatan {
  int idKecamatan;
  String idKotKab;
  String nama;

  DetailKecamatan(
      {required this.idKecamatan, required this.idKotKab, required this.nama});

  factory DetailKecamatan.createData(Map<String, dynamic> object) {
    return DetailKecamatan(
        idKecamatan: object["id"],
        idKotKab: object["id_kota"],
        nama: object["nama"]);
  }

  static Future<List<DetailKecamatan>> getData(String idKotKab) async {
    var url =
        "http://dev.farizdotid.com/api/daerahindonesia/kecamatan?id_kota=$idKotKab";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['kecamatan'];
    List<DetailKecamatan> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DetailKecamatan.createData(data[i]));
      }
      return listData;
    }
  }
}

class DetailKelurahan {
  int idKelurahan;
  String idKecamatan;
  String nama;

  DetailKelurahan(
      {required this.idKelurahan,
      required this.idKecamatan,
      required this.nama});

  factory DetailKelurahan.createData(Map<String, dynamic> object) {
    return DetailKelurahan(
        idKelurahan: object["id"],
        idKecamatan: object["id_kecamatan"],
        nama: object["nama"]);
  }

  static Future<List<DetailKelurahan>> getData(String idKecamatan) async {
    var url =
        "https://dev.farizdotid.com/api/daerahindonesia/kelurahan?id_kecamatan=$idKecamatan";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['kelurahan'];
    List<DetailKelurahan> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DetailKelurahan.createData(data[i]));
      }
      return listData;
    }
  }
}
