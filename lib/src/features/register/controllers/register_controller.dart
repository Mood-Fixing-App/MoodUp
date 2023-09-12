import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/register/models/user.dart';
import 'package:moodup/src/features/dashboard/screens/dashboard_screen.dart';

class RegisterController extends GetxController {
  RxBool passwordVisible = false.obs;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController,
      nameController,
      passwordController,
      reenterpasswordController;
  var email = '';
  var password = '';
  var name = '';
  RxBool isPreviouslyPressed = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    reenterpasswordController = TextEditingController();
    nameController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
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

  String? validateReEnterPassword(String value) {
    if (value != passwordController.text) {
      return 'Password does not match';
    }
    return null;
  }

  void register(name, email, password) async {
    final isValid = registerFormKey.currentState!.validate();

    isLoading.value = true;
    if (isValid) {
      await registerUser(name, email, password);
      isLoading.value = false;
    } else {
      isPreviouslyPressed.value = true;
      isLoading.value = false;
    }
    registerFormKey.currentState!.save();
  }

  void togglePasswordVisibility() {
    passwordVisible.toggle();
  }

  Future registerUser(String name, String email, String password) async {
    Map<String, dynamic> request = {
      'name': name,
      'email': email,
      'password': password,
      // 'reenterpassword': reenterpassword,
    };
    final uri = Uri.parse(
        'https://king-prawn-app-zrp6n.ondigitalocean.app/api/auth/register');

    var response = await http.post(uri, body: request);

    try {
      if (response.statusCode == 200) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Get.to(() => const DashboardScreen());
        return User.fromJson(jsonDecode(response.body));
      } else {
        Get.snackbar("Error", response.body[0]);
        if (kDebugMode) {
          print(response.body[0]);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
