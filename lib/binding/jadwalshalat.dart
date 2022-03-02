part of 'binding.dart';

class BindingJadwalShalat extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ControllerJadwalShalat());
  }
}