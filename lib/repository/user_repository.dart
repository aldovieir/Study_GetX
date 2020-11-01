import 'package:dio/dio.dart';
import 'package:estudo_getx/models/pagination_filter.dart';
import 'package:estudo_getx/models/user_models.dart';
import 'package:get/get.dart';

class UserRepository {
  Dio _dio;
  UserRepository(this._dio);

  Future<List<UserModel>> findAll(PaginationFilter filter) {
    return _dio
        .get(
          '/users/', /*  queryParameters: {
      "page": filter.page,
      'limit': filter.limit,
    } */
        )
        .then((res) =>
            res?.data?.map<UserModel>((u) => UserModel.fromMap(u))?.toList());
  }

  addUser(name, username) {
    UserModel userModel = UserModel(name: name, username: username);

    print(userModel);
    try {
      _dio
          .post(
        'https://5f9c61ff856f4c00168c8c3c.mockapi.io/users/',
        data: userModel,
      )
          .then((value) {
        Get.back();
        Get.showSnackbar(GetBar(title: "Produto adicionado com sucesso!"));
      });
    } catch (e) {
      Get.showSnackbar(GetBar(title: "Erro : ${e.toString()}"));
    }
    print(userModel);
  }

  updateUser(id, name, username) {
    var userModel = UserModel(id: id, name: name, username: username);

    print(userModel);
    _dio
        .put(
      'users/$id/',
      data: userModel,
    )
        .then((value) {
      Get.back();
    });
  }

  deleteUser(id) {
    print(id);
    _dio.delete('users/$id');
    Get.reset();

    print(id);
  }

  dismissPerson(item, list) {
    if (list.contains(item)) {
      //_itemList is list of item shown in ListView

      list.remove(item);
    }
  }
}
