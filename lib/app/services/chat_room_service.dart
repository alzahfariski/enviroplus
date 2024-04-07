import 'dart:convert';

import 'package:enviroplus/app/models/chat_room_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ChatRoomService {
  String baseUrl = "https://enviro-api-nu.vercel.app/api/v1";

  Future<ChatRoom> getChatList(String idChat) async {
    var url = '$baseUrl/message/$idChat';
    final box = GetStorage();
    String token = box.read('usertoken');
    var headers = {'Authorization': token};

    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body)['data'];
      ChatRoom chatRoom = ChatRoom.fromJson(data);
      return chatRoom;
    } else {
      throw Exception('Gagal get chat room');
    }
  }
}
