import 'dart:convert';

List<Latihan> latihanFromJson(String str) =>
    List<Latihan>.from(json.decode(str).map((x) => Latihan.fromJson(x)));

String latihanToJson(List<Latihan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Latihan {
  String? arti;
  String? asma;
  int? ayat;
  String? nama;
  String? type;
  int? urut;
  String? audio;
  int? nomor;
  int? rukuk;
  String? keterangan;

  Latihan({
    this.arti,
    this.asma,
    this.ayat,
    this.nama,
    this.type,
    this.urut,
    this.audio,
    this.nomor,
    this.rukuk,
    this.keterangan,
  });

  factory Latihan.fromJson(Map<String, dynamic> json) => Latihan(
        arti: json["arti"],
        asma: json["asma"],
        ayat: int.tryParse(json["ayat"].toString()),
        nama: json["nama"],
        type: json["type"],
        urut: int.tryParse(json["urut"].toString()),
        audio: json["audio"],
        nomor: int.tryParse(json["nomor"].toString()),
        rukuk: int.tryParse(json["rukuk"].toString()),
        keterangan: json["keterangan"],
      );

  Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "ayat": ayat,
        "nama": nama,
        "type": type,
        "urut": urut,
        "audio": audio,
        "nomor": nomor,
        "rukuk": rukuk,
        "keterangan": keterangan,
      };
}
