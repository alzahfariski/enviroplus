import 'package:enviroplus/app/modules/community/controller/ecoswap_post_controller.dart';
import 'package:enviroplus/app/modules/community/widgets/image_input.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoSwapPostView extends StatelessWidget {
  const EcoSwapPostView({super.key});

  @override
  Widget build(BuildContext context) {
    final ecoSwapPostController = Get.put(EcoSwapPostController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: TColors.primary,
          ),
        ),
        title: const Text('Posting Barang'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: ecoSwapPostController.title,
              decoration: const InputDecoration(
                labelText: 'Nama',
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(
              onPickImage: (image) {
                ecoSwapPostController.selectedImage = image;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: ecoSwapPostController.price,
              decoration: const InputDecoration(
                labelText: 'Harga',
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: ecoSwapPostController.address,
              decoration: const InputDecoration(
                labelText: 'Alamat',
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: ecoSwapPostController.bodys,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton.icon(
              onPressed: () {
                ecoSwapPostController.newPost();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TColors.primary,
              ),
              icon: const Icon(
                Icons.sell,
                color: TColors.black,
              ),
              label: Text(
                'Tawarkan Barang',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: TColors.black,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
