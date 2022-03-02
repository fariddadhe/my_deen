part of 'controllers.dart';

class ControllerKota extends GetxController {
  RxList<dynamic> data = <dynamic>[].obs;
  RxBool loading = true.obs;
  RxDouble elevation = 0.0.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    loading.value = true;
    try {
      await GetConnect().get(ApiShalat.kota()).then((value) => data.value = value.body);
      print("panjangnya : ${data.length}");
    } catch (e){
      print("$e");
      data.value = [];
    }
    loading.value = false;
  }
}