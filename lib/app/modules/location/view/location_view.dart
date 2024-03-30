import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: TColors.darkContainer,
                  ),
                  child: const ListTile(
                    leading: Icon(
                      Icons.air_outlined,
                    ),
                    title: Text('Bengkulu'),
                    subtitle: Text(
                      'Indeks Pollusi : 1',
                    ),
                    trailing: Text(
                      'Baik',
                      style: TextStyle(
                        color: TColors.primary,
                      ),
                    ),
                  ),
                ));
          },
        ));
  }
}
