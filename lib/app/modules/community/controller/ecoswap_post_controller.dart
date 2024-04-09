import 'dart:io';

import 'package:enviroplus/app/services/post_service.dart';
import 'package:enviroplus/utils/loaders/loaders.dart';
import 'package:enviroplus/utils/popup/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EcoSwapPostController extends GetxController {
  static EcoSwapPostController get instance => Get.find();

  File? selectedImage;
  final title = TextEditingController();
  final price = TextEditingController();
  final bodys = TextEditingController();
  final address = TextEditingController();

  Future<void> newPost() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are processing your information', 'assets/lottie/loader.json');
      if (selectedImage == null) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'oh snap!', message: ('Please select an image'));
      }

      // Panggil service untuk membuat posting baru
      final postService = PostService();
      await postService.newPost(
        title: title.text,
        price: price.text,
        bodys: bodys.text,
        addres: address.text,
        image: selectedImage,
      );

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'selamat', message: 'Post dibuat');

      // Reset pilihan gambar setelah posting berhasil
      selectedImage = null;
      update();
      Get.back();
    } catch (e) {
      selectedImage = null;
      update();
      TFullScreenLoader.stopLoading();
      Get.back();
      Get.forceAppUpdate();
    }
  }
}
