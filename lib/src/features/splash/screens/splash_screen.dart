import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/image_string.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
