import 'package:enviroplus/app/modules/chat/controller/chat_controller.dart';
import 'package:enviroplus/app/modules/chat/widget/chat_list.dart';
import 'package:enviroplus/app/modules/chat/widget/nothing_chat.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    return FutureBuilder(
      future: chatController.getChatList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: chatController.chat.isNotEmpty
                ? ChatList(
                    chatController: chatController,
                  )
                : const NothingChat(),
          );
        }
        return const Scaffold(
          backgroundColor: TColors.dark,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
