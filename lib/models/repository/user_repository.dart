import 'package:ydl_users/models/app_exception.dart';
import 'package:ydl_users/models/service/network_api_service.dart';
import 'package:ydl_users/models/user_model.dart';

class UserRepository {
  final NetworkApiService _networkApiService;
  const UserRepository(this._networkApiService);

  Future<List<UserModel>?> getUsers() async {
    try {
      final List<dynamic> response = await _networkApiService.getApi(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      return response.map((e) {
        return UserModel.fromJson(e);
      }).toList();
    } on AppException catch (e, _) {
      throw AppException(message: e.message);
    } catch (_) {
      throw AppException();
    }
  }


}
