import 'package:enviroplus/app/modules/community/controller/community_controller.dart';
import 'package:enviroplus/app/modules/community/view/ecoswap_detail_view.dart';
import 'package:enviroplus/app/modules/community/view/ecoswap_post_view.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityView extends StatelessWidget {
  CommunityView({super.key});

  final communityController = Get.put(CommunityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: communityController.getPost(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: communityController.post.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(() => EcoSwapDeatilView(
                              index: index,
                              communityController: communityController,
                            )),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 10,
                          ),
                          width: double.infinity,
                          height: 280,
                          decoration: BoxDecoration(
                            color: TColors.darkContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ListTile(
                                title: Text(
                                  communityController.post[index].title!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  "Rp. ${communityController.post[index].price}",
                                  style: Theme.of(context).textTheme.labelLarge,
                                  maxLines: 1,
                                ),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Post By',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    Text(
                                      communityController
                                          .post[index].userPost!.username!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                    Text(
                                      communityController.post[index].createdAt
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: TColors.primary.withOpacity(0.8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          communityController
                                              .post[index].imageUrl!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 58,
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      communityController.post[index].body!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: CircularProgressIndicator(),
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
      floatingActionButton: GestureDetector(
        onTap: () => Get.to(() => const EcoSwapPostView()),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: TColors.primary,
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.white),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
