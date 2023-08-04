import 'package:get/get.dart';
import 'package:moodup/src/features/login/screens/login_screen.dart';
import 'package:moodup/src/features/signup/screens/signup_screen.dart';

class LoginOrSignUpController extends GetxController {
  static void loginNavigation() {
    Get.to(LoginScreen());
  }
  static void signUpNavigation() {
    Get.to(const SignupScreen());
  }
}