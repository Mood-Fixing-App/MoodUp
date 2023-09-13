import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
    emailShared();
  }

  // Function to change the selected tab
  onTabChange(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(selectedIndex.value);
  }

  void emailShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    if (kDebugMode) {
      print(email);
    }
  }
}
