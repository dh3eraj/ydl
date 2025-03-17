import 'package:flutter/material.dart';
import 'package:ydl_users/main_init.dart';

import 'app_config.dart';

void main() async {

  mainInit();

  Widget configuredApp = AppConfig(
    appName: 'YDL PROD',
    backgroundColor: Color(0xFF0000FF),
    child: MainApp(),
  );

  runApp(configuredApp);
}
