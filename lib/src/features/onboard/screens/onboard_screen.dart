import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/text_strings.dart';
import 'package:moodup/src/constants/image_strings.dart';
import 'package:moodup/src/common_widgets/white_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:moodup/src/features/onboard/models/onboard_model.dart';
import 'package:moodup/src/features/onboard/controllers/onboard_controller.dart';

//************** Variables **************************************/
final onboardController = Get.put(OnboardController());

//************** Variables **************************************/

//************** Onboard Screen **************************************/
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  //Disposing the controller
  @override
  void dispose() {
    onboardController.dispose();
    super.dispose();
  }

  //! Onboard Pages***************************************************
  static final onboardPages = [
    OnboardPage(
      model: OnboardModel(
        title: tonBoardingTitle1,
        description: tonBoardingSubTitle1,
        image: kOnboardingImage1,
      ),
    ),
    OnboardPage(
      model: OnboardModel(
        title: tonBoardingTitle2,
        description: tonBoardingSubTitle2,
        image: kOnboardingImage2,
      ),
    ),
    OnboardPage(
      model: OnboardModel(
        title: tonBoardingTitle3,
        description: tonBoardingSubTitle3,
        image: kOnboardingImage3,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                onboardController.changePageNumber(index);
                return onboardPages[index];
              },
              controller: onboardController.onboardpagecontroller,
              itemCount: onboardPages.length,
            ),
          ),
        ],
      ),
    );
  }
}
//************** Onboard Screen  ******************** **************************************/
//*************************************************************************************** */

//******************* Onboard page*********************************************************/
class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key, required this.model});
  final OnboardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      //! Background Color
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kLighterGreen,
            kDarkGreen,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //! Skip Button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Show and hide skip button
                  onboardController.setSkipButtonVisibility(
                          onboardController.pageNumber.value)
                      ? SkipButton(
                          onPressed: () {
                            onboardController.skipButtonFunctionality();
                          },
                          text: 'SKIP',
                        )
                      : const SkipButton(
                          onPressed: null,
                          text: '',
                        ),
                ],
              ),
              const SizedBox(height: 34),
              //! Image
              Image.asset(model.image),
              const SizedBox(height: 18),

              //! Page Indicator
              const PageIndicator(),
              const SizedBox(height: 18),

              //! Title and Description
              Column(
                children: [
                  //! Title
                  Text(model.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 10,
                  ),

                  //! Description
                  Text(
                    model.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 46,
                  ),

                  //! Get Started Button or Next Button
                  WhiteButton(
                    onPressed: () {
                      onboardController.setNavigation(
                        onboardController.pageNumber.value,
                      );
                    },
                    text: onboardController.setButtonText(
                      onboardController.pageNumber.value,
                    ),
                    height: Sizes.kDefaultButtonHeight,
                    width: Sizes.kDefaultButtonWidth,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//*************************************** Widgets ************************* */

class SkipButton extends StatelessWidget {
  final void Function()? onPressed;

  final String text;

  const SkipButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: onboardController.onboardpagecontroller,
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
