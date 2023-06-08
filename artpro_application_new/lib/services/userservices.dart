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

class LongLatUser {
  int iduser = 0;
  String longitude = "";
  String latitude = "";

  LongLatUser(
      {required this.iduser, required this.longitude, required this.latitude});

  factory LongLatUser.createData(Map<String, dynamic> object) {
    return LongLatUser(
        iduser: object['iduser'],
        longitude: object['longitude'],
        latitude: object['latitude']);
  }

  static Future<List<LongLatUser>> getData(String iduser) async {
    var url = "${globals.urlapi}getlonglatuser?iduser=${int.parse(iduser)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<LongLatUser> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(LongLatUser.createData(data[i]));
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
  int aislam = 0;
  int akatolik = 0;
  int akristen = 0;
  int ahindu = 0;
  int abuddha = 0;
  int akonghucu = 0;
  int tkmenginap = 0;
  int tkwarnen = 0;
  int hewan = 0;
  int mabukjalan = 0;
  int sepedamotor = 0;
  int mobil = 0;
  int masak = 0;
  int single = 0;
  int married = 0;

  DetailProfileART(
      {required this.iduser,
      required this.pendidikanterakhir,
      required this.beratbadan,
      required this.tinggibadan,
      required this.aislam,
      required this.akatolik,
      required this.akristen,
      required this.ahindu,
      required this.abuddha,
      required this.akonghucu,
      required this.tkmenginap,
      required this.tkwarnen,
      required this.hewan,
      required this.mabukjalan,
      required this.sepedamotor,
      required this.mobil,
      required this.masak,
      required this.single,
      required this.married});

  factory DetailProfileART.createData(Map<String, dynamic> object) {
    return DetailProfileART(
        iduser: object['iduser'].toString(),
        pendidikanterakhir: object['pendidikanterakhir'],
        beratbadan: object['beratbadan'].toString(),
        tinggibadan: object['tinggibadan'].toString(),
        aislam: object['aislam'],
        akatolik: object['akatolik'],
        akristen: object['akristen'],
        ahindu: object['ahindu'],
        abuddha: object['abuddha'],
        akonghucu: object['akonghucu'],
        tkmenginap: object['tkmenginap'],
        tkwarnen: object['tkwarnen'],
        hewan: object['hewan'],
        mabukjalan: object['mabukjalan'],
        sepedamotor: object['sepedamotor'],
        mobil: object['mobil'],
        masak: object['masak'],
        single: object['ssingle'],
        married: object['smarried']);
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
  int kprt = 0;
  int kbabysitter = 0;
  int kseniorcare = 0;
  int ksupir = 0;
  int kofficeboy = 0;
  int ktukangkebun = 0;
  String pengalaman = "";
  int gajiawal = 0;
  int gajiakhir = 0;

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

class DataARTbyKategori {
  int idart = 0;
  String namalengkap = "";
  String jeniskelamin = "";
  String tempatlahir = "";
  String tanggallahir = "";
  String telephone = "";
  String profpicpath = "";
  String pendidikan = "";
  int beratbadan = 0;
  int tinggibadan = 0;
  int aislam = 0;
  int akatolik = 0;
  int akristen = 0;
  int ahindu = 0;
  int abuddha = 0;
  int akonghucu = 0;
  int tkmenginap = 0;
  int tkwarnen = 0;
  int hewan = 0;
  int mabukjalan = 0;
  int sepedamotor = 0;
  int mobil = 0;
  int masak = 0;
  int ssingle = 0;
  int smarried = 0;
  int kprt = 0;
  int kbabysitter = 0;
  int kseniorcare = 0;
  int ksupir = 0;
  int kofficeboy = 0;
  int ktukangkebun = 0;
  String pengalaman = "";
  String gajiawal = "";
  String gajiakhir = "";
  String latitude = "";
  String longitude = "";
  double jarak = 0.0;
  double rating = 0.0;

  DataARTbyKategori({
    required this.idart,
    required this.namalengkap,
    required this.jeniskelamin,
    required this.tempatlahir,
    required this.tanggallahir,
    required this.telephone,
    required this.profpicpath,
    required this.pendidikan,
    required this.beratbadan,
    required this.tinggibadan,
    required this.aislam,
    required this.akatolik,
    required this.akristen,
    required this.ahindu,
    required this.abuddha,
    required this.akonghucu,
    required this.tkmenginap,
    required this.tkwarnen,
    required this.hewan,
    required this.mabukjalan,
    required this.sepedamotor,
    required this.mobil,
    required this.masak,
    required this.ssingle,
    required this.smarried,
    required this.kprt,
    required this.kbabysitter,
    required this.kseniorcare,
    required this.ksupir,
    required this.kofficeboy,
    required this.ktukangkebun,
    required this.pengalaman,
    required this.gajiawal,
    required this.gajiakhir,
    required this.latitude,
    required this.longitude,
    required this.jarak,
    required this.rating,
  });

  factory DataARTbyKategori.createData(Map<String, dynamic> object) {
    return DataARTbyKategori(
        idart: object['idart'],
        namalengkap: object['namalengkap'],
        jeniskelamin: object['jeniskelamin'],
        tempatlahir: object['tempatlahir'],
        tanggallahir: object['tanggallahir'],
        telephone: object['telephone'],
        profpicpath: object['profpicpath'],
        pendidikan: object['pendidikan'],
        beratbadan: object['beratbadan'],
        tinggibadan: object['tinggibadan'],
        aislam: object['aislam'],
        akatolik: object['akatolik'],
        akristen: object['akristen'],
        ahindu: object['ahindu'],
        abuddha: object['abuddha'],
        akonghucu: object['akonghucu'],
        tkmenginap: object['tkmenginap'],
        tkwarnen: object['tkwarnen'],
        hewan: object['hewan'],
        mabukjalan: object['mabukjalan'],
        sepedamotor: object['sepedamotor'],
        mobil: object['mobil'],
        masak: object['masak'],
        ssingle: object['ssingle'],
        smarried: object['smarried'],
        kprt: object['kprt'],
        kbabysitter: object['kbabysitter'],
        kseniorcare: object['kseniorcare'],
        ksupir: object['ksupir'],
        kofficeboy: object['kofficeboy'],
        ktukangkebun: object['ktukangkebun'],
        pengalaman: object['pengalaman'],
        gajiawal: object['gajiawal'].toString(),
        gajiakhir: object['gajiakhir'].toString(),
        latitude: object['latitude'],
        longitude: object['longitude'],
        jarak: 0.0,
        rating: double.parse(object['rating'].toString()));
  }

  static Future<List<DataARTbyKategori>> getData(String kategori) async {
    var url = "${globals.urlapi}dataartbykategori?kategori=$kategori";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<DataARTbyKategori> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DataARTbyKategori.createData(data[i]));
      }
      return listData;
    }
  }
}

class DataARTbyFilter {
  int idart = 0;
  int idmajikan = 0;
  double innerproduct = 0;
  double x = 0;
  double y = 0;
  double cosinesimilarity = 0;
  String namalengkap = "";
  String jeniskelamin = "";
  String tempatlahir = "";
  String tanggallahir = "";
  String telephone = "";
  String pendidikan = "";
  int beratbadan = 0;
  int tinggibadan = 0;
  int aislam = 0;
  int akatolik = 0;
  int akristen = 0;
  int ahindu = 0;
  int abuddha = 0;
  int akonghucu = 0;
  int tkmenginap = 0;
  int tkwarnen = 0;
  int hewan = 0;
  int mabukjalan = 0;
  int sepedamotor = 0;
  int mobil = 0;
  int masak = 0;
  int ssingle = 0;
  int smarried = 0;
  int kprt = 0;
  int kbabysitter = 0;
  int kseniorcare = 0;
  int ksupir = 0;
  int kofficeboy = 0;
  int ktukangkebun = 0;
  String pengalaman = "";
  int gajiawal = 0;
  int gajiakhir = 0;
  double jarak = 0.0;
  double rating = 0.0;

  DataARTbyFilter(
      {required this.idart,
      required this.idmajikan,
      required this.innerproduct,
      required this.x,
      required this.y,
      required this.cosinesimilarity,
      required this.namalengkap,
      required this.jeniskelamin,
      required this.tempatlahir,
      required this.tanggallahir,
      required this.telephone,
      required this.pendidikan,
      required this.beratbadan,
      required this.tinggibadan,
      required this.aislam,
      required this.akatolik,
      required this.akristen,
      required this.ahindu,
      required this.abuddha,
      required this.akonghucu,
      required this.tkmenginap,
      required this.tkwarnen,
      required this.hewan,
      required this.mabukjalan,
      required this.sepedamotor,
      required this.mobil,
      required this.masak,
      required this.ssingle,
      required this.smarried,
      required this.kprt,
      required this.kbabysitter,
      required this.kseniorcare,
      required this.ksupir,
      required this.kofficeboy,
      required this.ktukangkebun,
      required this.pengalaman,
      required this.gajiawal,
      required this.gajiakhir,
      required this.jarak,
      required this.rating});

  factory DataARTbyFilter.createData(Map<String, dynamic> object) {
    return DataARTbyFilter(
        idart: object['idart'],
        idmajikan: object['idmajikan'],
        innerproduct: double.parse(object['innerproduct'].toString()),
        x: double.parse(object['x'].toString()),
        y: double.parse(object['y'].toString()),
        cosinesimilarity: double.parse(object['cosinesimilarity'].toString()),
        namalengkap: object['namalengkap'],
        jeniskelamin: object['jeniskelamin'],
        tempatlahir: object['tempatlahir'],
        tanggallahir: object['tanggallahir'],
        telephone: object['telephone'],
        pendidikan: object['pendidikan'],
        beratbadan: object['beratbadan'],
        tinggibadan: object['tinggibadan'],
        aislam: object['aislam'],
        akatolik: object['akatolik'],
        akristen: object['akristen'],
        ahindu: object['ahindu'],
        abuddha: object['abuddha'],
        akonghucu: object['akonghucu'],
        tkmenginap: object['tkmenginap'],
        tkwarnen: object['tkwarnen'],
        hewan: object['hewan'],
        mabukjalan: object['mabukjalan'],
        sepedamotor: object['sepedamotor'],
        mobil: object['mobil'],
        masak: object['masak'],
        ssingle: object['ssingle'],
        smarried: object['smarried'],
        kprt: object['kprt'],
        kbabysitter: object['kbabysitter'],
        kseniorcare: object['kseniorcare'],
        ksupir: object['ksupir'],
        kofficeboy: object['kofficeboy'],
        ktukangkebun: object['ktukangkebun'],
        pengalaman: object['pengalaman'],
        gajiawal: object['gajiawal'],
        gajiakhir: object['gajiakhir'],
        jarak: double.parse(object['jarak'].toString()),
        rating: double.parse(object['rating'].toString()));
  }

  static Future<List<DataARTbyFilter>> getData(String param) async {
    var url = "${globals.urlapi}dataartbyfk?$param";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<DataARTbyFilter> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DataARTbyFilter.createData(data[i]));
      }
      return listData;
    }
  }

  static Future<String> makeCopyTable(String param) async {
    var url = "${globals.urlapi}makeandcopytable?$param";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed');
    }
  }
}

class RataPenilaian {
  double estetika = 0.0;
  double etika = 0.0;
  double kebersihan = 0.0;
  double kerapian = 0.0;
  double kecepatan = 0.0;

  RataPenilaian(
      {required this.estetika,
      required this.etika,
      required this.kebersihan,
      required this.kerapian,
      required this.kecepatan});

  factory RataPenilaian.createData(Map<String, dynamic> object) {
    return RataPenilaian(
        estetika: double.parse(object['estetika'].toString()),
        etika: double.parse(object['etika'].toString()),
        kebersihan: double.parse(object['kebersihan'].toString()),
        kerapian: double.parse(object['kerapian'].toString()),
        kecepatan: double.parse(object['kecepatan'].toString()));
  }

  static Future<List<RataPenilaian>> getData(String idart) async {
    var url = "${globals.urlapi}dataratapenilaian?idart=${int.parse(idart)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<RataPenilaian> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(RataPenilaian.createData(data[i]));
      }
      return listData;
    }
  }
}

class ReviewMajikan {
  int idmajikan = 0;
  String namalengkap = "";
  String review = "";
  String tglpost = "";

  ReviewMajikan(
      {required this.idmajikan,
      required this.namalengkap,
      required this.review,
      required this.tglpost});

  factory ReviewMajikan.createData(Map<String, dynamic> object) {
    return ReviewMajikan(
        idmajikan: object['idmajikan'],
        namalengkap: object['namalengkap'],
        review: object['review'],
        tglpost: object['tglpost']);
  }

  static Future<List<ReviewMajikan>> getData(String idart) async {
    var url = "${globals.urlapi}datareviewmajikan?idart=${int.parse(idart)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<ReviewMajikan> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(ReviewMajikan.createData(data[i]));
      }
      return listData;
    }
  }
}

class HasilJarak {
  int idart = 0;
  double jarak = 0.0;

  HasilJarak({required this.idart, required this.jarak});

  factory HasilJarak.createData(Map<String, dynamic> object) {
    return HasilJarak(idart: 0, jarak: object['routes'][0]['distance']);
  }

  static Future<HasilJarak> getData(String param) async {
    var url =
        "http://router.project-osrm.org/route/v1/driving/$param?overview=false";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return HasilJarak.createData(jsonDecode(response.body.toString()));
    } else {
      throw Exception('Failed');
    }
  }
}

class DataKontakART {
  int idart = 0;
  String namalengkap = "";
  String tanggallahir = "";
  String telephone = "";
  int kprt = 0;
  int kbabysitter = 0;
  int kseniorcare = 0;
  int ksupir = 0;
  int kofficeboy = 0;
  int ktukangkebun = 0;
  double rating = 0.0;
  int umur = 0;
  String kategori = "";

  DataKontakART(
      {required this.idart,
      required this.namalengkap,
      required this.tanggallahir,
      required this.telephone,
      required this.kprt,
      required this.kbabysitter,
      required this.kseniorcare,
      required this.ksupir,
      required this.kofficeboy,
      required this.ktukangkebun,
      required this.rating,
      required this.umur,
      required this.kategori});

  factory DataKontakART.createData(Map<String, dynamic> object) {
    return DataKontakART(
        idart: object['idart'],
        namalengkap: object['namalengkap'],
        tanggallahir: object['tanggallahir'],
        telephone: object['telephone'],
        kprt: object['kprt'],
        kbabysitter: object['kbabysitter'],
        kseniorcare: object['kseniorcare'],
        ksupir: object['ksupir'],
        kofficeboy: object['kofficeboy'],
        ktukangkebun: object['ktukangkebun'],
        rating: double.parse(object['rating'].toString()),
        umur: 0,
        kategori: "-");
  }

  static Future<List<DataKontakART>> getData(String idmajikan) async {
    var url =
        "${globals.urlapi}alldatakontakart?idmajikan=${int.parse(idmajikan)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<DataKontakART> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DataKontakART.createData(data[i]));
      }
      return listData;
    }
  }
}

class DataKontakMajikan {
  int idmajikan = 0;
  String namalengkap = "";
  String telephone = "";
  String kecamatan = "";
  String kota = "";

  DataKontakMajikan(
      {required this.idmajikan,
      required this.namalengkap,
      required this.telephone,
      required this.kecamatan,
      required this.kota});

  factory DataKontakMajikan.createData(Map<String, dynamic> object) {
    return DataKontakMajikan(
        idmajikan: object['idmajikan'],
        namalengkap: object['namalengkap'],
        telephone: object['telephone'],
        kecamatan: object['kecamatan'],
        kota: object['kota']);
  }

  static Future<List<DataKontakMajikan>> getData(String idart) async {
    var url = "${globals.urlapi}alldatakontakmajikan?idart=${int.parse(idart)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<DataKontakMajikan> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(DataKontakMajikan.createData(data[i]));
      }
      return listData;
    }
  }
}

class KontakArt {
  int idkontak = 0;
  int idmajikan = 0;
  int idart = 0;
  String waktukontak = "";

  KontakArt(
      {required this.idkontak,
      required this.idmajikan,
      required this.idart,
      required this.waktukontak});

  factory KontakArt.createData(Map<String, dynamic> object) {
    return KontakArt(
        idkontak: object['idkontak'],
        idmajikan: object['idmajikan'],
        idart: object['idart'],
        waktukontak: object['waktukontak']);
  }

  static Future<List<KontakArt>> getData(String idart) async {
    var url = "${globals.urlapi}getinfokontak?idart=${int.parse(idart)}";
    var apiResult = await http.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    });
    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['data'];
    List<KontakArt> listData = [];
    if (data.toString() == "null") {
      return listData;
    } else {
      for (int i = 0; i < data.length; i++) {
        listData.add(KontakArt.createData(data[i]));
      }
      return listData;
    }
  }
}
