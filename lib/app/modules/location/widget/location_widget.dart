import 'package:enviroplus/app/modules/location/controller/location_controller.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.locationController,
    required this.lat,
    required this.lng,
  });

  final LocationController locationController;
  final double lat;
  final double lng;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: TColors.darkContainer,
      ),
      child: FutureBuilder(
        future: locationController.getGeo(lat, lng),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      locationController.pollutionImg.value,
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locationController.address.value,
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                'Indeks Polusi',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                locationController.air!.airPollution!.aqi
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: TColors.primary,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Status',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                locationController.air!.airPollution!.quality!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: TColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
          return const Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
