import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/home/controller/home_controller.dart';
import 'package:enviroplus/app/modules/home/widget/polutan_widget.dart';
import 'package:enviroplus/app/modules/leaderboard/view/leaderboard_view.dart';
import 'package:enviroplus/app/modules/location/view/location_view.dart';
import 'package:enviroplus/app/modules/poluttion/view/pollution_view.dart';
import 'package:enviroplus/utils/common_widgets/appbar.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final homeController = Get.put(HomeController());
  final authenticationController = Get.put(AuthenticationController());

  Future<void> _refreshData() async {
    await homeController.getGeo();
    await homeController.getLeaderboard();
    Get.forceAppUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
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
                      'Hi! ${authenticationController.user?.username != null ? authenticationController.user!.username : 'kesalahan'}',
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
              FutureBuilder(
                future: homeController.getGeo(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (homeController.air != null) {
                      return Column(
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
                            image: AssetImage(
                                homeController.pollutionImg.toString()),
                            width: 200,
                            height: 200,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Status Polusi',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                homeController.air!.airPollution!.quality!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      color: TColors.primary,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ListView.builder(
                              itemCount:
                                  homeController.air!.recommendation!.length > 2
                                      ? 2
                                      : homeController
                                          .air!.recommendation!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
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
                                  child: Text(
                                    homeController.air!.recommendation![index],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: TColors.darkContainer.withOpacity(0.8),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Indeks Polusi : ${homeController.air!.airPollution!.aqi}',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                                LinearPercentIndicator(
                                  width: MediaQuery.of(context).size.width - 50,
                                  animation: true,
                                  lineHeight: 10.0,
                                  animationDuration: 2500,
                                  percent: homeController.pollutionPrencent
                                      .toDouble(),
                                  barRadius: const Radius.circular(10),
                                  progressColor:
                                      homeController.colorStattus.value,
                                  backgroundColor:
                                      TColors.white.withOpacity(0.6),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: [
                                PolutanWIdget(
                                  angka: homeController
                                      .air!.airPollution!.components!.so2
                                      .toString(),
                                  nama: 'Dioksida Belerang',
                                  zat: 'SO\u2082',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                PolutanWIdget(
                                  angka: homeController
                                      .air!.airPollution!.components!.no2
                                      .toString(),
                                  nama: 'Dioksida Nitrogen',
                                  zat: 'NO\u2082',
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                PolutanWIdget(
                                  angka: homeController
                                      .air!.airPollution!.components!.pm10
                                      .toString(),
                                  nama: 'Particulate Matter',
                                  zat: 'PM\u2081\u2080',
                                ),
                              ],
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
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
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          Text(
                            "Tarik ke atas untuk refresh",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          Image.asset(
                            TImages.pollution1,
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Data polusi tidak tersedia",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      );
                    }
                  }
                  return const CircularProgressIndicator();
                },
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
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
              FutureBuilder(
                future: homeController.getLeaderboard(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeController.leaderboard.length > 3
                          ? 3
                          : homeController.leaderboard.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 0),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 4.0,
                        childAspectRatio: 0.6,
                      ),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: TColors.primary,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    homeController
                                        .leaderboard[index].avatarUrl!,
                                  ),
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
                                child: Column(
                                  children: [
                                    Text(
                                      '${homeController.leaderboard[index].username}',
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.black),
                                    ),
                                    Text(
                                      '${homeController.leaderboard[index].point} Poin',
                                      textAlign: TextAlign.left,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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
