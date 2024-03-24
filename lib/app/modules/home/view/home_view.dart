import 'package:enviroplus/app/modules/home/widget/cuaca_widget.dart';
import 'package:enviroplus/app/modules/location/view/location_view.dart';
import 'package:enviroplus/utils/common_widgets/appbar.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                icon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Status polusi udara',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Buruk',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: TColors.primary,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Image(
              image: AssetImage(TImages.pollution1),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 7.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: TColors.primary,
                      ),
                    ),
                    child: Text(
                      'Gunakan Masker',
                      style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'cek kualitas udara',
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
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bengkulu',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: TColors.dark,
                                    fontSize: 14,
                                  ),
                        ),
                        Text(
                          '28\u00B0',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: TColors.dark,
                                    fontSize: 40,
                                  ),
                        ),
                        const Icon(
                          Icons.cloud,
                          color: TColors.dark,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_upward,
                              color: TColors.dark,
                              size: 10,
                            ),
                            Text(
                              '17\u00B0',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: TColors.dark,
                                    fontSize: 8,
                                  ),
                            ),
                            const Icon(
                              Icons.arrow_downward,
                              color: TColors.dark,
                              size: 10,
                            ),
                            Text(
                              '10\u00B0',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    color: TColors.dark,
                                    fontSize: 8,
                                  ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const CuacaWidget(),
                    const CuacaWidget(),
                    const CuacaWidget(),
                    const CuacaWidget(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
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
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
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
