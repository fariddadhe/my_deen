
part of 'binding.dart';

class BindingQIblah extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ControllerQiblah());
  }
}