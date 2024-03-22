import 'package:enviroplus/app/modules/authentication/controllers/onboarding_controller.dart';
import 'package:enviroplus/app/modules/authentication/views/authentication_view.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/sizes.dart';
import 'package:enviroplus/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: Obx(() {
        final controller = Get.find<OnBoardingController>();
        return ElevatedButton(
          onPressed: () => controller.isLastPage.value
              ? Get.off(AuthenticationView())
              : controller.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: TColors.primary,
            padding: const EdgeInsets.all(16),
          ),
          child: Icon(
            controller.isLastPage.value
                ? Icons.check
                : Icons.arrow_forward_ios_outlined,
            color: TColors.dark,
          ),
        );
      }),
    );
  }
}
