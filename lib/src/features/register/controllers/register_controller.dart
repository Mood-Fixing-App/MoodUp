import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController {
  RxBool passwordVisible = false.obs;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController,reenterpasswordController;
  var email = '';
  var password = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    reenterpasswordController = TextEditingController();
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
  
    if(value!=passwordController.text){
      return 'Password does not match';
    }
    return null;
  }
  

  void checkRegister() {
    final isValid = registerFormKey.currentState!.validate();
    if (isValid ) {
      return;
    }
    registerFormKey.currentState!.save();
  }

  void togglePasswordVisibility() {
    passwordVisible.toggle();
  }
}