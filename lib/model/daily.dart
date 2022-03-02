part of 'models.dart';

ModelShalatDaily modelShalatDailyFromMap(String str) =>
    ModelShalatDaily.fromMap(json.decode(str));

String modelShalatDailyToMap(ModelShalatDaily data) =>
    json.encode(data.toMap());

class ModelShalatDaily {
  ModelShalatDaily({
    required this.status,
    required this.data,
  });

  bool status;
  DataDaily data;

  factory ModelShalatDaily.fromMap(Map<String, dynamic> json) =>
      ModelShalatDaily(
        status: json["status"],
        data: DataDaily.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data": data.toMap(),
      };
}

class DataDaily {
  DataDaily({
    required this.id,
    required this.lokasi,
    required this.daerah,
    required this.koordinat,
    required this.jadwal,
  });

  String id;
  String lokasi;
  String daerah;
  Koordinat koordinat;
  Jadwal jadwal;

  factory DataDaily.fromMap(Map<String, dynamic> json) => DataDaily(
        id: json["id"],
        lokasi: json["lokasi"],
        daerah: json["daerah"],
        koordinat: Koordinat.fromMap(json["koordinat"]),
        jadwal: Jadwal.fromMap(json["jadwal"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lokasi": lokasi,
        "daerah": daerah,
        "koordinat": koordinat.toMap(),
        "jadwal": jadwal.toMap(),
      };
}

class JadwalDaily {
  JadwalDaily({
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.date,
  });

  String tanggal;
  String imsak;
  String subuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;
  DateTime date;

  factory JadwalDaily.fromMap(Map<String, dynamic> json) => JadwalDaily(
        tanggal: json["tanggal"],
        imsak: json["imsak"],
        subuh: json["subuh"],
        terbit: json["terbit"],
        dhuha: json["dhuha"],
        dzuhur: json["dzuhur"],
        ashar: json["ashar"],
        maghrib: json["maghrib"],
        isya: json["isya"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toMap() => {
        "tanggal": tanggal,
        "imsak": imsak,
        "subuh": subuh,
        "terbit": terbit,
        "dhuha": dhuha,
        "dzuhur": dzuhur,
        "ashar": ashar,
        "maghrib": maghrib,
        "isya": isya,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

class KoordinatDaily {
  KoordinatDaily({
    required this.lat,
    required this.lon,
    required this.lintang,
    required this.bujur,
  });

  double lat;
  double lon;
  String lintang;
  String bujur;

  factory KoordinatDaily.fromMap(Map<String, dynamic> json) => KoordinatDaily(
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        lintang: json["lintang"],
        bujur: json["bujur"],
      );

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "lintang": lintang,
        "bujur": bujur,
      };
}
