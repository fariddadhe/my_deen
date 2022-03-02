part of 'controllers.dart';

class ControllerQiblah extends GetxController {
  final deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  RxBool loading = true.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

}
