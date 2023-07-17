import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/utils/theme.dart';
import 'package:moodup/src/features/splash/screens/splash_screen.dart';
import 'package:moodup/src/features/dashboard/screens/dashboard_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MAppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
