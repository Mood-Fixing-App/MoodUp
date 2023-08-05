import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/widgets/register/regsiter_fullname.dart';
import 'package:moodup/src/widgets/register/regsiter_emailfield.dart';
import 'package:moodup/src/widgets/register/register_backbutton.dart';
import 'package:moodup/src/widgets/register/register_registertext.dart';
import 'package:moodup/src/widgets/register/register_passwordfield.dart';
import 'package:moodup/src/widgets/register/register_registerbutton.dart';
import 'package:moodup/src/widgets/register/register_passwordfieldreenter.dart';
import 'package:moodup/src/features/register/controllers/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [kWhite, kSoftGreen],
                ),
              ),
              padding: const EdgeInsets.all(Sizes.kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButtonRegister(),
                  const SizedBox(height: 30), // Back Button
                  const RegisterText(),
                  const SizedBox(height: 10),
                  const Text(
                    'Please enter following details to continue',
                    style: TextStyle(fontSize: 18, color: kLightBlack),
                  ),
                  const SizedBox(height: 60), // Login Text
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.registerFormKey,
                    // Form
                    child: Column(
                      children: const [
                        FullNameTextField(),
                        SizedBox(height: 23),
                        EmailTextField(),
                        SizedBox(height: 23),
                        PasswordTextField(),
                        SizedBox(height: 23),
                        PasswordTextFieldReEnter(),
                        SizedBox(height: 30),
                        RegisterButton()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
