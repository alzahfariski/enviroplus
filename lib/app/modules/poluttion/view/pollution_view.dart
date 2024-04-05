import 'package:enviroplus/app/modules/home/widget/polutan_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PollutionView extends StatelessWidget {
  const PollutionView({super.key});

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
        title: const Text('Polusi Udara'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Text(
                'Bengkulu',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Image(
                image: AssetImage(TImages.pollution1),
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
                    'Baik',
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
                      'Indeks Polusi : 1',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2500,
                      percent: 0.2,
                      barRadius: const Radius.circular(10),
                      progressColor: TColors.accent,
                      backgroundColor: TColors.primary,
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
                itemCount: 4,
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
                      'Silahkan Beraktivitas',
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
              const Row(
                children: [
                  PolutanWIdget(
                    angka: '0.640',
                    nama: 'Sulfur Duioksida',
                    zat: 'SO\u2082',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: '0.640',
                    nama: 'Sulfur Duioksida',
                    zat: 'SO\u2082',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: '0.640',
                    nama: 'Sulfur Duioksida',
                    zat: 'SO\u2082',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  PolutanWIdget(
                    angka: '0.640',
                    nama: 'Sulfur Duioksida',
                    zat: 'SO\u2082',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: '0.640',
                    nama: 'Sulfur Duioksida',
                    zat: 'SO\u2082',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PolutanWIdget(
                    angka: '0.640',
                    nama: 'Sulfur Duioksida',
                    zat: 'SO\u2082',
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
