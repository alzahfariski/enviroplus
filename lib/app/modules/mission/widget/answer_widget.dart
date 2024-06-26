import 'package:enviroplus/app/modules/mission/controller/mission_controller.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  const AnswerWidget({
    super.key,
    required this.answer,
    required this.function,
    required this.missionController,
  });

  final String answer;
  final void Function() function;
  final MissionController missionController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: TColors.darkContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          answer,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: TColors.light,
              ),
        ),
      ),
    );
  }
}
