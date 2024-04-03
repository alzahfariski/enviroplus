import 'dart:convert';

import 'package:enviroplus/app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<UserModel> register({
    String? username,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/account/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String? username,
    String? password,
  }) async {
    var url = '$baseUrl/account/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'emailOrUsername': username,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ${data['token']}';

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
