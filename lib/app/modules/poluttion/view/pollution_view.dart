import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                'Kabupaten Bengkulu',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              const Image(
                image: AssetImage(TImages.pollution2),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Good',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Udara Bebas Polusi',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(DateTime.now().toString()),
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
                    ),
                    LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width - 50,
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2500,
                      percent: 0.6,
                      barRadius: const Radius.circular(10),
                      progressColor: Colors.blue,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Konsentrasi polutan dalam μg/m3',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 6,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: TColors.darkContainer.withOpacity(0.8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '0;20',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                color: TColors.primary,
                              ),
                        ),
                        Text(
                          'Sulfur Dioksida',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Perkiraan data polusi udara',
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
                              progressColor: Colors.blue,
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
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
