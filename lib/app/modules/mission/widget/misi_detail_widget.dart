import 'package:enviroplus/app/modules/mission/controller/mission_controller.dart';
import 'package:flutter/material.dart';

class MisiDetail extends StatelessWidget {
  const MisiDetail({
    super.key,
    required this.missionController,
  });

  final MissionController missionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          missionController.lvDetail!.imageUrl!,
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          textAlign: TextAlign.justify,
          missionController.lvDetail!.description!,
        ),
      ],
    );
  }
}
