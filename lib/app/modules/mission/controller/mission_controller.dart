import 'package:enviroplus/app/models/level_detail_model.dart';
import 'package:enviroplus/app/models/level_model.dart';
import 'package:enviroplus/app/services/level_detail_service.dart';
import 'package:enviroplus/app/services/level_service.dart';
import 'package:get/get.dart';

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
}
