import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moodup/src/constants/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/register/models/user.dart';

class DashboardController extends GetxController {
  RxInt selectedIndex = 0.obs;
  PageController pageController = PageController(initialPage: 0);
  var user = User().obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchUser();
  }

  // Function to change the selected tab
  onTabChange(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(selectedIndex.value);
  }

  Future<String> emailShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    return email.toString();
  }

  fetchUser() async {
    String email = await emailShared();

    Uri url = Uri.parse(
        '$kLoggedInUserUrl$email');
    var response = await http.get(url);
    user.value = User.fromJson(jsonDecode(response.body)['user']);
    return user;
  }
}
