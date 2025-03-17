import 'package:flutter/material.dart';
import 'package:ydl_users/config/dependency_injection.dart';
import 'package:ydl_users/config/routes.dart';
import 'package:ydl_users/flavor/app_config.dart';

void mainInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    AppConfig? appConfig = AppConfig.of(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appConfig!.appName ,
      routerConfig: Routes.routerConfig,
    );
  }
}
