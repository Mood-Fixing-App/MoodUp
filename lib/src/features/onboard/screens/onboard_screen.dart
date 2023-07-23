import 'package:flutter/material.dart';
import 'package:moodup/src/constants/sizes.dart';
import 'package:moodup/src/constants/colors.dart';
import 'package:moodup/src/constants/text_strings.dart';
import 'package:moodup/src/constants/image_strings.dart';
import 'package:moodup/src/common_widgets/white_button.dart';
import 'package:moodup/src/features/onboard/models/onboard_model.dart';
import 'package:moodup/src/common_widgets/onboard/onboard_skip_button.dart';
import 'package:moodup/src/common_widgets/onboard/onboard_page_indicator.dart';
import 'package:moodup/src/features/onboard/controllers/onboard_controller.dart';


//************** Section 01:Onboard Screen ***********************************//
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  //! ******************* Sub section 01:Onboard Pages************************//
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
                OnboardController.changePageNumber(index);
                return onboardPages[index];
              },
              controller: OnboardController.onboardpagecontroller,
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
  const OnboardPage({super.key, required this.model});
  final OnboardModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      //! ************ Sub Section 01 : Background Color *********************//
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
               //! ************ SUb Section 02 : SKip Button *****************//
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Show and hide skip button
                  OnboardController.setSkipButtonVisibility(
                          OnboardController.pageNumber.value)
                      ? SkipButton(
                          onPressed: () {
                            OnboardController.skipButtonFunctionality();
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
              Image.asset(model.image),
              const SizedBox(height: 18),

              //! ************ Sub Section 04 : Page Indicator ***************//
              const PageIndicator(),
              const SizedBox(height: 18),

              
              Column(
                children: [
                  //! ************ Sub Section 05 : Title *******************//
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

                  ////! ************ Sub Section 06 : Description ************//
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

                  //! **** Sub Section 07 : Get statrted or Next Button******//
                  WhiteButton(
                    onPressed: () {
                      OnboardController.setNavigation(
                        OnboardController.pageNumber.value,
                      );
                    },
                    text: OnboardController.setButtonText(
                      OnboardController.pageNumber.value,
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
