import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager extends GetxController {
  static PermissionManager get instance => Get.find();

  Position? position;
  String? address;

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

      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      if (position != null) {
        await getAddressFromLatLng(position!.latitude, position!.longitude);
      }
    } catch (e) {
      throw ('Error initializing platform state: $e');
    }
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address = "${place.locality}";
        update();
      }
    } catch (e) {
      throw ('Error getting address: $e');
    }
  }
}
