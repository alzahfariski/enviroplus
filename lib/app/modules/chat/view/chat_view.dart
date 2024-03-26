import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(TImages.misi1),
            const SizedBox(
              height: 20,
            ),
            const Text('Belum Ada Chat'),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
