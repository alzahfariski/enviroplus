import 'package:enviroplus/app/modules/home/controller/home_controller.dart';
import 'package:enviroplus/app/modules/home/widget/polutan_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PollutionView extends StatelessWidget {
  const PollutionView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: TColors.primary,
          ),
        ),
        title: const Text('Polusi Udara'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                homeController.address.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Image(
                image: AssetImage(homeController.pollutionImg.toString()),
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Status Polusi',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    homeController.air!.airPollution!.quality!,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: TColors.darkContainer.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Indeks Polusi : ${homeController.air!.airPollution!.aqi!}',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2500,
                      percent: homeController.pollutionPrencent.toDouble(),
                      barRadius: const Radius.circular(10),
                      progressColor: homeController.colorStattus.value,
                      backgroundColor: TColors.white.withOpacity(0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Rekomendasi',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: homeController.air!.recommendation!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: TColors.primary,
                      ),
                    ),
                    child: Text(
                      homeController.air!.recommendation![index],
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Konsentrasi polutan dalam μg/m3',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  PolutanWIdget(
                    angka: homeController.air!.airPollution!.components!.so2
                        .toString(),
                    nama: 'Dioksida Belerang',
                    zat: 'SO\u2082',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: homeController.air!.airPollution!.components!.no2
                        .toString(),
                    nama: 'Dioksida Nitrogen',
                    zat: 'NO\u2082',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: homeController.air!.airPollution!.components!.pm10
                        .toString(),
                    nama: 'Partikel Udara 10',
                    zat: 'PM\u2081\u2080',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  PolutanWIdget(
                    angka: homeController.air!.airPollution!.components!.pm25
                        .toString(),
                    nama: 'Partikel Udara 2.5',
                    zat: 'PM\u2082\u2085',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: homeController.air!.airPollution!.components!.o3
                        .toString(),
                    nama: 'Ozon',
                    zat: 'O\u2083',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: homeController.air!.airPollution!.components!.co
                        .toString(),
                    nama: 'Karbon Monoksida',
                    zat: 'CO',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Ramalan Polusi Udara',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TColors.darkContainer.withOpacity(0.8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Sen',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Indeks Polusi',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width - 160,
                              animation: true,
                              leading: Text(
                                '1',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              trailing: Text(
                                '5',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              lineHeight: 10.0,
                              animationDuration: 2500,
                              percent: 0.2,
                              barRadius: const Radius.circular(10),
                              progressColor: TColors.accent,
                              backgroundColor: TColors.primary,
                            ),
                            Text(
                              'Status Polusi : Baik',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
