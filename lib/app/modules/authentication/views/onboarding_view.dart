import 'package:enviroplus/app/modules/authentication/controllers/onboarding_controller.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/onboarding_widget/onboarding_dot_navigation.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/onboarding_widget/onboarding_next_button.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/onboarding_widget/onboarding_page.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/onboarding_widget/onboarding_skip.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:enviroplus/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
                image: TImages.onBoardingImage1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
                image: TImages.onBoardingImage2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
                image: TImages.onBoardingImage3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
