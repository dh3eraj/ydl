import 'package:flutter/material.dart';
import 'package:ydl_users/config/dependency_injection.dart';
import 'package:ydl_users/config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'YDL',
      routerConfig: Routes.routerConfig,
    );
  }
}
