import 'package:enviroplus/app/modules/home/navbar/navigation_bottom.dart';
import 'package:enviroplus/app/providers/auth_provider.dart';
import 'package:enviroplus/utils/loaders/loaders.dart';
import 'package:enviroplus/utils/popup/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final username = TextEditingController();
  final password = TextEditingController();

  final AuthProvider authProvider = Get.put(AuthProvider());

  void handleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information', 'assets/lottie/loader.json');
      if (await authProvider.login(
        username: username.text,
        password: password.text,
      )) {
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(title: 'selamat', message: 'Selamat Datang');
        Get.to(() => const BottomNavBar());
      } else {
        TLoaders.errorSnackBar(
            title: 'oh snap!', message: 'Tidak berhasil login');
        TFullScreenLoader.stopLoading();
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh snap!', message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}
