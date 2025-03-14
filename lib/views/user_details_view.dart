import 'package:flutter/material.dart';
import 'package:ydl_users/models/user_model.dart';
import 'package:ydl_users/utils/utils.dart';
import 'package:ydl_users/views/widgets/info_row.dart';
import 'package:ydl_users/views/widgets/profile_header.dart';

class UserDetailsView extends StatelessWidget {
  final UserModel user;
  const UserDetailsView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileHeader(user: user),
                const SizedBox(height: 16),
                InfoRow(Icons.email, user.email ?? "No email"),
                InfoRow(Icons.phone, user.phone ?? "No phone"),
                InfoRow(Icons.web, user.website ?? "No website"),
                Divider(),
                InfoRow(Icons.business, user.company?.name ?? "No company"),
                InfoRow(Icons.location_on, formatAddress(user)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
