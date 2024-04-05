import 'package:enviroplus/app/modules/badge/view/badge_view.dart';
import 'package:enviroplus/app/modules/home/controller/ecoquest_controller.dart';
import 'package:enviroplus/app/modules/mission/view/mission_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoQuestView extends StatelessWidget {
  EcoQuestView({super.key});
  final EcoQuestController ecoQuestController = Get.put(EcoQuestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eco Quest',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: ecoQuestController.controller,
          tabs: ecoQuestController.myTabs,
        ),
      ),
      body: TabBarView(
        controller: ecoQuestController.controller,
        children: [
          MissionView(),
          const BadgeView(),
        ],
      ),
    );
  }
}
