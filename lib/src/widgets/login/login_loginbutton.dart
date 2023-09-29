import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/login/controllers/login_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>(tag: 'login');
    return Obx(
      () => SizedBox(
          width: 200,
          height: 51,
          child: ElevatedButton.icon(
            icon: controller.isLoading.value
                ? const CircularProgressIndicator()
                : const Icon(
                    Icons.login,
                    color: Color(0XFF031C03),
                  ),
            label: controller.isLoading.value
                ? const Text(
                    "Login User...",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF031C03),
                        fontWeight: FontWeight.bold),
                  )
                : const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0XFF031C03),
                        fontWeight: FontWeight.bold),
                  ),
            onPressed: () async {
              controller.loginUser(
                controller.emailController.text,
                controller.passwordController.text,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF86DB9E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          )),
    );
  }
}
