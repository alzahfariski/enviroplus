import 'package:enviroplus/app/modules/leaderboard/view/leaderboard_view.dart';
import 'package:enviroplus/app/modules/location/view/location_view.dart';
import 'package:enviroplus/app/modules/poluttion/view/pollution_view.dart';
import 'package:enviroplus/utils/common_widgets/appbar.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(
              padding: 12,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    'Hi! Alzah Fariski',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              action: IconButton(
                onPressed: () => Get.to(() => const LocationView()),
                icon: const Icon(Icons.air_outlined),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
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
            Padding(
              padding: const EdgeInsets.all(12),
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 10,
                animation: true,
                animationDuration: 2500,
                percent: 0.6,
                center: const Padding(
                  padding: EdgeInsets.all(40),
                  child: Image(
                    image: AssetImage(TImages.pollution1),
                  ),
                ),
                backgroundColor: TColors.primary,
                progressColor: Colors.blue,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Indeks polusi :',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '1',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Status polusi :',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Baik',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: TColors.primary,
                      ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: TColors.primary,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Gunakan Masker',
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => Get.to(() => const PollutionView()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selengkapnya',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.arrow_circle_right_rounded,
                    color: TColors.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: GestureDetector(
                onTap: () => Get.to(() => const LeaderboardView()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Leaderboard',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: TColors.primary,
                          ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: TColors.primary,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 4.0,
                childAspectRatio: 0.6,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: TColors.primary,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/pollution/lead.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: TColors.primary,
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Alzah Fariski\n87 Points',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
