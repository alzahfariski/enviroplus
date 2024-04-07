import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isSeder = false,
    required this.messege,
  });

  final String messege;
  final bool isSeder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSeder ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isSeder ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSeder ? 10 : 0),
                      topRight: Radius.circular(!isSeder ? 10 : 0),
                      bottomLeft: const Radius.circular(10),
                      bottomRight: const Radius.circular(10),
                    ),
                    color: isSeder ? const Color(0xFFD1EEC9) : Colors.white,
                  ),
                  child: Text(
                    messege,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: TColors.black,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
