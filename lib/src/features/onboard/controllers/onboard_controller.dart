import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/dashboard/screens/dashboard_screen.dart';

class OnboardController extends GetxController{
  // Page Controller
  PageController onboardpagecontroller = Get.put(PageController(),tag: 'onboardpagecontroller');

  //Page Number
  RxInt pageNumber = 0.obs;
  void changePageNumber(int index) {
    pageNumber.value = index;
  }

  //Navigations
  void navigateToNextPage() {
    onboardpagecontroller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void navigateToLoginRegisterPage() {
    Get.off(()=> const DashboardScreen());
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