import 'dart:convert';

import 'package:enviroplus/app/models/level_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LevelService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<List<LevelModel>> getLevel() async {
    var url = '$baseUrl/level';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['levels'];
      List<LevelModel> levels = [];
      for (var item in data) {
        levels.add(LevelModel.fromJson(item));
      }
      return levels;
    } else {
      throw Exception('Gagal get level');
    }
  }
}
