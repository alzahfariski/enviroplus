import 'dart:convert';

import 'package:enviroplus/app/models/chat_new_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NewChatService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<NewChatModel> newChat(
    String content,
    String id,
  ) async {
    var url = '$baseUrl/message/$id/new';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'content': content,
    });

    var response = await http.post(
      body: body,
      headers: headers,
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      NewChatModel newChat = NewChatModel.fromJson(data);

      return newChat;
    } else {
      throw Exception('Gagal Chat');
    }
  }
}
