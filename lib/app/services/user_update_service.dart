import 'dart:convert';

import 'package:enviroplus/app/models/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserUpdateService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<UserModel> updateUser({
    String? username,
    String? email,
    String? work,
    required String id,
  }) async {
    var url = '$baseUrl/user/$id/update';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'work': work,
      'username': username,
    });

    var response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: body,
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
