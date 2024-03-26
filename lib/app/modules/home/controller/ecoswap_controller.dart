import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoSwapController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> myTabs = const [
    Tab(
      text: 'Community',
    ),
    Tab(
      text: 'Chat',
    ),
  ];

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
