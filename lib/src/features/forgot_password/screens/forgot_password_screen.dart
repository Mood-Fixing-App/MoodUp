import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/widgets/forgot_password/forgot_image.dart';
import 'package:moodup/src/widgets/forgot_password/forgot_backbutton.dart';
import 'package:moodup/src/widgets/forgot_password/forgot_emailfield.dart';
import 'package:moodup/src/widgets/forgot_password/forgot_forgottext.dart';
import 'package:moodup/src/widgets/forgot_password/forgot_sendbutton.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 5),
                  const BackButtonForgot(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ForgotImage(),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const ForgotText(),
                  const SizedBox(height: 10),
                  const Text(
                    'Please enter your email to reset your password.',
                    style: TextStyle(fontSize: 18, color: kLightBlack),
                  ),
                  const SizedBox(height: 40),
                  const EmailTextFieldForgot(),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ForgotSendButton(),
                    ],
                  )
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}


