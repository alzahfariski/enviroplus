import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class NothingChat extends StatelessWidget {
  const NothingChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
