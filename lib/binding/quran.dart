part of 'binding.dart';

class BindingQuran extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ControllerQuran());
  }
}