import 'package:get/get.dart';
import 'package:moodup/src/features/onboard/screens/onboard_screen.dart';



class SpalshController extends GetxController{
  static SpalshController get to => Get.find();

  Future navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.off(() => const OnboardScreen());
  }

}