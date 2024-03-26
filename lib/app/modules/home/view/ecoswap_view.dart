import 'package:enviroplus/app/modules/chat/view/chat_view.dart';
import 'package:enviroplus/app/modules/community/view/community_view.dart';
import 'package:enviroplus/app/modules/home/controller/ecoswap_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoSwapView extends StatelessWidget {
  EcoSwapView({super.key});

  final EcoSwapController ecoSwapController = Get.put(EcoSwapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eco Swap',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: ecoSwapController.controller,
          tabs: ecoSwapController.myTabs,
        ),
      ),
      body: TabBarView(
        controller: ecoSwapController.controller,
        children: const [
          CommunityView(),
          ChatView(),
        ],
      ),
    );
  }
}
