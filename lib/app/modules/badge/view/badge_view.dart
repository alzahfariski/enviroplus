import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/badge/controller/badge_controller.dart';
import 'package:enviroplus/app/modules/badge/widget/badge_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    final badgeController = Get.put(BadgeController());
    final authenticationController = Get.put(AuthenticationController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Total Poin',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: TColors.primary,
                    ),
              ),
              Text(
                authenticationController.user!.point.toString(),
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: TColors.primary,
                      fontSize: 64,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              BadgeWidget(
                authenticationController: authenticationController,
                badgeController: badgeController,
                title: 'Penghargaan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
