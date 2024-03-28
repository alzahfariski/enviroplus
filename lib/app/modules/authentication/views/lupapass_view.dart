import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LupaPassView extends StatelessWidget {
  const LupaPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(TImages.verifyImage),
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
                color: TColors.dark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(
                    top: BorderSide(
                  width: 2,
                  color: TColors.primary,
                ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lupa Password ?',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: TColors.white,
                      ),
                ),
                Text(
                  'Silahkan masukan email yang telah terdaftar',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.white,
                        fontSize: 12,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Cek pesan pada email anda. verifikasi email untuk mengganti password ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: TColors.white,
                          fontSize: 12,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Ganti Password',
                    style: Theme.of(context).textTheme.bodyMedium,
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
