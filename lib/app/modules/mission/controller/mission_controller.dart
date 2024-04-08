import 'package:enviroplus/app/models/level_detail_model.dart';
import 'package:enviroplus/app/models/level_model.dart';
import 'package:enviroplus/app/services/level_detail_service.dart';
import 'package:enviroplus/app/services/level_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MissionController extends GetxController {
  static MissionController get instance => Get.find();

  RxBool isNext = true.obs;

  @override
  void onInit() {
    super.onInit();
    getLevel();
  }

  List<LevelModel> _levels = [];

  List<LevelModel> get level => _levels;

  set level(List<LevelModel> level) {
    _levels = level;
    update();
  }

  Future<void> getLevel() async {
    try {
      List<LevelModel> levels = await LevelService().getLevel();
      _levels = levels;
    } catch (e) {
      throw Exception(e);
    }
  }

  LevelDetailModel? _lvDetail;

  LevelDetailModel? get lvDetail => _lvDetail;

  set lvDetail(LevelDetailModel? lvDetailData) {
    _lvDetail = lvDetailData;
    update();
  }

  Future<void> getQuestion(String id) async {
    try {
      lvDetail = await LevelDetailService().getQuestion(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  void showCongratulationsDialog() {
    Get.defaultDialog(
      barrierDismissible: false,
      onCancel: () {
        Get.back();
      },
      title: "Selamat!",
      content: Column(
        children: [
          Lottie.asset(
            'assets/images/animations/141594-animation-of-docer.json',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          const Text("4 / 5 Jawaban benar"),
          const Text("Mendapatkan 20 Poin"),
        ],
      ),
    );
  }
}
