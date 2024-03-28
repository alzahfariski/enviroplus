import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/authentication/views/lupapass_view.dart';
import 'package:enviroplus/app/modules/home/navbar/navigation_bottom.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({
    super.key,
  });
  final AuthenticationController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
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
          TextField(
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
                'Password',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: TColors.white,
                    ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const LupaPassView());
            },
            child: Text(
              'Lupa password ?',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: TColors.white,
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
                Get.to(() => const BottomNavBar());
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
                authController.register();
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
    );
  }
}
