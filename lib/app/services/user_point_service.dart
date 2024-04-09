import 'dart:convert';
import 'package:enviroplus/app/models/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserPointService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<UserModel> updatePoinUser({
    int? point,
    required String id,
  }) async {
    var url = '$baseUrl/user/$id/point';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'point': point,
    });

    var response = await http.patch(
      body: body,
      headers: headers,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('Gagal Update');
    }
  }
}
