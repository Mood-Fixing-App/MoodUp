import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/text_strings.dart';
import 'package:moodup/src/features/login/controllers/login_controller.dart';

class EmailTextField extends GetView<LoginController> {
  
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return TextFormField(
      controller: controller.emailController,
      onSaved: (value) {
        controller.email = value!;
      },
      validator: (value) {
        return controller.validateEmail(value!);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: decoration(),
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
          states.contains(MaterialState.focused) ? kDarkGreen : Colors.grey),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: kWhite,
      prefixIcon: const Icon(
        Icons.email,
      ),
      hintText: tLoginEmailText,
      labelText: tLoginEmailText,
      border: const OutlineInputBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(Sizes.kDefaultRadius / 2)),
      ),
    );
  }
}