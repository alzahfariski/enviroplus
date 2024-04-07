import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({
    super.key,
  });
  final AuthenticationController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final signInController = Get.put(AuthenticationController());

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: signInController.signInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              validator: (value) => TValidator.validateUsername(value),
              controller: signInController.username,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    width: 1,
                    color: TColors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    width: 1,
                    color: TColors.white,
                  ),
                ),
                label: Text(
                  'Username',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: TColors.white,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: signInController.password,
                obscureText: authController.isHidden.value,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      width: 1,
                      color: TColors.white,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      width: 1,
                      color: TColors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () => authController.isHidden.toggle(),
                    icon: authController.isHidden.value
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                  label: Text(
                    'Password',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: TColors.white,
                        ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                ),
                onPressed: () {
                  signInController.handleSignIn();
                },
                child: Text(
                  'Masuk',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: TColors.dark,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(width: 1, color: TColors.primary)),
                onPressed: () {
                  authController.isLogin.toggle();
                },
                child: Text(
                  'Daftar',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
