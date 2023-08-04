import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/login/controllers/login_controller.dart';

class LoginButton extends GetView<LoginController> {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return SizedBox(
        width: 200,
        height: 51,
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.login,
            color: Color(0XFF031C03),
          ),
          label: const Text(
            "Login",
            style: TextStyle(
                fontSize: 14,
                color: Color(0XFF031C03),
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            controller.checkLogin();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0XFF86DB9E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ));
  }
}