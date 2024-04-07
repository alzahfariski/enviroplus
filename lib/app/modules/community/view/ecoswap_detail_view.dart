import 'package:enviroplus/app/modules/community/controller/community_controller.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoSwapDeatilView extends StatelessWidget {
  const EcoSwapDeatilView({
    super.key,
    required this.index,
    required this.communityController,
  });

  final int index;
  final CommunityController communityController;

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
        title: Text(communityController.post[index].title!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                communityController.post[index].imageUrl!,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        communityController.post[index].title!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: TColors.primary,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        communityController.post[index].price!.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Keterangan',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    communityController.post[index].body!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Pemosting',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text(
                      communityController.post[index].userPost!.username!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      communityController.post[index].createdAt.toString(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          communityController.handleNewChat(
            communityController.post[index].userPost!.id!,
            communityController.post[index].title!,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: TColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.message,
            color: TColors.black,
          ),
        ),
      ),
    );
  }
}
