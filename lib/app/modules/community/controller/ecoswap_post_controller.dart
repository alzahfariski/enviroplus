import 'dart:io';

import 'package:get/get.dart';

class EcoSwapPostController extends GetxController {
  static EcoSwapPostController get instance => Get.find();

  File? selectedImage;

  void savePlace() {
    if (selectedImage == null) {
      return;
    }

    Get.back();
  }
}
