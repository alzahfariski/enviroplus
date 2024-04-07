import 'package:enviroplus/app/models/airpollution_model.dart';
import 'package:enviroplus/app/services/airpollution_service.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  RxString address = 'Belum Ada Lokasi'.obs;
  RxString pollutionImg = TImages.pollution1.obs;

  PolusiUdara? _air;

  PolusiUdara? get air => _air;

  set air(PolusiUdara? airData) {
    _air = airData;
    update();
  }

  Future<void> getGeo(double lat, double lng) async {
    try {
      air = await AirService().getAir(lat.toString(), lng.toString());
      findStatus(air!.airPollution!.aqi!);

      await getAddressFromLatLng(lat, lng);
    } catch (e) {
      throw Exception('Error getting geo: $e');
    }
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        address.value = "${place.administrativeArea}";
        update();
      }
    } catch (e) {
      throw ('Error getting address: $e');
    }
  }

  void findStatus(int aqi) {
    if (aqi == 1) {
      pollutionImg.value = TImages.pollution1;
    }
    if (aqi == 2) {
      pollutionImg.value = TImages.pollution2;
    }
    if (aqi == 3) {
      pollutionImg.value = TImages.pollution3;
    }
    if (aqi == 4) {
      pollutionImg.value = TImages.pollution4;
    }
    if (aqi == 5) {
      pollutionImg.value = TImages.pollution5;
    }
  }
}
