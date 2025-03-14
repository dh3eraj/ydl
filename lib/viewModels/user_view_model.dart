import 'package:get/get.dart';
import 'package:ydl_users/models/app_exception.dart';
import 'package:ydl_users/models/repository/user_repository.dart';
import 'package:ydl_users/models/service/network_api_service.dart';
import 'package:ydl_users/models/user_model.dart';

class UserViewModel extends GetxController {
  final UserRepository _repository;
  UserViewModel(this._repository);
// Users Status
  late Rx<Status> _usersStatus;
  Rx<Status> get usersStatus => _usersStatus;

// Users
  late List<UserModel> _users;
  List<UserModel> get users => _users;

  Future<void> getUsers() async {
    _usersStatus = Status.loading.obs;
    try {
      final users = await _repository.getUsers();
      _users = users ?? [];
      _usersStatus.value = Status.loaded;
    } on AppException catch (e, _) {
      _users = [];
      _usersStatus.value = Status.error;
    }
  }
}
