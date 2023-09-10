import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ForgotController extends GetxController {

  late TextEditingController emailController;
  var email = '';


  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }


  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }


}
