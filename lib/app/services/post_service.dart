import 'dart:convert';

import 'package:enviroplus/app/models/post_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<List<PostModel>> getPost() async {
    var url = '$baseUrl/post';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['posts'];
      List<PostModel> posts = [];
      for (var item in data) {
        posts.add(PostModel.fromJson(item));
      }
      return posts;
    } else {
      throw Exception('Gagal get Post');
    }
  }
}
