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
                int num = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title: const Text("Nama"),
                    leading: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: TColors.accent,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        num <= 3
                            ? Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: TColors.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      num.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                            color: TColors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    trailing: Text(
                      '80 pts',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: TColors.primary,
                          ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Card(
        elevation: 1,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        color: TColors.primary,
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                '100',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: TColors.black,
                    ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: TColors.accent,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  "Anda",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.black,
                      ),
                ),
              ),
              Text(
                'Poin',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: TColors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
