import 'package:enviroplus/app/modules/chat/controller/chat_controller.dart';
import 'package:enviroplus/app/modules/chat/view/chat_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.chatController,
  });

  final ChatController chatController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatController.chat.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => DetailChatView(
                  chatController: chatController,
                  index: index,
                ));
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(chatController.chat[index].receiver!.avatarUrl!),
            ),
            title: Text(chatController.chat[index].receiver!.username!),
            subtitle: Text(chatController.chat[index].content!),
          ),
        );
      },
    );
  }
}
