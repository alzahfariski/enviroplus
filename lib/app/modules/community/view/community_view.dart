import 'package:enviroplus/app/modules/chat/view/chat_detail_view.dart';
import 'package:enviroplus/app/modules/community/view/ecoswap_detail_view.dart';
import 'package:enviroplus/app/modules/community/view/ecoswap_post_view.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Get.to(() => const EcoSwapDeatilView()),
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
                            'Komputer Gaming',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          subtitle: Text(
                            'Rp. 2000.000.000',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Post By',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                'Alzah Fariski',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                '2 Mei 2024',
                                style: Theme.of(context).textTheme.labelLarge,
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
                                image: const DecorationImage(
                                  image: AssetImage(
                                    TImages.productImage1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 240,
                                  height: 58,
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Lorem ipsum is a dummy text without any sense asdwasdwasdwasdw. It is a sequence of Latin',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      Get.to(() => const DetailChatView()),
                                  icon: const Icon(
                                    Icons.message,
                                    color: TColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
