import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/text_strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodup/src/features/login/controllers/login_controller.dart';
import 'package:moodup/src/features/login_or_signup/screens/login_or_signup_screen.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
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
                  const BackButton(),
                  const SizedBox(height: 30), // Back Button
                  const LoginText(),
                  const SizedBox(height: 10),
                  const Text(
                    'Please sign in to continue.',
                    style: TextStyle(fontSize: 18, color: kLightBlack),
                  ),
                  const SizedBox(height: 60), // Login Text
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.loginFormKey,
                    // Form
                    child: Column(
                      children: [
                        const EmailTextField(),
                        const SizedBox(height: 23), // Email Text Input Field
                        const PasswordTextField(), // Password Text Input Field
                        const SizedBox(height: 10),
                        const ForgotButton(),
                        const SizedBox(height: 37),
                        Row(
                          children: const [
                            Expanded(
                                child: Divider(
                              height: 2,
                              thickness: 2,
                            )),
                            SizedBox(width: 10),
                            Text(
                              "OR Signup With",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: Divider(
                              height: 2,
                              thickness: 2,
                            )),
                          ],
                        ),
                        const SizedBox(height: 37),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            SocialMediaButton(
                                buttonText: 'Facebook',
                                icon: FontAwesomeIcons.facebook,
                                color: Colors.blue),
                            SocialMediaButton(
                                buttonText: 'Google',
                                icon: FontAwesomeIcons.google,
                                color: Colors.red),
                          ],
                        ),
                        const SizedBox(height: 44),
                        // Forgot Button
                        const LoginButton()
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

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String buttonText;
  const SocialMediaButton({
    super.key,
    required this.icon,
    required this.color,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 150,
        minHeight: 50,
      ),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: kWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        onPressed: () {},
        icon: Icon(
          // <-- Icon
          icon,
          size: 20.0,
          color: color,
        ),
        label: Text(
          buttonText,
          style: const TextStyle(
            color: kBlack,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ), // <-- Text
      ),
    );
  }
}

class ForgotButton extends StatelessWidget {
  const ForgotButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          child: const Text(
            "FORGOT",
            style: TextStyle(
              color: kDarkGreen,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

//Widgets

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

class LoginText extends StatelessWidget {
  const LoginText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Text(
          tLoginText,
          style: TextStyle(
            fontSize: 31,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class PasswordTextField extends GetView<LoginController> {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get.put(LoginController());
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
          decoration: InputDecoration(
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
            hintText: tLoginPasswordText,
            labelText: tLoginPasswordText,
            border: const OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(Sizes.kDefaultRadius / 2)),
            ),
          ),
        );
      },
    );
  }
}

class EmailTextField extends GetView<LoginController> {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //Get.put(LoginController());
    return TextFormField(
      controller: controller.emailController,
      onSaved: (value) {
        controller.email = value!;
      },
      validator: (value) {
        return controller.validateEmail(value!);
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
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
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
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
