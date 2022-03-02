import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_deen/base/base.dart';
import 'package:my_deen/binding/binding.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  BindingMain().dependencies();
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: PageTo.main,
      getPages: BaseRoute.pages(),
      theme: ThemeData(),
    );
  }
}
