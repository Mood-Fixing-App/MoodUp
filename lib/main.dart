import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/utils/theme.dart';
import 'package:moodup/src/features/login/screens/login_screen.dart';
import 'package:moodup/src/features/splash/screens/splash_screen.dart';
import 'package:moodup/src/features/register/screens/register_screen.dart';
import 'package:moodup/src/features/login_or_register/screens/login_or_register_screen.dart';




void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: MAppTheme.lightTheme,
      home: const RegisterScreen(),
    );
  }
}
