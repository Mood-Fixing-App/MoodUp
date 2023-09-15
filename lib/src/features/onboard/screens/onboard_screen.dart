import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/utils/color_theme.dart';
import 'package:moodup/src/utils/text_themes.dart';
import 'package:moodup/src/widgets/white_button.dart';
import 'package:moodup/src/constants/text_strings.dart';
import 'package:moodup/src/constants/image_strings.dart';
import 'package:moodup/src/widgets/onboard/onboard_skipbutton.dart';
import 'package:moodup/src/features/onboard/models/onboard_model.dart';
import 'package:moodup/src/widgets/onboard/onboard_pageindicator.dart';
import 'package:moodup/src/features/onboard/controllers/onboard_controller.dart';

//************** Section 01:Onboard Screen ***********************************//
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  
  static var controller = Get.find<OnboardController>(tag: 'onboard');

  //! ******************* Sub section 01:Onboard Pages************************//
  static final onboardPages = [
    OnboardPage(
      model: OnboardModel(
        title: tonBoardingTitle1,
        description: tonBoardingSubTitle1,
        image: kOnboardingImage1,
      ),
      controller: controller,
    ),
    OnboardPage(
      model: OnboardModel(
          title: tonBoardingTitle2,
          description: tonBoardingSubTitle2,
          image: kOnboardingImage2),
      controller: controller,
    ),
    OnboardPage(
      model: OnboardModel(
        title: tonBoardingTitle3,
        description: tonBoardingSubTitle3,
        image: kOnboardingImage3,
      ),
      controller: controller,
    ),
  ];
  //! ******************* End: Onboard Pages *********************************//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //! *************** Sub section 02: PageView ***********************//
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) {
                controller.changePageNumber(index);
                return onboardPages[index];
              },
              controller: controller.onboardpagecontroller,
              itemCount: onboardPages.length,
            ),
          ),
          //! *************** End: PageView **********************************//
        ],
      ),
    );
  }
}
//************** End : Onboard Screen ****************************************//

//******************* Section 02 : Onboard page*******************************//
class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key, required this.model, required this.controller});
  final OnboardModel model;
  final OnboardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      //! ************ Sub Section 01 : Background Color *********************//
      decoration: const BoxDecoration(
        gradient: kOnboardingBackgroundColorTheme,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              //! ************ SUb Section 02 : SKip Button *****************//
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Show and hide skip button
                  controller
                          .setSkipButtonVisibility(controller.pageNumber.value)
                      ? SkipButton(
                          onPressed: () {
                            controller.skipButtonFunctionality();
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
              //! ************ Sub Section 03 : Image ************************//
              // Image.asset(model.image),
              Lottie.asset(
                model.image,
                height: 300,
                width: 300,
              ),
              const SizedBox(height: 18),

              //! ************ Sub Section 04 : Page Indicator ***************//
              const PageIndicator(),
              const SizedBox(height: 18),

              Column(
                children: [
                  //! ************ Sub Section 05 : Title *******************//
                  Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: kOnboardingTitleTheme,
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ////! ************ Sub Section 06 : Description ************//
                  Text(
                    model.description,
                    textAlign: TextAlign.center,
                    style: kOnboardingDescriptionTextTheme,
                  ),
                  const SizedBox(
                    height: 46,
                  ),

                  //! **** Sub Section 07 : Get statrted or Next Button******//
                  WhiteButton(
                    onPressed: () {
                      controller.setNavigation(
                        controller.pageNumber.value,
                      );
                    },
                    text: controller.setButtonText(
                      controller.pageNumber.value,
                    ),
                    height: Sizes.kDefaultButtonHeight,
                    width: Sizes.kDefaultButtonWidth,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
//************************** End : Onboard page*******************************//
