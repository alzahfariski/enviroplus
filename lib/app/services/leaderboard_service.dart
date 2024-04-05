import 'dart:convert';

import 'package:enviroplus/app/models/leaderboard_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LeaderboardService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<List<LeaderboardModel>> getLeaderboard() async {
    var url = '$baseUrl/user/leaderboard';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['users'];
      List<LeaderboardModel> leaderboards = [];
      for (var item in data) {
        leaderboards.add(LeaderboardModel.fromJson(item));
      }
      return leaderboards;
    } else {
      throw Exception('Gagal get leaderboard');
    }
  }
}
