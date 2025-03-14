import 'package:flutter/material.dart';
import 'package:ydl_users/models/user_model.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;
  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.blue,
            child: Text(
              (user.name?.isNotEmpty == true) ? user.name![0] : "?",
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.name ?? "Unknown User",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          "@${user.username ?? "No username"}",
          style: const TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
