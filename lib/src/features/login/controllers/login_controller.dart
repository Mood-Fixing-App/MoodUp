import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/register/models/user.dart';
import 'package:moodup/src/features/dashboard/screens/dashboard_screen.dart';

class LoginController extends GetxController {
  RxBool passwordVisible = false.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  var isLoading = false.obs;
  

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.onClose();
  // }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // void login(email, passsword) async {
  //   final isValid = loginFormKey.currentState!.validate();
  //   isLoading.value = true;
  //   if (isValid) {
  //     await loginUser(email, password);
  //     isLoading.value = false;
  //   }
  //   loginFormKey.currentState!.save();
  // }

  void togglePasswordVisibility() {
    passwordVisible.toggle();
  }

  Future loginUser(String email, String password) async {
    isLoading.value = true;
    if (kDebugMode) {
      print(email + password);
    }
    Map<String, dynamic> request = {
      "email": email,
      "password": password,
    };
    Uri uri = Uri.parse(
        'https://king-prawn-app-zrp6n.ondigitalocean.app/api/auth/login');

    var response = await http.post(
      uri,
      body: request,
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);
      isLoading.value = false;
      

      Get.offAll(() => const DashboardScreen());
    } else {
      Get.snackbar(
        'Error',
        jsonDecode(response.body)['message'],
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
        isDismissible: true,
      );
    }
  }
}
