import 'package:enviroplus/app/modules/mission/controller/mission_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MissionResultView extends StatelessWidget {
  MissionResultView({super.key});
  final missionController = Get.put(MissionController());

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < missionController.selectedAnswer.length; i++) {
      summary.add({
        'question-index': i,
        'question': missionController.lvDetail!.questions![i],
        'correct-answer': missionController.lvDetail!.questions![i].answers![0],
        'user-answer': missionController.selectedAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = missionController.lvDetail!.questions!.length;
    final numCorrectQuestions = summaryData.where((element) {
      return element['user-answer'] == element['correct-answer'];
    }).length;
    missionController.getPoin.value = numCorrectQuestions * 5;
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kamu benar $numCorrectQuestions dari $numTotalQuestions pertanyaan',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Mendapatkan ${missionController.getPoin.value} Poin',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Lottie.asset(
                'assets/images/animations/141594-animation-of-docer.json',
                width: 280,
                height: 280,
                fit: BoxFit.contain),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                missionController.handlePoint();
              },
              child: Text(
                'Klaim Point',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
