import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/login_or_register/screens/login_or_register_screen.dart';

class BackButtonLogin extends StatelessWidget {
  const BackButtonLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAll(() => const LoginOrRegisterScreen());
      },
      child: const Icon(Icons.arrow_back),
    );
  }
}