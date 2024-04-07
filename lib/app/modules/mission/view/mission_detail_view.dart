import 'package:enviroplus/app/modules/mission/controller/mission_controller.dart';
import 'package:enviroplus/app/modules/mission/widget/misi_detail_widget.dart';
import 'package:enviroplus/app/modules/mission/widget/misi_soal_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MissionDetailView extends StatelessWidget {
  const MissionDetailView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    final missionController = Get.put(MissionController());
    return FutureBuilder(
      future: missionController.getQuestion(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Obx(
            () => Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: TColors.primary,
                  ),
                ),
                title: Text(missionController.lvDetail!.name!),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                  child: missionController.isNext.value
                      ? MisiDetail(missionController: missionController)
                      : MisiSoal(missionController: missionController),
                ),
              ),
              floatingActionButton: IconButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                ),
                onPressed: () {
                  missionController.isNext.toggle();
                },
                icon: Icon(
                  missionController.isNext.value
                      ? Icons.navigate_next_outlined
                      : Icons.navigate_before_outlined,
                  size: 32,
                  color: TColors.dark,
                ),
              ),
              floatingActionButtonLocation: missionController.isNext.value
                  ? FloatingActionButtonLocation.endFloat
                  : FloatingActionButtonLocation.startFloat,
            ),
          );
        }
        return const Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
