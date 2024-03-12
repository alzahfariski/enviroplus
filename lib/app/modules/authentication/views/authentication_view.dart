import 'package:enviroplus/app/data/common/custom_shape/header_container.dart';
import 'package:enviroplus/app/data/common/appbar/appbar.dart';
import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/authentication_widget/login_form_widget.dart';
import 'package:enviroplus/app/modules/authentication/views/widgets/authentication_widget/register_form_widget.dart';
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
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    TAppBar(
                      padding: 16,
                      title: Container(),
                      action: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Image(
                        image: AssetImage(logController.isLogin.value == true
                            ? TImages.loginImage
                            : TImages.registerImage),
                      ),
                    ),
                  ],
                ),
              ),
              logController.isLogin.value == true
                  ? LoginFormWidget()
                  : RegisterFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
