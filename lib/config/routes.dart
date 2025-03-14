import 'package:go_router/go_router.dart';
import 'package:ydl_users/models/user_model.dart';
import 'package:ydl_users/views/user_details_view.dart';
import 'package:ydl_users/views/users_list_view.dart';

class Routes {
  static GoRouter routerConfig = GoRouter(
    initialLocation: '/users',
    routes: [
      GoRoute(
        path: '/users',
        builder: (context, state) {
          return UserListView();
        },
        routes: [
          GoRoute(
            path: '/:id',
            builder: (context, state) {
              return UserDetailsView(user: state.extra as UserModel);
            },
          ),
        ],
      ),
    ],
  );
}
