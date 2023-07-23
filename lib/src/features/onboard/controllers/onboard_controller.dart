import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/features/dashboard/screens/dashboard_screen.dart';

class OnboardController extends GetxController{
  // Page Controller
  static PageController onboardpagecontroller = Get.put(PageController(),tag: 'onboardpagecontroller');

  //Page Number
  static RxInt pageNumber = 0.obs;
  static void changePageNumber(int index) {
    pageNumber.value = index;
  }

  //Navigations
  static void navigateToNextPage() {
    onboardpagecontroller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  //Navigation to register page
  static void navigateToLoginRegisterPage() {
    Get.off(()=> const DashboardScreen());
  }


  //Navigatgion Controlling
  static void setNavigation(int index) {
    if (index == 2) {
      navigateToLoginRegisterPage();
    } else {
      navigateToNextPage();
    }
  }

  //Button Text Changer
  static String setButtonText(int index) {
    if (index == 2) {
      return 'Get Started';
    } else {
      return 'Next';
    }
  }

  //Skip Button Visibility
  static bool setSkipButtonVisibility(int index) {
    if (index == 2) {
      return false;
    } else {
      return true;
    }
  }

  //Skip Button Functionality
  static void skipButtonFunctionality() {
    onboardpagecontroller.jumpToPage(2);
  }

  
}