import 'package:enviroplus/app/models/leaderboard_model.dart';
import 'package:enviroplus/app/services/leaderboard_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  @override
  void onInit() {
    super.onInit();
    getLeaderboard();
  }

  List<LeaderboardModel> _leaderboards = [];

  List<LeaderboardModel> get leaderboard => _leaderboards;

  set leaderboard(List<LeaderboardModel> leaderboard) {
    _leaderboards = leaderboard;
    update();
  }

  Future<void> getLeaderboard() async {
    try {
      List<LeaderboardModel> leaderboards =
          await LeaderboardService().getLeaderboard();
      _leaderboards = leaderboards;
    } catch (e) {
      throw Exception(e);
    }
  }
}
