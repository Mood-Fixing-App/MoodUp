import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/utils/color_theme.dart';
import 'package:moodup/src/utils/text_themes.dart';
import 'package:moodup/src/widgets/white_button.dart';
import 'package:moodup/src/constants/text_strings.dart';
import 'package:moodup/src/constants/image_strings.dart';

class LoginOrSignupScreen extends StatefulWidget {
  const LoginOrSignupScreen({super.key});

  @override
  State<LoginOrSignupScreen> createState() => _LoginOrSignupScreenState();
}

class _LoginOrSignupScreenState extends State<LoginOrSignupScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: kLoginOrSignupBackgroundTheme,
        padding: const EdgeInsets.all(Sizes.kDefaultPadding),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: screenHeight * 0.4,
                  width: screenWidth,
                  child: Image.asset(kLogoWhite)),
              Column(
                children: const [
                  Text(
                    tLoginOrSignupTitle,
                    style: kLoginOrSignupTitleTheme,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    tLoginOrSignupSubTitle,
                    style: kLoginOrSignupSubtitlesTextStyle,
                  ),
                ],
              ),
              WhiteButton(
                  onPressed: () {},
                  text: 'Login',
                  width: Sizes.kDefaultButtonWidth,
                  height: Sizes.kDefaultButtonHeight),
              WhiteButton(
                  onPressed: () {},
                  text: 'Sign Up',
                  width: Sizes.kDefaultButtonWidth,
                  height: Sizes.kDefaultButtonHeight),
            ],
          ),
        ),
      ),
    ));
  }
}
