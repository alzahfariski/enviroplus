import 'package:enviroplus/app/modules/mission/controller/mission_controller.dart';
import 'package:enviroplus/app/modules/mission/view/mission_detail_view.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MissionView extends StatelessWidget {
  MissionView({super.key});
  final missionController = Get.put(MissionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: FutureBuilder(
          future: missionController.getLevel(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: missionController.level.length,
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
                      Get.to(() => MissionDetailView(
                            id: missionController.level[index].id!,
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: TColors.darkContainer,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Level $num',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  missionController.level[index].name!,
                                  style: Theme.of(context).textTheme.labelLarge,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: TColors.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                missionController.level[index].imageUrl!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    ));
  }
}
