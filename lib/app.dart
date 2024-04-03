import 'package:enviroplus/app/modules/authentication/views/onboarding_view.dart';
import 'package:enviroplus/app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:enviroplus/utils/constants/text_strings.dart';
import 'package:enviroplus/utils/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: GetMaterialApp(
        title: TTexts.appName,
        themeMode: ThemeMode.dark,
        theme: TAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(milliseconds: 300),
        home: const OnBoardingView(),
      ),
    );
  }
}
