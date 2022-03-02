
part of 'binding.dart';

class BindingMain extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ControllerMain());
  }
}