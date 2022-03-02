
part of 'binding.dart';

class BindingDzikir extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ControllerDzikir());
  }
}