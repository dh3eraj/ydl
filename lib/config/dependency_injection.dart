import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ydl_users/models/repository/user_repository.dart';
import 'package:ydl_users/models/service/network_api_service.dart';
import 'package:ydl_users/viewModels/user_view_model.dart';

final GetInstance getInstance = GetInstance();
Future<void> setupServiceLocator() async {
  getInstance.lazyPut<Client>(() => Client());
  Get.lazyPut<NetworkApiService>(() => NetworkApiService(Get.find<Client>()));
  Get.lazyPut<UserRepository>(
    () => UserRepository(Get.find<NetworkApiService>()),
  );
  Get.lazyPut(() => UserViewModel(Get.find<UserRepository>()));
}
