class MBerita {
  String gambarUrl;
  String judul;

  MBerita(this.gambarUrl, this.judul);

  static List<MBerita> isiBerita = [
    MBerita("assets/images/berita-1.jpeg",
        "ART Ini Siapkan Stok Makanan untuk Majikan, Netizen Jadi Baper!"),
    MBerita("assets/images/berita-2.jpeg",
        "Pusing Ditinggalkan Mudik oleh ART? Ada Solusinya Nih!"),
    MBerita("assets/images/berita-3.jpeg",
        "Majikan Iseng, Tambahkan Nasi Saat ART Makan Es Krim dan Es Kelapa"),
    MBerita(
        "assets/images/tips-1.jpg", "6 Tips Agar Pembantu Rumah Tangga Betah"),
    MBerita("assets/images/tips-2.jpg",
        "Bunda Harus Tahu, 4 Tip Ini Dijamin Bikin Asisten Rumah Tangga Betah dan Loyal"),
  ];
} // assets : berita-1 s/d berita-3.jpeg, tips-1 s/d tips-2.jpg

class MListART {
  String gambarUrl;
  String nama;
  String umur;
  String jarak;
  String rating;

  MListART(this.gambarUrl, this.nama, this.umur, this.jarak, this.rating);

  static List<MListART> isiListART = [
    MListART("assets/images/person-5.jpg", "Michelle Maryati", "20 thn",
        "0.95 km", "4.5"),
    MListART("assets/images/person-6.jpg", "Elma Uyainah", "30 thn", "1.2 km",
        "4.5"),
    MListART("assets/images/person-7.jpg", "Puput Riyanti", "45 thn", "10.2 km",
        "4"),
    MListART(
        "assets/images/person-9.jpg", "Hani Rahimah", "20 thn", "5.0 km", "4"),
    MListART("assets/images/person-10.jpg", "Maidah Wastuti", "30 thn",
        "0.5 km", "4.5"),
    MListART("assets/images/person-11.jpg", "Belinda Nur", "45 thn", "7.2 km",
        "3.5"),
  ];
} // assets : person-5 s/d person-11.jpg except person-8.jpg

class MListLoker {
  String kategori;
  String namamajikan;
  String kecamatan;
  String asalkota;
  String jaraklokasi;
  String tglpost;
  String rangegaji;
  List<String> kriteria = [];
  String judul;
  List<String> jobdesc = [];
  String informasi;

  MListLoker(
      this.kategori,
      this.namamajikan,
      this.kecamatan,
      this.asalkota,
      this.jaraklokasi,
      this.tglpost,
      this.rangegaji,
      this.kriteria,
      this.judul,
      this.jobdesc,
      this.informasi);

  static List<MListLoker> isiListLoker = [
    MListLoker(
        'Pembantu Rumah Tangga',
        'Rosa Fiore',
        'Gayungsari',
        'Kota Surabaya',
        '5.3 km',
        '15-12-2022',
        'Rp 2,000,000 - 2,500,000',
        [
          'Tidak takut hewan',
          'Mabuk perjalanan',
          'Sepeda motor',
          'Memasak',
          'Warnen'
        ],
        "Pembantu Yang Sabar",
        [
          'Membersihkan debu, menyapu, mengepel',
          'Mencuci dan mengeringkan piring',
          'Mengganti sprei, merapikan tempat tidur',
          'Membersihkan dapur',
          'Membersihkan kamar mandi'
        ],
        "Dibutuhkan pembantu rumah tangga yang sabar karena terdapat 2 anak kecil yang nakal dan butuh banyak perhatian"),
    MListLoker(
        'Supir Pribadi',
        'Baim Wong',
        'Siwalankerto',
        'Kota Surabaya',
        '10.2 km',
        '16-12-2022',
        'Rp 5,000,000 - 6,000,000',
        [
          'Membawa mobil',
          'Tidak takut hewan',
          "Membawa sepeda motor",
          'Menginap'
        ],
        "Supir Pribadi Istri",
        [
          'Menjaga kebersihan mobil',
          'Menjaga kebersihan sepeda motor',
          'Melakukan general check up mobil dan sepeda motor',
          'Taat aturan lalu lintas',
          'Bertanggung jawab atas keselamatan penumpang dan mobil'
        ],
        "Mengantar istri bekerja dan belanja kebutuhan rumah tangga, serta menjemput anak sekolah"),
    MListLoker(
        'Baby Sitter',
        'Jessica Milla',
        'Simokerto',
        'Kota Surabaya',
        '0.8 km',
        '2-2-2023',
        'Rp 5,000,000 - 6,000,000',
        [
          'Mabuk perjalanan',
          'Tidak takut hewan',
          'Menginap',
        ],
        "Baby Sitter Anak Balita",
        [
          'Mengurus keperluan pribadi bayi/anak',
          'Menemani anak bermain',
          'Membersihkan kamar anak',
          'Mencuci pakaian anak'
        ],
        "Membantu dan menjaga anak, diutamakan yang memiliki daya tahan tubuh yang kuat."),
  ];
}

class MListKomen {
  String nama;
  String tanggal;
  String foto;
  String isikomen;

  MListKomen(this.nama, this.tanggal, this.foto, this.isikomen);

  static List<MListKomen> isiKomen = [
    MListKomen("Carla Andriani", "08-12-2022", "assets/images/person-4.jpg",
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo."),
    MListKomen("Delaney Hill", "08-11-2022", "assets/images/person-5.jpg",
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo."),
    MListKomen("Michelle Riyanti", "17-09-2022", "assets/images/person-6.jpg",
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo."),
    MListKomen("Hani Maryati", "10-09-2022", "assets/images/person-7.jpg",
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo."),
    MListKomen("Belinda Wastuti", "01-07-2022", "assets/images/person-9.jpg",
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo."),
  ];
}

class MListNotif {
  String isinotif;
  String statusnotif;

  MListNotif(this.isinotif, this.statusnotif);

  static List<MListNotif> isiNotif = [
    MListNotif(
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo.",
        "active"),
    MListNotif(
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo.",
        "active"),
    MListNotif(
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo.",
        "inactive"),
    MListNotif(
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo.",
        "inactive"),
    MListNotif(
        "Lorem ipsum dolor sit amet consectetur. Hac mollis lorem dignissim dui feugiat augue arcu odio sagittis. Et id risus commodo.",
        "inactive")
  ];
}
