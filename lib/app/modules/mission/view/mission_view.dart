import 'package:enviroplus/app/modules/mission/view/mission_detail_view.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MissionView extends StatelessWidget {
  const MissionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: GridView.builder(
          itemCount: 4,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            int num = index + 1;
            return GestureDetector(
              onTap: () {
                Get.to(() => const MissionDetailView());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Level $num',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: TColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            'Energi Elektronik',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  color: TColors.black,
                                ),
                          ),
                        ],
                      ),
                      Image.asset(
                        TImages.misi1,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
