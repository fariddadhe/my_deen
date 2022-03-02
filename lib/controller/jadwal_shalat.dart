part of 'controllers.dart';

class ControllerJadwalShalat extends GetxController {
  RxList<Jadwal> data = <Jadwal>[].obs;
  // DateTime selectedValue = DateTime.now();
  String kotaId = "";
  String kotaName = "";
  RxString city = "-".obs;
  RxBool loading = true.obs;
  RxBool loadingS = true.obs;
  RxList<String> shalat = <String>[].obs;
  RxString timeTo = "-:-:-".obs;
  RxString subTime = "-".obs;
  List<int> timeShalat = [];
  List<String> nameShalat = [];
  RxString dateNow = "-".obs;

  @override
  void onInit() {
    // kotaId = Get.parameters[DataSend.kota_id]!;
    // kotaName.value = Get.parameters[DataSend.kota_name]!;
    _getLocation();

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getLocation() async {
    try {
      Location location = Location();
      LocationData locationData;

      locationData = await location.getLocation();
      double lat = locationData.latitude!;
      double long = locationData.longitude!;

      List<geo.Placemark> placemark =
          await geo.placemarkFromCoordinates(lat, long);
      city.value = placemark[1].subAdministrativeArea!;
      _setShalat(kota: city.value);
    } catch (e) {}
  }

  int index = 0;
  void _setShalat({required String kota}) async {
    loadingS.value = true;
    var date = DateTime.now();
    dateNow.value = "${date.year}/${date.month}/${date.day}";
    var currentCity = kota.split(" ")[index];
    await ApiService.get(
        url: ApiShalat.kota(search: currentCity),
        callback: (success, message, response) {
          if (success) {
            ModelKota kota = ModelKota.fromMap(response);
            kotaId = kota.data[0].id;
            kotaName = kota.data[0].lokasi;
            _setTime();
          } else {
            index++;
            _setShalat(kota: city.value);
          }
        });
    loadingS.value = false;
  }

  // void setTime() async {
  //   loading.value = true;
  //   try {
  //     await ApiService.get(
  //         url: ApiShalat.jadwal(kota: kotaId, date: dateNow.value),
  //         callback: (success, message, response) {
  //           ModelShalatDaily daily = ModelShalatDaily.fromMap(response);
  //           if (shalat.isNotEmpty) shalat.clear();
  //           Jadwal jadwal = daily.data.jadwal;
  //           shalat.add(jadwal.subuh);
  //           shalat.add(jadwal.terbit);
  //           shalat.add(jadwal.dzuhur);
  //           shalat.add(jadwal.ashar);
  //           shalat.add(jadwal.maghrib);
  //           shalat.add(jadwal.isya);

  //           if (nameShalat.isNotEmpty) nameShalat.clear();
  //           nameShalat.add('Subuh');
  //           nameShalat.add('Terbit');
  //           nameShalat.add('Dzuhur');
  //           nameShalat.add('Ashar');
  //           nameShalat.add('Maghrib');
  //           nameShalat.add('Isya');

  //           if (timeShalat.isNotEmpty) timeShalat.clear();
  //           timeShalat.add(BaseFunc.timeToInt(time: shalat[0]));
  //           timeShalat.add(BaseFunc.timeToInt(time: shalat[1]));
  //           timeShalat.add(BaseFunc.timeToInt(time: shalat[2]));
  //           timeShalat.add(BaseFunc.timeToInt(time: shalat[3]));
  //           timeShalat.add(BaseFunc.timeToInt(time: shalat[4]));
  //           timeShalat.add(BaseFunc.timeToInt(time: shalat[5]));

  //           print('waktu shalat: ${shalat[1]}');
  //           print('waktu shalat: ${shalat[1]}');
  //         });
  //   } catch (e) {}
  //   loading.value = false;
  // }

  void getData({required var id}) async {
    loading.value = true;
    try {
      var year = DateTime.now().year;
      var month = DateTime.now().month;
      await ApiService.get(
          url: ApiShalat.jadwal(kota: id, date: "$year/$month"),
          callback: (success, message, response) {
            if (data.isNotEmpty) data.clear();
            if (success) {
              ModelShalatMonthly shalat = ModelShalatMonthly.fromMap(response);
              data.addAll(shalat.data.jadwal);
            } else {
              data.value = [];
            }
          });
    } catch (e) {
      data.value = [];
    }
    loading.value = false;
  }

  void _setTime() async {
    try {
      var date = DateTime.now();
      dateNow.value = "${date.year}/${date.month}/${date.day}";

      await ApiService.get(
          url: ApiShalat.jadwal(kota: kotaId, date: dateNow.value),
          callback: (success, message, response) {
            ModelShalatDaily daily = ModelShalatDaily.fromMap(response);
            if (shalat.isNotEmpty) shalat.clear();
            Jadwal jadwal = daily.data.jadwal;
            shalat.add(jadwal.subuh);
            shalat.add(jadwal.terbit);
            shalat.add(jadwal.dzuhur);
            shalat.add(jadwal.ashar);
            shalat.add(jadwal.maghrib);
            shalat.add(jadwal.isya);

            if (nameShalat.isNotEmpty) nameShalat.clear();
            nameShalat.add('Subuh');
            nameShalat.add('Terbit');
            nameShalat.add('Dzuhur');
            nameShalat.add('Ashar');
            nameShalat.add('Maghrib');
            nameShalat.add('Isya');

            if (timeShalat.isNotEmpty) timeShalat.clear();
            timeShalat.add(BaseFunc.timeToInt(time: shalat[0]));
            timeShalat.add(BaseFunc.timeToInt(time: shalat[1]));
            timeShalat.add(BaseFunc.timeToInt(time: shalat[2]));
            timeShalat.add(BaseFunc.timeToInt(time: shalat[3]));
            timeShalat.add(BaseFunc.timeToInt(time: shalat[4]));
            timeShalat.add(BaseFunc.timeToInt(time: shalat[5]));

            print('waktu shalat: ${shalat[1]}');
            print('waktu shalat: ${shalat[1]}');
          });

      int time = (DateTime.now().hour * 3600) +
          (DateTime.now().minute * 60) +
          DateTime.now().second;
      int toTime = 0;

      if (time >= timeShalat[0] && time < timeShalat[1]) {
        subTime.value = "Terbit";
        toTime = timeShalat[1];
      } else if (time >= timeShalat[1] && time < timeShalat[2]) {
        subTime.value = "Dzuhur";
        toTime = timeShalat[2];
      } else if (time >= timeShalat[2] && time < timeShalat[3]) {
        subTime.value = "Ashar";
        toTime = timeShalat[3];
      } else if (time >= timeShalat[3] && time < timeShalat[4]) {
        subTime.value = "Maghrib";
        toTime = timeShalat[4];
      } else if (time >= timeShalat[4] || time < timeShalat[5]) {
        subTime.value = "Isya";
        toTime = timeShalat[5];
      } else if (time >= timeShalat[5] || time < timeShalat[0]) {
        subTime.value = "Subuh";
        toTime = timeShalat[0];
      } else {
        subTime.value = "-";
      }
      int timeNow = (DateTime.now().hour * 3600) +
          (DateTime.now().minute * 60) +
          DateTime.now().second;
      Timer.periodic(Duration(seconds: 1), (timer) {
        timeNow++;
        int intTime = toTime - timeNow;

        var hour = 0;
        var minute = 0;
        var second = 0;

        if (intTime >= 3600) {
          String dataTime = (intTime / 3600).toString();
          hour = int.parse(dataTime.split(".")[0]);
          intTime = intTime - (hour * 3600);
        }

        if (intTime >= 60) {
          String dataTime = (intTime / 60).toString();
          minute = int.parse(dataTime.split(".")[0]);
          intTime = intTime - (minute * 60);
        }

        second = intTime;

        timeTo.value = "$hour:$minute:$second";

        if (timeNow == toTime) {
          _setTime();
        }
      });
    } catch (e) {}
    loading.value = false;
  }
}
