import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class EcoSwapPostController extends GetxController {
  static EcoSwapPostController get instance => Get.find();

  File? selectedImage;

  void savePlace() {
    path.basename(selectedImage!.path);
  }
}
