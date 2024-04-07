import 'package:enviroplus/app/models/airpollution_model.dart';
import 'package:enviroplus/app/models/leaderboard_model.dart';
import 'package:enviroplus/app/services/airpollution_service.dart';
import 'package:enviroplus/app/services/leaderboard_service.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  Position? position;
  RxString address = 'Belum Ada Lokasi'.obs;
  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;

  RxString pollutionImg = TImages.pollution1.obs;
  RxDouble pollutionPrencent = 0.0.obs;
  Rx<Color> colorStattus = const Color(0xff246AFE).obs;

  PolusiUdara? _air;

  PolusiUdara? get air => _air;

  set air(PolusiUdara? airData) {
    _air = airData;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getLeaderboard();
    getGeo();
  }

  List<LeaderboardModel> _leaderboards = [];

  List<LeaderboardModel> get leaderboard => _leaderboards;

  set leaderboard(List<LeaderboardModel> leaderboard) {
    _leaderboards = leaderboard;
    update();
  }

  Future<void> getLeaderboard() async {
    try {
      List<LeaderboardModel> leaderboards =
          await LeaderboardService().getLeaderboard();
      _leaderboards = leaderboards;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getGeo() async {
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
        lat.value = position!.latitude;
        lng.value = position!.longitude;

        air = await AirService()
            .getAir(lat.value.toString(), lng.value.toString());
        findStatus(air!.airPollution!.aqi!);

        await getAddressFromLatLng(position!.latitude, position!.longitude);
      }
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
      pollutionPrencent.value = 0.2;
      colorStattus.value = const Color(0xff3A82ED);
    }
    if (aqi == 2) {
      pollutionImg.value = TImages.pollution2;
      pollutionPrencent.value = 0.4;
      colorStattus.value = const Color(0xff3A82ED);
    }
    if (aqi == 3) {
      pollutionImg.value = TImages.pollution3;
      pollutionPrencent.value = 0.6;
      colorStattus.value = const Color(0xff82F94A);
    }
    if (aqi == 4) {
      pollutionImg.value = TImages.pollution4;
      pollutionPrencent.value = 0.8;
      colorStattus.value = const Color(0xffFB3737);
    }
    if (aqi == 5) {
      pollutionImg.value = TImages.pollution5;
      pollutionPrencent.value = 0.9;
      colorStattus.value = const Color(0xff000000);
    }
  }
}
