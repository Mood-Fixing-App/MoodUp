import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moodup/src/utils/theme.dart';
import 'package:moodup/src/features/mood/screens/mood.dart';
import 'package:moodup/src/features/splash/screens/splash_screen.dart';
import 'package:moodup/src/features/mood/controller/mood_controller.dart';
import 'package:moodup/src/features/post/controllers/post_controller.dart';
import 'package:moodup/src/features/login/controllers/login_controller.dart';
import 'package:moodup/src/features/onboard/controllers/onboard_controller.dart';
import 'package:moodup/src/features/register/controllers/register_controller.dart';
import 'package:moodup/src/features/dashboard/controllers/dashboard_controller.dart';
import 'package:moodup/src/features/profile_picture_upload/screens/profile_pic_upload_screen.dart';
import 'package:moodup/src/features/profile_picture_upload/controllers/profile_pic_upload_controller.dart';

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
    Get.lazyPut(() => LoginController(), tag: 'login', fenix: true);
    Get.lazyPut(() => RegisterController(), tag: 'register', fenix: true);
    Get.lazyPut(() => DashboardController(), tag: 'dashboard', fenix: true);
    Get.lazyPut(() => MoodController(), tag: 'mood', fenix: true);
    Get.lazyPut(() => OnboardController(), tag: 'onboard', fenix: true);
    Get.lazyPut(() => ProfilePicUploadController(), tag: 'profilepic', fenix: true);
    Get.lazyPut(() => PostController(), tag: 'post', fenix: true);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MAppTheme.lightTheme,
      home: SplashScreen(),
    );
  }
}
