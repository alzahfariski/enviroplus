import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/authentication/views/onboarding_view.dart';
import 'package:enviroplus/app/modules/home/navbar/navigation_bottom.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:enviroplus/utils/constants/text_strings.dart';
import 'package:enviroplus/utils/theme/theme.dart';
import 'package:get_storage/get_storage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticationController = Get.put(AuthenticationController());
    final deviceStorage = GetStorage();
    deviceStorage.writeIfNull("isFirstTime", true);
    return FutureBuilder(
      future: authenticationController.autoLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: TTexts.appName,
            themeMode: ThemeMode.dark,
            theme: TAppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            defaultTransition: Transition.rightToLeftWithFade,
            transitionDuration: const Duration(milliseconds: 300),
            home: deviceStorage.read("isFirstTime") != true
                ? BottomNavBar()
                : const OnBoardingView(),
          );
        }
        return const GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: TColors.dark,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
