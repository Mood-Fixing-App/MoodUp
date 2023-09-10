import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';

//Onboarding color themes
const kOnboardingBackgroundColorTheme = LinearGradient(
  colors: [
    kLighterGreen,
    kDarkGreen,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

// Login or Signup Screen Color Themes
const kLoginOrSignupBackgroundTheme = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      kLighterGreen,
      kDarkGreen,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
);
