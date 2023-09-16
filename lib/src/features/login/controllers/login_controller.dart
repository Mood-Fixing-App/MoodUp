import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:moodup/src/constants/http.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    Uri uri = Uri.parse(kLoginUrl);

    var response = await http.post(
      uri,
      body: request,
      headers: {"Accept": "application/json"},
    );

    var data = jsonDecode(response.body);

    try {
      if (data['status'] == 'success') {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        isLoading.value = false;

        Get.offAll(() => const DashboardScreen());
      } else {
        showCredentialError(response);
        isLoading.value = false;
      }
    } catch (e) {
      showNoAccountError();
      isLoading.value = false;
    }
  }

  void showNoAccountError() {
    Get.snackbar(
      'Error',
      'You have not registered yet',
      backgroundColor: kLightGreen,
      icon: const Icon(Icons.error),
      duration: const Duration(seconds: 5),
      isDismissible: true,
    );
  }

  void showCredentialError(http.Response response) {
    Get.snackbar(
      'Error',
      jsonDecode(response.body)['message'],
      duration: const Duration(seconds: 5),
      icon: const Icon(Icons.error),
      backgroundColor: kLightGreen,
      isDismissible: true,
    );
  }
}
