import 'dart:convert';

import 'package:enviroplus/app/models/chat_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChatService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<List<ChatModel>> getChatList() async {
    var url = '$baseUrl/message/list';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['chats'];
      List<ChatModel> chat = [];
      for (var item in data) {
        chat.add(ChatModel.fromJson(item));
      }
      return chat;
    } else {
      throw Exception('Gagal get chat list');
    }
  }
}
