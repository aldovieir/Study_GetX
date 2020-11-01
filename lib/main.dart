import 'package:estudo_getx/application/bindings/aplication_bindings.dart';
import 'package:estudo_getx/modules/home/view/creat_edit_bindings.dart';
import 'package:estudo_getx/modules/home/view/creat_edit_user.dart';
import 'package:estudo_getx/modules/home/view/home_bindings.dart';
import 'package:estudo_getx/modules/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AplicationBindings(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(Get.find()),
          binding: HomeBindings(),
        ),
        GetPage(
          name: '/createdit',
          page: () => CreatEditUser(Get.find()),
          binding: CreatEditBindings(),
        )
      ],
    );
  }
}
