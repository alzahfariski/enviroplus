import 'package:enviroplus/app/models/level_detail_model.dart';
import 'package:enviroplus/app/models/level_model.dart';
import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/home/navbar/navigation_bottom.dart';
import 'package:enviroplus/app/modules/mission/view/mission_result_view.dart';
import 'package:enviroplus/app/services/level_detail_service.dart';
import 'package:enviroplus/app/services/level_service.dart';
import 'package:enviroplus/app/services/user_point_service.dart';
import 'package:enviroplus/utils/loaders/loaders.dart';
import 'package:enviroplus/utils/popup/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MissionController extends GetxController {
  static MissionController get instance => Get.find();

  final authenticationController = Get.put(AuthenticationController());

  RxBool isNext = true.obs;
  RxInt isPage = 0.obs;
  RxList selectedAnswer = [].obs;
  RxInt getPoin = 0.obs;

  List<LevelModel> _levels = [];

  List<LevelModel> get level => _levels;

  set level(List<LevelModel> level) {
    _levels = level;
    update();
  }

  LevelDetailModel? _lvDetail;

  LevelDetailModel? get lvDetail => _lvDetail;

  set lvDetail(LevelDetailModel? lvDetailData) {
    _lvDetail = lvDetailData;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLevel();
  }

  void nextQues(String selectedAnswer) {
    chooseAnswer(selectedAnswer);
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == lvDetail!.questions!.length) {
      Get.to(() => MissionResultView());
    } else {
      isPage++;
    }
  }

  Future<void> getLevel() async {
    try {
      List<LevelModel> levels = await LevelService().getLevel();
      _levels = levels;
    } catch (e) {
      throw Exception(e);
    }
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

  Future<bool> updateUserPoin({
    int? point,
  }) async {
    try {
      await UserPointService().updatePoinUser(
        id: authenticationController.user!.id!,
        point: authenticationController.user!.point! + getPoin.value,
      );

      update();
      return true;
    } catch (e) {
      return false;
    }
  }

  void handlePoint() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information', 'assets/lottie/loader.json');

      if (await updateUserPoin(
        point: authenticationController.user!.point! + getPoin.value,
      )) {
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(title: 'selamat', message: 'Selamat');

        selectedAnswer.value = [];
        Get.to(() => BottomNavBar());
        isNext.value = true;
      } else {
        TLoaders.errorSnackBar(title: 'oh snap!', message: 'Tidak berhasil');
        TFullScreenLoader.stopLoading();
        selectedAnswer.value = [];
        Get.to(() => BottomNavBar());
        isNext.value = true;
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'oh snap!', message: e.toString());
      TFullScreenLoader.stopLoading();
      selectedAnswer.value = [];
      Get.to(() => BottomNavBar());
      isNext.value = true;
    }
  }
}
