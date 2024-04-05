import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/authentication_widget/login_form_widget.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/authentication_widget/register_form_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationView extends GetView<AuthenticationController> {
  AuthenticationView({super.key});

  final logController = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                child: Text(
                  logController.isLogin.value == true
                      ? 'Selamat Datang'
                      : 'Ayo Bergabung',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 240,
                      decoration: const BoxDecoration(
                        color: TColors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -190,
                    child: Image(
                      image: AssetImage(logController.isLogin.value == true
                          ? TImages.loginImage
                          : TImages.registerImage),
                      width: 400,
                      height: 400,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    color: TColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    border: Border(
                        top: BorderSide(
                      width: 2,
                      color: TColors.primary,
                    ))),
                child: logController.isLogin.value == true
                    ? LoginFormWidget()
                    : RegisterFormWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
