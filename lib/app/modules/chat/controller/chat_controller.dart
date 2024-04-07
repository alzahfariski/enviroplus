import 'package:enviroplus/app/models/chat_model.dart';
import 'package:enviroplus/app/models/chat_room_model.dart';
import 'package:enviroplus/app/services/chat_new_service.dart';
import 'package:enviroplus/app/services/chat_room_service.dart';
import 'package:enviroplus/app/services/chat_service.dart';
import 'package:enviroplus/utils/loaders/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  static ChatController get instance => Get.find();

  List<ChatModel> _chats = [];

  List<ChatModel> get chat => _chats;

  set chat(List<ChatModel> chat) {
    _chats = chat;
    update();
  }

  Future<void> getChatList() async {
    try {
      List<ChatModel> chats = await ChatService().getChatList();
      _chats = chats;
    } catch (e) {
      throw Exception(e);
    }
  }

  ChatRoom? _chatRoom;

  ChatRoom? get chatData => _chatRoom;

  set chatData(ChatRoom? chatData) {
    _chatRoom = chatData;
    update();
  }

  Future<void> getChatRoom(String idChat) async {
    try {
      chatData = await ChatRoomService().getChatList(idChat);
      _chatRoom = chatData;
    } catch (e) {
      throw Exception(e);
    }
  }

  TextEditingController content = TextEditingController();

  Future<bool> newChat({
    required String content,
    required String id,
  }) async {
    try {
      await NewChatService().newChat(content, id);

      update();
      return true;
    } catch (e) {
      return false;
    }
  }

  void handleNewChat(String id) async {
    try {
      await newChat(content: content.text, id: id);
      content.clear();
      Get.forceAppUpdate();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'ada kesalahan !', message: e.toString());
    }
  }
}
