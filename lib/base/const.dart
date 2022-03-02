part of 'base.dart';

class BaseConst {
  static List<String> shalat = [
    "Shubuh",
    "Dzuhur",
    "Ashar",
    "Maghrib",
    "Isya'",
  ];

  static List<Tab> dzikirPagi = [
    Tab(text: "Dzikir Pagi 1 (Ta'awudz)",),
    Tab(text: "Dzikir Pagi 2 (Ayat Kursi)",),
    Tab(text: "Dzikir Pagi 3 (Al-Ikhlas)",),
    Tab(text: "Dzikir Pagi 4 (Al-Falaq)",),
    Tab(text: "Dzikir Pagi 5 (An-Naas)",),
    Tab(text: "Dzikir Pagi 6",),
    Tab(text: "Dzikir Pagi 7",),
    Tab(text: "Dzikir Pagi 8 (Sayyidul Istighfar)",),
    Tab(text: "Dzikir Pagi 9",),
    Tab(text: "Dzikir Pagi 10",),
    Tab(text: "Dzikir Pagi 11",),
    Tab(text: "Dzikir Pagi 12",),
    Tab(text: "Dzikir Pagi 13",),
    Tab(text: "Dzikir Pagi 14",),
    Tab(text: "Dzikir Pagi 15",),
    Tab(text: "Dzikir Pagi 16",),
    Tab(text: "Dzikir Pagi 17",),
    Tab(text: "Dzikir Pagi 18",),
    Tab(text: "Dzikir Pagi 19",),
    Tab(text: "Dzikir Pagi 20",),
    Tab(text: "Dzikir Pagi 21",),
  ];

  static List<Tab> dzikirPetang = [
    Tab(text: "Dzikir Petang 1 (Ta'awudz)",),
    Tab(text: "Dzikir Petang 2 (Ayat Kursi)",),
    Tab(text: "Dzikir Petang 3 (Al-Ikhlas)",),
    Tab(text: "Dzikir Petang 4 (Al-Falaq)",),
    Tab(text: "Dzikir Petang 5 (An-Naas)",),
    Tab(text: "Dzikir Petang 6",),
    Tab(text: "Dzikir Petang 7",),
    Tab(text: "Dzikir Petang 8 (Sayyidul Istighfar)",),
    Tab(text: "Dzikir Petang 9",),
    Tab(text: "Dzikir Petang 10",),
    Tab(text: "Dzikir Petang 11",),
    Tab(text: "Dzikir Petang 12",),
    Tab(text: "Dzikir Petang 13",),
    Tab(text: "Dzikir Petang 14",),
    Tab(text: "Dzikir Petang 15",),
    Tab(text: "Dzikir Petang 16",),
    Tab(text: "Dzikir Petang 17",),
    Tab(text: "Dzikir Petang 18",),
    Tab(text: "Dzikir Petang 19",),
    Tab(text: "Dzikir Petang 20",)
  ];

  static List<int> shalatInt() {
    List<int> data = [];
    for (var i = 0; i < shalat.length; i++) {
      data.add(i);
    }
    return data;
  }
}
