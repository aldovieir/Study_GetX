import 'package:dio/dio.dart';
import 'package:estudo_getx/models/pagination_filter.dart';
import 'package:estudo_getx/models/user_models.dart';
import 'package:get/get.dart';

class UserRepository {
  Dio dio;
  UserRepository(this.dio);

  Future<List<UserModel>> findAll(PaginationFilter filter) {
    return dio.get('/users', queryParameters: {
      "page": filter.page,
      'limit': filter.limit,
    }).then((res) =>
        res?.data?.map<UserModel>((u) => UserModel.fromMap(u))?.toList());
  }

  addUser(String nameR, String userNameR) {
    var userModel = UserModel(
      id: '50',
      name: nameR,
      username: userNameR,
    );

    dio.post('/users', data: userModel).then((value) {
      Get.toNamed('/');
    });

    print(userModel);
  }
}
