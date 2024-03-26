import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: TColors.primary,
          ),
        ),
        title: const Text('Ranking'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(TImages.ranking),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: const Text("Nama"),
                  leading: const CircleAvatar(),
                  trailing: Text(
                    '80 pts',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
