import 'package:get/get.dart';

class LoginSignUpController extends GetxController {
  RxBool isObscure = true.obs;

  isObscureActive() {
    isObscure.value = !isObscure.value;
  }
}