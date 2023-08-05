import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/login/screens/login_screen.dart';


class BackButtonForgot extends StatelessWidget {
  const BackButtonForgot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(() => const LoginScreen());
      },
      child: const Icon(Icons.arrow_back),
    );
  }
}