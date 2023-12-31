import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/register/controllers/register_controller.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.find<RegisterController>(tag:'register');
    return SizedBox(
      width: 200,
      height: 51,
      child: ElevatedButton.icon(
        icon: Obx(
          () => controller.isLoading.value
              ? const CircularProgressIndicator()
              : const Icon(
                  Icons.login_sharp,
                  color: Color(0XFF031C03),
                ),
        ),
        label: Obx(
          () => Text(
            controller.isLoading.value ? "Please Wait...." : "Register",
            style: const TextStyle(
                fontSize: 14,
                color: Color(0XFF031C03),
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () async{
          
          controller.register(
            controller.nameController.text,
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
      ),
    );
  }
}
