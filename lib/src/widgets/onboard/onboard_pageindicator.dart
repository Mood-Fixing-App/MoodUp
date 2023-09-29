import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:moodup/src/features/onboard/controllers/onboard_controller.dart';


class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardController>(tag: 'onboard');
    return SmoothPageIndicator(
      controller: controller.onboardpagecontroller,
      count: 3,
      effect: const ScrollingDotsEffect(
        activeDotColor: kWhite,
        dotColor: kLightBlack,
        dotHeight: 10,
        dotWidth: 10,
        spacing: 8,
      ),
    );
  }
}
