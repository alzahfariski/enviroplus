import 'dart:convert';
import 'dart:io';

import 'package:enviroplus/app/models/new_post_model.dart';
import 'package:enviroplus/app/models/post_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<NewPostModel> newPost(
      {String? title,
      String? price,
      String? bodys,
      String? addres,
      File? image}) async {
    var url = '$baseUrl/post';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields['title'] = title ?? '';
    request.fields['price'] = price ?? '';
    request.fields['body'] = bodys ?? '';
    request.fields['addres'] = addres ?? '';

    if (image != null) {
      var fileStream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'image',
        fileStream,
        length,
        filename: image.path.split('/').last,
      );
      request.files.add(multipartFile);
    }
    var response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      NewPostModel newPost = NewPostModel.fromJson(data['post']);

      return newPost;
    } else {
      throw Exception('Gagal Post');
    }
  }

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
