import 'package:flutter/material.dart';
import 'package:ydl_users/main_init.dart';

import 'app_config.dart';

void main() async {

  mainInit();

  Widget configuredApp = AppConfig(
    appName: 'YDL DEV',
    backgroundColor: Color(0xFFFF0000),
    child: MainApp(),
  );

  runApp(configuredApp);
}
