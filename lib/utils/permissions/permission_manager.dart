import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager extends GetxController {
  static PermissionManager get instance => Get.find();

  @override
  void onInit() async {
    // lokasi
    await Permission.location.request();
    initPlatformState();
    super.onInit();
  }

  void initPlatformState() async {
    try {
      var statusLoc = await Permission.location.status;
      if (!statusLoc.isGranted) {
        statusLoc = await Permission.location.request();
        if (!statusLoc.isGranted) {
          return;
        }
      }
    } catch (e) {
      throw ('Error initializing platform state: $e');
    }
  }
}
