import 'package:enviroplus/app/data/common/custom_shape/header_container.dart';
import 'package:enviroplus/app/data/common/appbar/appbar.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      image: AssetImage(TImages.loginImage),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: Text(
                        'Username',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.primary,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: Text(
                        'Password',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.primary,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Lupa password ?',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: TColors.primary,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Masuk',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.dark,
                                ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Daftar',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
      ),
    );
  }
}
