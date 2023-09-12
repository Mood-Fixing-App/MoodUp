import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moodup/src/utils/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/chat/screens/chat_screen.dart';
import 'package:moodup/src/features/login/screens/login_screen.dart';
import 'package:moodup/src/features/splash/screens/splash_screen.dart';
import 'package:moodup/src/features/register/screens/register_screen.dart';
import 'package:moodup/src/features/login/controllers/login_controller.dart';
import 'package:moodup/src/features/dashboard/screens/dashboard_screen.dart';
import 'package:moodup/src/features/forgot_password/screens/forgot_password_screen.dart';
import 'package:moodup/src/features/login_or_register/screens/login_or_register_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MAppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
