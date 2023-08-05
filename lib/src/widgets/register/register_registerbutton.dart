import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/register/controllers/register_controller.dart';

class RegisterButton extends GetView<RegisterController> {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return SizedBox(
        width: 200,
        height: 51,
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.login_sharp,
            color: Color(0XFF031C03),
          ),
          label: const Text(
            "Register",
            style: TextStyle(
                fontSize: 14,
                color: Color(0XFF031C03),
                fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            controller.checkRegister();
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