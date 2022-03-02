part of 'models.dart';

class ModelDzikir {
  ModelDzikir({
    required this.id,
    required this.judul,
    required this.petunjuk,
    required this.arab,
    required this.baca,
    required this.arti,
    required this.sumber,
  });

  String id;
  String judul;
  String petunjuk;
  String arab;
  String baca;
  String arti;
  String sumber;

  factory ModelDzikir.fromJson(Map<String, dynamic> json) => ModelDzikir(
        id: json["id"] ?? 0,
        judul: json["judul"] ?? "",
        petunjuk: json["petunjuk"] ?? "",
        arab: json["arab"] ?? "",
        baca: json["baca"] ?? "",
        arti: json["arti"] ?? "",
        sumber: json["sumber"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "petunjuk": petunjuk,
        "arab": arab,
        "baca": baca,
        "arti": arti,
        "sumber": sumber,
      };
}
