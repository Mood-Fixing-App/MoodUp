import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/image_string.dart';
import 'package:moodup/src/features/splash/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashcontroller = Get.put(SpalshController());
  @override
  Widget build(BuildContext context) {
    splashcontroller.navigateToHome();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kLightBrown,
              kLightBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image.asset(mLogoWhite),
        ),
      ),
    );
  }
}
