import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/login_or_signup/screens/login_or_signup_screen.dart';

class BackButtonLogin extends StatelessWidget {
  const BackButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.off(() => const LoginOrSignupScreen());
      },
      child: const Icon(Icons.arrow_back),
    );
  }
}