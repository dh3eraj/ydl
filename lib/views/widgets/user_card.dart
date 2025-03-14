import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ydl_users/models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go("/users/${user.id ?? ""}", extra: user),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              user.name?.isNotEmpty == true ? user.name![0] : "?",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          title: Text(
            user.name ?? "No Name",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(user.email ?? "No Email"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        ),
      ),
    );
  }
}
