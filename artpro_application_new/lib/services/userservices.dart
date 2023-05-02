import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:artpro_application_new/global.dart' as globals;

class AkunUser {
  String iduser;
  String email;
  String password;
  String statususer;

  AkunUser(
      {required this.iduser,
      required this.email,
      required this.password,
      required this.statususer});

  factory AkunUser.createData(Map<String, dynamic> object) {
    return AkunUser(
        iduser: object['iduser'].toString(),
        email: object['email'],
        password: object['password'],
        statususer: object['statususer']);
  }

  static Future<List<AkunUser>> getData(String email, String password) async {
    var url = "${globals.urlapi}akunuser?email=$email&password=$password";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<AkunUser> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(AkunUser.createData(data[i]));
      }
      return listData;
    }
  }
}

class ProfileUser {
  String iduser = "";
  String namalengkap = "";
  String jeniskelamin = "";
  String tempatlahir = "";
  String tanggallahir = "";
  String telephone = "";
  String profilepicpath = "";

  ProfileUser(
      {required this.iduser,
      required this.namalengkap,
      required this.jeniskelamin,
      required this.tempatlahir,
      required this.tanggallahir,
      required this.telephone,
      required this.profilepicpath});

  factory ProfileUser.createData(Map<String, dynamic> object) {
    return ProfileUser(
        iduser: object['iduser'].toString(),
        namalengkap: object['namalengkap'],
        jeniskelamin: object['jeniskelamin'],
        tempatlahir: object['tempatlahir'],
        tanggallahir: object['tanggallahir'],
        telephone: object['telephone'],
        profilepicpath: object['profilepicpath']);
  }

  static Future<List<ProfileUser>> getData(String iduser) async {
    var url = "${globals.urlapi}profileuser?iduser=${int.parse(iduser)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<ProfileUser> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(ProfileUser.createData(data[i]));
      }
      return listData;
    }
  }
}

class DomisiliUser {
  String iduser = "";
  String alamat = "";
  String kecamatan = "";
  String kelurahan = "";
  String provinsi = "";
  String kota = "";
  String longitude = "";
  String latitude = "";

  DomisiliUser(
      {required this.iduser,
      required this.alamat,
      required this.kecamatan,
      required this.kelurahan,
      required this.provinsi,
      required this.kota,
      required this.longitude,
      required this.latitude});

  factory DomisiliUser.createData(Map<String, dynamic> object) {
    return DomisiliUser(
        iduser: object['iduser'].toString(),
        alamat: object['alamat'],
        kecamatan: object['kecamatan'],
        kelurahan: object['kelurahan'],
        provinsi: object['provinsi'],
        kota: object['kota'],
        longitude: object['longitude'],
        latitude: object['latitude']);
  }

  static Future<List<DomisiliUser>> getData(String iduser) async {
    var url = "${globals.urlapi}datauserdomisili?iduser=${int.parse(iduser)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<DomisiliUser> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DomisiliUser.createData(data[i]));
      }
      return listData;
    }
  }
}

class DetailProfileART {
  String iduser = "";
  String pendidikanterakhir = "";
  String beratbadan = "";
  String tinggibadan = "";
  String agama = "";
  String tkmenginap = "";
  String tkwarnen = "";
  String hewan = "";
  String mabukjalan = "";
  String sepedamotor = "";
  String mobil = "";
  String masak = "";

  DetailProfileART(
      {required this.iduser,
      required this.pendidikanterakhir,
      required this.beratbadan,
      required this.tinggibadan,
      required this.agama,
      required this.tkmenginap,
      required this.tkwarnen,
      required this.hewan,
      required this.mabukjalan,
      required this.sepedamotor,
      required this.mobil,
      required this.masak});

  factory DetailProfileART.createData(Map<String, dynamic> object) {
    return DetailProfileART(
        iduser: object['iduser'].toString(),
        pendidikanterakhir: object['pendidikanterakhir'],
        beratbadan: object['beratbadan'].toString(),
        tinggibadan: object['tinggibadan'].toString(),
        agama: object['agama'],
        tkmenginap: object['tkmenginap'],
        tkwarnen: object['tkwarnen'],
        hewan: object['hewan'],
        mabukjalan: object['mabukjalan'],
        sepedamotor: object['sepedamotor'],
        mobil: object['mobil'],
        masak: object['masak']);
  }

  static Future<List<DetailProfileART>> getData(String iduser) async {
    var url =
        "${globals.urlapi}datauserdetailprofileart?iduser=${int.parse(globals.iduser)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<DetailProfileART> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DetailProfileART.createData(data[i]));
      }
      return listData;
    }
  }
}

class DetailKerjaART {
  String iduser = "";
  String kprt = "";
  String kbabysitter = "";
  String kseniorcare = "";
  String ksupir = "";
  String kofficeboy = "";
  String ktukangkebun = "";
  String pengalaman = "";
  String gajiawal = "";
  String gajiakhir = "";

  DetailKerjaART(
      {required this.iduser,
      required this.kprt,
      required this.kbabysitter,
      required this.kseniorcare,
      required this.ksupir,
      required this.kofficeboy,
      required this.ktukangkebun,
      required this.pengalaman,
      required this.gajiawal,
      required this.gajiakhir});

  factory DetailKerjaART.createData(Map<String, dynamic> object) {
    return DetailKerjaART(
        iduser: object['iduser'].toString(),
        kprt: object['kprt'],
        kbabysitter: object['kbabysitter'],
        kseniorcare: object['kseniorcare'],
        ksupir: object['ksupir'],
        kofficeboy: object['kofficeboy'],
        ktukangkebun: object['ktukangkebun'],
        pengalaman: object['pengalaman'],
        gajiawal: object['gajiawal'],
        gajiakhir: object['gajiakhir']);
  }

  static Future<List<DetailKerjaART>> getData(String iduser) async {
    var url =
        "${globals.urlapi}datauserdetailkerjaart?iduser=${int.parse(iduser)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<DetailKerjaART> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DetailKerjaART.createData(data[i]));
      }
      return listData;
    }
  }
}
