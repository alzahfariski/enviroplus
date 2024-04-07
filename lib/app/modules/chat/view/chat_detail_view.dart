import 'package:enviroplus/app/modules/chat/controller/chat_controller.dart';
import 'package:enviroplus/app/modules/chat/widget/chat_bubble.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailChatView extends StatelessWidget {
  const DetailChatView({
    super.key,
    required this.chatController,
    required this.index,
  });

  final ChatController chatController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: TColors.primary,
          ),
        ),
        centerTitle: false,
        title: Row(
          children: [
            Image.network(
              chatController.chat[index].receiver!.avatarUrl!,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              chatController.chat[index].receiver!.username!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: TColors.primary,
                  ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: chatController.getChatRoom(chatController.chat[index].sId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  itemCount: chatController.chatData?.messages?.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      isSeder:
                          chatController.chatData!.messages![index].isSender!,
                      messege:
                          chatController.chatData!.messages![index].content!,
                    );
                  },
                ),
                Positioned(
                  // Position the input field at the bottom
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45.0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: TColors.primary,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: chatController.content,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: TColors.black,
                                    ),
                                decoration: InputDecoration.collapsed(
                                  hintText: 'Tulis Pesan ...',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: TColors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: TColors.primary,
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            chatController.handleNewChat(
                              chatController.chat[index].receiver!.id!,
                            );
                          },
                          child: const Icon(
                            Icons.send,
                            color: TColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
