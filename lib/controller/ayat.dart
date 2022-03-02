part of 'controllers.dart';

class ControllerAyat extends GetxController {
  RxList<ModelAyat> data = <ModelAyat>[].obs;
  RxDouble elevation = 0.0.obs;
  ScrollController scrollController = ScrollController();
  RxString suratId = "".obs;
  RxString suratName = "".obs;
  RxString suratTrans = "".obs;
  RxString suratJenis = "".obs;
  RxString suratJumlah = "".obs;
  RxString suratNomor = "".obs;
  RxString lastRead = "".obs;
  RxString position = "".obs;
  GetStorage box = GetStorage();

  @override
  void onInit() {
    suratId.value = Get.parameters[DataSend.surat_id]!;
    suratName.value = Get.parameters[DataSend.surat_name]!;
    suratTrans.value = Get.parameters[DataSend.surat_trans]!;
    suratJenis.value = Get.parameters[DataSend.surat_jenis]!;
    suratJumlah.value = Get.parameters[DataSend.surat_jumlah]!;
    lastRead.value = Get.parameters[DataSend.last_read]!;
    scrollController.addListener(() => _onScroll());

    _getData(surat: suratId);
    if (data.isNotEmpty) {
      if (lastRead.value == "lastread") {
        suratNomor.value = Get.parameters[DataSend.surat_nomor_ayat]!;
        var pos = box.read(DataSend.position);

        scrollController.animateTo(double.parse(pos),
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

        print("ini controll");

        scrollController.addListener(() {
          scrollController.animateTo(double.parse(lastRead.value),
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
        });
      }
    }
    super.onInit();
  }

  addLastRead(int nomorAyat) {
    print('satuyaya ${scrollController.position.pixels}');
    box.write(DataSend.surat_id, suratId.value);
    box.write(DataSend.surat_name, suratName.value);
    box.write(DataSend.surat_trans, suratTrans.value);
    box.write(DataSend.surat_jenis, suratJenis.value);
    box.write(DataSend.surat_jumlah, suratJumlah.value);
    box.write(DataSend.surat_nomor_ayat, nomorAyat);
    box.write(DataSend.position, scrollController.position.pixels);
    print('berhasil yakawanku');
  }

  void _onScroll() {
    var cur = scrollController.position.pixels;
    var top = scrollController.position.minScrollExtent;

    if (cur > top)
      elevation.value = 2;
    else
      elevation.value = 0;
  }

  void _getData({required var surat}) async {
    try {
      await DbQuran.ayat(surat: surat).then((value) {
        data.value = value;

        if (lastRead.value == "lastread") {
          position.value = Get.parameters[DataSend.position]!;

          scrollController.animateTo(double.parse(position.value),
              duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          // scrollController.jumpTo(scrollController.position.maxScrollExtent);

          // print("panjangnya : ${scrollController.position.maxScrollExtent.toString()}");
        }
      });
    } catch (e) {
      data.value = [];
    }
  }
}
