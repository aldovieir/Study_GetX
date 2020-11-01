import 'package:estudo_getx/modules/home/controller/home_controller.dart';
import 'package:estudo_getx/modules/home/view/creat_edit_user.dart';
import 'package:estudo_getx/repository/user_repository.dart';
import 'package:get/get.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository(Get.find()));

    Get.lazyPut(() => HomeController(Get.find()));

    Get.lazyPut(() => CreatEditUser(Get.find()));
  }
}
