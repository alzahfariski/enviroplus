import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/home/controller/home_controller.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final authenticationController = Get.put(AuthenticationController());
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
              itemCount: homeController.leaderboard.length,
              itemBuilder: (context, index) {
                int num = index + 1;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    title:
                        Text("${homeController.leaderboard[index].username}"),
                    leading: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  homeController.leaderboard[index].avatarUrl!),
                            ),
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
                      '${homeController.leaderboard[index].point}',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: TColors.primary,
                          ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 120,
            ),
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
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(authenticationController.user!.avatarUrl!),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Text(
                  authenticationController.user!.username!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.black,
                      ),
                ),
              ),
              Text(
                '${authenticationController.user?.point} Poin',
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
