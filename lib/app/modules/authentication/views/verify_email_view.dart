import 'package:enviroplus/app/data/common/appbar/appbar.dart';
import 'package:enviroplus/app/data/common/custom_shape/header_container.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                TAppBar(
                  padding: 16,
                  title: Container(),
                  action: Container(),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Image(
                    image: AssetImage(TImages.verifyImage),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Text(
                  'Verifikasi Email Kamu',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: TColors.white,
                      ),
                ),
                Text(
                  'alzahfariski@gmail.com',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: TColors.white,
                      ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Cek pesan pada email anda. verifikasi email untuk mulai pernjalanan bersama enviro ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.white,
                      ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Kirim Ulang',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: TColors.primary,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
