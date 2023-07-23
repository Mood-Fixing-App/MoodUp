import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/image_strings.dart';
import 'package:moodup/src/features/splash/controllers/splash_controller.dart';



class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashcontroller = Get.put(SpalshController());
  @override
  Widget build(BuildContext context) {
    splashcontroller.navigateToHome();
    return Scaffold(
      body: Container(
        color: kLightGreen,
        child: Center(
          child: Image.asset(kLogoWhite),
        ),
      ),
    );
  }
}
