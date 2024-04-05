import 'package:enviroplus/app/models/level_model.dart';
import 'package:enviroplus/app/services/level_service.dart';
import 'package:get/get.dart';

class MissionController extends GetxController {
  static MissionController get instance => Get.find();

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
}
