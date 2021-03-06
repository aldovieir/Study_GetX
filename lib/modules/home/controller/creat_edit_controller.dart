import 'package:estudo_getx/models/user_models.dart';
import 'package:estudo_getx/repository/user_repository.dart';
import 'package:get/get.dart';

class CreatEditController extends GetxController {
  CreatEditController(
    this._userRepository,
  );

  final UserRepository _userRepository;
  RxBool _editing = false.obs;

  bool get editing => _editing.value;

  final RxList _users = <UserModel>[].obs;

  List<UserModel> get users => _users.toList();

  Future<void> addUser(name, username) async {
    _userRepository.addUser(name, username);
  }

  updateUser(id, name, username) {
    _userRepository.updateUser(id, name, username);
  }
}
