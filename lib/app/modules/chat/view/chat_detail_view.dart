import 'package:enviroplus/app/modules/chat/widget/chat_bubble.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailChatView extends StatelessWidget {
  const DetailChatView({super.key});

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
            Image.asset(
              TImages.user,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              'Alzah Fariski',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: TColors.primary,
                  ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        children: const [
          ChatBubble(
            isSeder: true,
            hasProduct: true,
            messege: 'Hi!, Alzah Fariski',
          ),
          ChatBubble(
            isSeder: false,
            messege:
                'Hi!, Pembeli apakah kamu mau beli apa hanya tanya tanya saja ?',
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 225,
              height: 74,
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: TColors.primary.withOpacity(0.2),
                border: Border.all(
                  color: TColors.primary,
                ),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      TImages.productImage1,
                      width: 64,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Komputer Gaming',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Rp 2.000.000',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: TColors.primary,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.close,
                      color: TColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Tulis Pesan ...',
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: TColors.black,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.send,
                    color: TColors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
