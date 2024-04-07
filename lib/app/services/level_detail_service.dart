import 'dart:convert';

import 'package:enviroplus/app/models/level_detail_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LevelDetailService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<LevelDetailModel> getQuestion(String id) async {
    var url = '$baseUrl/level/$id';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body)['data']['level'];
      LevelDetailModel quest = LevelDetailModel.fromJson(data);
      return quest;
    } else {
      throw Exception('Gagal get Level Detail');
    }
  }
}
