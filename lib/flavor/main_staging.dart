import 'package:flutter/material.dart';
import 'package:ydl_users/main_init.dart';

import 'app_config.dart';

void main() async {

  mainInit();

  Widget configuredApp = AppConfig(
    appName: 'YDL STAG',
    backgroundColor: Color(0xFF00FF00),
    child: MainApp(),
  );
  
  runApp(configuredApp);
}
