import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({
    super.key,
    required this.appName,
    required this.backgroundColor,
    required super.child,
  });

  final String appName;
  final Color backgroundColor;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
