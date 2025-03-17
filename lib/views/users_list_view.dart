import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ydl_users/flavor/app_config.dart';
import 'package:ydl_users/models/service/network_api_service.dart';
import 'package:ydl_users/models/user_model.dart';
import 'package:ydl_users/viewModels/user_view_model.dart';
import 'package:ydl_users/views/widgets/search_box.dart';
import 'package:ydl_users/views/widgets/user_card.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  late final UserViewModel _viewModel;
  final TextEditingController _searchController = TextEditingController();
  final RxList<UserModel> _filteredUsers = <UserModel>[].obs;

  @override
  void initState() {
    _viewModel = Get.find<UserViewModel>();
    _viewModel.getUsers();
    _searchController.addListener(_filterUsers);
    super.initState();
  }

  void _filterUsers() {
    String query = _searchController.text.toLowerCase();
    _filteredUsers.assignAll(
      _viewModel.users.where((user) {
        return user.name?.toLowerCase().contains(query) ?? false;
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppConfig? appConfig = AppConfig.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Users"), centerTitle: true),
      bottomNavigationBar: Container(
        height: 64,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: appConfig!.backgroundColor),
        child: Text(
          appConfig.appName,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            wordSpacing: 5,
            fontWeight: FontWeight.w900,
            foreground:
                Paint()
                  ..style = PaintingStyle.fill
                  ..color = Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: SearchBox(controller: _searchController),
          ),
          Expanded(
            child: Obx(() {
              switch (_viewModel.usersStatus.value) {
                case Status.loading:
                  return const Center(child: CircularProgressIndicator());
                case Status.loaded:
                  if (_viewModel.users.isEmpty) {
                    return Center(
                      child: Text(
                        "No users found",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }
                  return Obx(
                    () => ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount:
                          _filteredUsers.isEmpty &&
                                  _searchController.text.isEmpty
                              ? _viewModel.users.length
                              : _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user =
                            _filteredUsers.isEmpty &&
                                    _searchController.text.isEmpty
                                ? _viewModel.users[index]
                                : _filteredUsers[index];
                        return UserCard(user: user);
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                    ),
                  );
                case Status.error:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 50,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Something went wrong!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => _viewModel.getUsers(),
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  );
                case null:
                  return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}
