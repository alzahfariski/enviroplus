import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  static AuthenticationController get instance => Get.find();

  RxBool isLogin = true.obs;

  void register() {
    isLogin.value = !isLogin.value;
  }
}
