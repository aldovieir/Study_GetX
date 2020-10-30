import 'package:estudo_getx/models/pagination_filter.dart';
import 'package:estudo_getx/models/user_models.dart';
import 'package:estudo_getx/repository/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserRepository _userRepository;

  final _users = <UserModel>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  List<UserModel> get users => _users.toList();

  int get limit => _paginationFilter.value.limit;

  bool get lastPage => _lastPage.value;

  int get _page => _paginationFilter.value.page;

  HomeController(
    this._userRepository,
  );

  @override
  void onInit() {
    ever(_paginationFilter, (_) => _findUsers());
    _changePaginationFilter(1, 15);

    super.onInit();
  }

  Future<void> _findUsers() async {
    final userData = await _userRepository.findAll(_paginationFilter.value);

    if (userData.isEmpty) {
      _lastPage.value = true;
    }
    _users.addAll(userData);
  }

  void changeTotalPerPage(int limitvalue) {
    _users.clear();
    _lastPage.value = false;

    _changePaginationFilter(1, limitvalue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val.page = page;
      val.limit = limit;
    });
  }

  void nextPage() {
    _changePaginationFilter(_page + 1, limit);
  }
}
