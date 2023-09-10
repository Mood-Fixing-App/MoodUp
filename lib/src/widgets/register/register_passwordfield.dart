import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/text_strings.dart';
import 'package:moodup/src/features/register/controllers/register_controller.dart';

class PasswordTextField extends GetView<RegisterController> {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Obx(
      () {
        return TextFormField(
          controller: controller.passwordController,
          obscureText: controller.passwordVisible.value,
          onSaved: (value) {
            controller.password = value!;
          },
          validator: (value) {
            return controller.validatePassword(value!);
          },
          decoration: decoration(),
        );
      },
    );
  }

  InputDecoration decoration() {
    return InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kDarkGreen, width: 2.0),
            borderRadius:
                BorderRadius.all(Radius.circular(Sizes.kDefaultRadius / 2)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kDarkGreen, width: 1.0),
            borderRadius:
                BorderRadius.all(Radius.circular(Sizes.kDefaultRadius / 2)),
          ),
          prefixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? kDarkGreen
                  : Colors.grey),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: IconButton(
            icon: Icon(
              controller.passwordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              controller.togglePasswordVisibility();
            },
          ),
          filled: true,
          fillColor: kWhite,
          prefixIcon: const Icon(Icons.lock),
          hintText: tRegisterPasswordText,
          border: const OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(Sizes.kDefaultRadius / 2)),
          ),
        );
  }
}
