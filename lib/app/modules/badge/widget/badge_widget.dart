import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/badge/controller/badge_controller.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({
    super.key,
    required this.title,
    required this.badgeController,
    required this.authenticationController,
  });

  final BadgeController badgeController;
  final String title;
  final AuthenticationController authenticationController;

  @override
  Widget build(BuildContext context) {
    int a = authenticationController.user!.point!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: TColors.primary,
              ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            itemCount: badgeController.badge.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            badgeController.badge[index].gambar,
                            width: MediaQuery.of(context).size.width / 5,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        a < badgeController.badge[index].poinMin
                            ? Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/badge/gembok.png'),
                                    ),
                                    color:
                                        TColors.darkContainer.withOpacity(0.8),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    Text(
                      badgeController.badge[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
