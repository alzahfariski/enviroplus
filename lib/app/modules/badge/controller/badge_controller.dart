import 'package:enviroplus/app/data/badge_data.dart';
import 'package:enviroplus/app/models/badge_model.dart';
import 'package:get/get.dart';

class BadgeController extends GetxController {
  RxList<BadgeModel> badge = <BadgeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    badge.assignAll(BadgeData.pencapaian);
  }
}
