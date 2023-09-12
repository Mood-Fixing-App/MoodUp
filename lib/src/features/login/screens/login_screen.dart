import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/widgets/login/login_logintext.dart';
import 'package:moodup/src/widgets/login/login_backbutton.dart';
import 'package:moodup/src/widgets/login/login_emailfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodup/src/widgets/login/login_loginbutton.dart';
import 'package:moodup/src/widgets/login/login_forgotbutton.dart';
import 'package:moodup/src/widgets/login/login_passwordfield.dart';
import 'package:moodup/src/widgets/login/login_social_media_button.dart';
import 'package:moodup/src/features/login/controllers/login_controller.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController(),tag: 'login');
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
                  const BackButtonLogin(),
                  const SizedBox(height: 30), // Back Button
                  const LoginText(),
                  const SizedBox(height: 10),
                  const Text(
                    'Please sign in to continue.',
                    style: TextStyle(fontSize: 18, color: kLightBlack),
                  ),
                  const SizedBox(height: 60), // Login Text
                  Form(
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
