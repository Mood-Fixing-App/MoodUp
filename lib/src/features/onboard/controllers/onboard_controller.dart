import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/login_or_register/screens/login_or_register_screen.dart';

class OnboardController extends GetxController {
  PageController onboardpagecontroller = PageController(initialPage: 0);

  //Page Number
  RxInt pageNumber = 0.obs;
  void changePageNumber(int index) {
    pageNumber.value = index;
  }

  //Navigations
  void navigateToNextPage() {
    onboardpagecontroller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  //Navigation to register page

  void navigateToLoginRegisterPage() {
    Get.to(() => const LoginOrRegisterScreen());
  }

  //Navigatgion Controlling
  void setNavigation(int index) {
    if (index == 2) {
      navigateToLoginRegisterPage();
    } else {
      navigateToNextPage();
    }
  }

  //Button Text Changer
  String setButtonText(int index) {
    if (index == 2) {
      return 'Get Started';
    } else {
      return 'Next';
    }
  }

  //Skip Button Visibility
  bool setSkipButtonVisibility(int index) {
    if (index == 2) {
      return false;
    } else {
      return true;
    }
  }

  //Skip Button Functionality
  void skipButtonFunctionality() {
    onboardpagecontroller.jumpToPage(2);
  }
}
