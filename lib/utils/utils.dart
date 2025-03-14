  import 'package:ydl_users/models/user_model.dart';

 String formatAddress(UserModel user) {
    if (user.address == null) return "No address available";
    return "${user.address!.street ?? ""}, ${user.address!.city ?? ""}, ${user.address!.zipcode ?? ""}";
  }