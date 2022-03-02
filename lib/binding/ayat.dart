
part of 'binding.dart';

class BindingAyat extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> ControllerAyat());
  }
}