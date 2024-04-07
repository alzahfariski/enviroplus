import 'package:enviroplus/app/modules/location/controller/location_controller.dart';
import 'package:enviroplus/app/modules/location/widget/location_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final locationController = Get.put(LocationController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: TColors.primary,
          ),
        ),
        title: const Text('Kondisi Polusi'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          child: Column(
            children: [
              LocationWidget(
                locationController: locationController,
                lat: -3.51868,
                lng: 102.53598,
              ),
              const SizedBox(
                height: 20,
              ),
              LocationWidget(
                locationController: locationController,
                lat: 0.65557,
                lng: 124.09015,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              LocationWidget(
                locationController: locationController,
                lat: -7.7715616,
                lng: 110.3728291,
              ),
              const SizedBox(
                height: 20,
              ),
              LocationWidget(
                locationController: locationController,
                lat: -6.1753924,
                lng: 106.8271528,
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
