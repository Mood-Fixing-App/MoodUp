import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:moodup/src/features/onboard/screens/onboard_screen.dart';
import 'package:moodup/src/features/dashboard/screens/dashboard_screen.dart';



class SpalshController extends GetxController{
  static SpalshController get to => Get.find();

  Future navigateToHome() async {
    await Future.delayed(const Duration(seconds: 4));
    await getValidationData();
  }
  Future getValidationData() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final String? token = sharedPreferences.getString('email');
  if (token != null) {
    Get.offAll(() => const DashboardScreen());
  } else {
    Get.offAll(() => const OnboardScreen());
  }
}

}