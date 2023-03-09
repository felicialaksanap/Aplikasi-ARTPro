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
