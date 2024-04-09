import 'package:enviroplus/app/modules/mission/controller/mission_controller.dart';
import 'package:enviroplus/app/modules/mission/widget/answer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MisiSoal extends StatelessWidget {
  const MisiSoal({
    super.key,
    required this.missionController,
  });

  final MissionController missionController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Text(
            'Jawab Pertanyaan Untuk Mendapatkan Poin',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'Pilih Jawaban Untuk Lanjut Kesoal berikutnya',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            missionController
                .lvDetail!.questions![missionController.isPage.value].text!,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          ...missionController.lvDetail!
              .questions![missionController.isPage.value].shuffledAnswers
              .map((answer) {
            return AnswerWidget(
              missionController: missionController,
              answer: answer,
              function: () {
                missionController.nextQues();
              },
            );
          }),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
