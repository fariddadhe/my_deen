part of 'base.dart';

class BaseFunc {
  static int timeToInt({required String time}) {
    var data = time.split(":");
    if (data.length > 2 && data.length <= 3) {
      return (int.parse(data[0]) * 3600) +
          (int.parse(data[1]) * 60) +
          int.parse(data[2]);
    } else if (data.length > 1 && data.length <= 2) {
      return (int.parse(data[0]) * 3600) + (int.parse(data[1]) * 60);
    } else {
      return int.parse(data[0]);
    }
  }

  static String converToArabicNumber(String verseNumber) {
    String arabicNumeric = " ";

    for (int i = verseNumber.toString().length - 1; i >= 0; i--) {
      String digit = verseNumber.toString().split("")[i];
      if (digit == "0") {
        arabicNumeric += "٠";
      } else if (digit == "1") {
        arabicNumeric += "۱";
      } else if (digit == "2") {
        arabicNumeric += "۲";
      } else if (digit == "3") {
        arabicNumeric += "۳";
      } else if (digit == "4") {
        arabicNumeric += "٤";
      } else if (digit == "5") {
        arabicNumeric += "۵";
      } else if (digit == "6") {
        arabicNumeric += "٦";
      } else if (digit == "7") {
        arabicNumeric += "۷";
      } else if (digit == "8") {
        arabicNumeric += "۸";
      } else if (digit == "9") {
        arabicNumeric += "۹";
      }
    }

    arabicNumeric += "\u06dd";

    return arabicNumeric;
  }
}
