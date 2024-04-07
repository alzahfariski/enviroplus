import 'package:enviroplus/app/modules/mission/controller/mission_controller.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MisiSoal extends StatelessWidget {
  const MisiSoal({
    super.key,
    required this.missionController,
  });

  final MissionController missionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Jawab Pertanyaan Untuk Mendapatkan Poin',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: missionController.lvDetail!.questions!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text(
                  missionController.lvDetail!.questions![index].text!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: missionController
                      .lvDetail!.questions![index].answers!.length,
                  itemBuilder: (context, index) {
                    return Text(
                      "$index ${missionController.lvDetail!.questions![index].answers![index]}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    );
                  },
                ),
              ],
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: TColors.primary,
          ),
          onPressed: () {},
          child: Text(
            'Simpan Jawaban',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: TColors.black,
                ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
