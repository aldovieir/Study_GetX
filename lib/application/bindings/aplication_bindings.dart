import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio(BaseOptions(
        baseUrl: 'https://5f9c61ff856f4c00168c8c3c.mockapi.io/users/')));
  }
}
