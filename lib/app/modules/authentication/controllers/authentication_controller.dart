import 'package:enviroplus/app/models/user_model.dart';
import 'package:enviroplus/app/modules/authentication/views/authentication_view.dart';
import 'package:enviroplus/app/modules/home/navbar/navigation_bottom.dart';
import 'package:enviroplus/app/services/auth_service.dart';
import 'package:enviroplus/utils/helpers/network_manager.dart';
import 'package:enviroplus/utils/loaders/loaders.dart';
import 'package:enviroplus/utils/popup/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  RxBool isLogin = true.obs;
  RxBool isHidden = true.obs;

  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController password;

  @override
  void onInit() async {
    email = TextEditingController();
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    username.dispose();
    password.dispose();
    super.onClose();
  }

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  UserModel? _user;

  UserModel? get user => _user;

  Future<void> autoLogin() async {
    final box = GetStorage();
    final token = box.read('usertoken');
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      if (token != null) {
        _user = await AuthService().fetchData(token);
        update();
      }
    }
  }

  Future<bool> register({
    String? username,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        username: username,
        email: email,
        password: password,
      );
      _user = await AuthService().fetchData(user.token!);

      update();
      return true;
    } catch (e) {
      return false;
    }
  }

  void handleSignUp() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information', 'assets/lottie/loader.json');
      if (!signUpFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (await register(
        username: username.text,
        email: email.text,
        password: password.text,
      )) {
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(title: 'selamat', message: 'akun dibuat');

        final box = GetStorage();
        box.writeIfNull('usertoken', user!.token);
        final storage = GetStorage();
        storage.write("isFirstTime", false);
        Get.to(() => BottomNavBar());
      } else {
        TLoaders.errorSnackBar(title: 'oh snap!', message: 'Akun Telah ada');
        TFullScreenLoader.stopLoading();
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh snap!', message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }

  Future<bool> login({
    String? username,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        username: username,
        password: password,
      );
      _user = await AuthService().fetchData(user.token!);

      update();
      return true;
    } catch (e) {
      return false;
    }
  }

  void handleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information', 'assets/lottie/loader.json');
      if (!signInFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      if (await login(
        username: username.text,
        password: password.text,
      )) {
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(title: 'selamat', message: 'Selamat Datang');

        final storage = GetStorage();
        storage.write("isFirstTime", false);
        final box = GetStorage();
        box.writeIfNull('usertoken', user!.token);
        Get.to(() => BottomNavBar());
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

  void refreshFormKeys() {
    signUpFormKey = GlobalKey<FormState>();
    signInFormKey = GlobalKey<FormState>();
  }

  void logout() {
    final storage = GetStorage();
    storage.erase();
    refreshFormKeys();
    email.clear();
    username.clear();
    password.clear();
    Get.offAll(() => AuthenticationView()); // Membuka kembali aplikasi
  }
}
