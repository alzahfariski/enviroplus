import 'dart:convert';
import 'dart:io';

import 'package:enviroplus/app/models/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserUpdateService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<UserModel> updateUser({
    String? username,
    String? email,
    String? work,
    File? image,
    required String id,
  }) async {
    var url = '$baseUrl/user/$id/update';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var request = http.MultipartRequest('PATCH', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields['username'] = username ?? '';
    request.fields['email'] = email ?? '';
    request.fields['work'] = work ?? '';

    if (image != null) {
      var fileStream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'avatar',
        fileStream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    var response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('Gagal Update');
    }
  }
}
