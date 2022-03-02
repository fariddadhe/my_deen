part of 'controllers.dart';

class ControllerDzikir extends GetxController
    with SingleGetTickerProviderMixin {
  RxList<ModelDzikir> data = <ModelDzikir>[].obs;
  RxString jenisDzikir = "".obs;
  TabController? tabController;
  RxList<Widget> widget = <Widget>[].obs;

  @override
  void onInit() {
    jenisDzikir.value = Get.parameters[DataSend.jenis_dzikir]!;
    _getData(jenis: jenisDzikir);
    if (jenisDzikir.value == 'pagi') {
      tabController =
          TabController(length: BaseConst.dzikirPagi.length, vsync: this);
    } else {
      tabController =
          TabController(length: BaseConst.dzikirPetang.length, vsync: this);
    }
    tabController!.addListener(() {});
    super.onInit();
  }

  void _getData({required var jenis}) async {
    if (jenis == 'pagi') {
      try {
        await DbDzikir.dzikirpagi().then((value) => data.value = value);
      } catch (e) {
        data.value = [];
      }
      print("panjang ${data.length}");
      for (int i = 0; i < data.length; i++) {
        widget.add(WidgetDzikir(data[i]));
      }
    } else {
      try {
        await DbDzikir.dzikirpetang().then((value) => data.value = value);
      } catch (e) {
        data.value = [];
      }
      print("panjang ${data.length}");
      for (int i = 0; i < data.length; i++) {
        widget.add(WidgetDzikir(data[i]));
      }
    }
  }
}
