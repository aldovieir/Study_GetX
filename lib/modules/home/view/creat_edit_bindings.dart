import 'package:estudo_getx/modules/home/controller/creat_edit_controller.dart';
import 'package:estudo_getx/modules/home/view/home_page.dart';
import 'package:estudo_getx/repository/user_repository.dart';
import 'package:get/get.dart';

class CreatEditBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository(Get.find()));

    Get.lazyPut(() => CreatEditController(Get.find()));

    Get.lazyPut(() => HomePage(Get.find()));
  }
}
