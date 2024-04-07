import 'package:enviroplus/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:enviroplus/app/modules/home/view/change_profil_option/change_profile_modal_bottom_sheet.dart';
import 'package:enviroplus/app/modules/home/widget/textfield_profil_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authenticationController = Get.put(AuthenticationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: TColors.primary.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                              image: NetworkImage(
                                authenticationController.user?.avatarUrl
                                            .toString() !=
                                        null
                                    ? authenticationController.user!.avatarUrl
                                        .toString()
                                    : 'https://firebasestorage.googleapis.com/v0/b/enviro-db8b4.appspot.com/o/assets%2Fdefault-avatar.png?alt=media&token=f45d5e8d-eab3-4c92-bec8-b771ff6cc26d',
                              ),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              width: 4,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: TColors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () =>
                                ChangeProfilScreen.buildShowModalBottomSheet(
                                    context, size),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                Icons.create,
                                size: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Profil Anda',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldProfil(
                title: 'Nama',
                value:
                    authenticationController.user?.username.toString() != null
                        ? authenticationController.user!.username.toString()
                        : 'Kesalahan',
              ),
              TextFieldProfil(
                title: 'Email',
                value: authenticationController.user?.email.toString() != null
                    ? authenticationController.user!.email.toString()
                    : 'Kesalahan',
              ),
              TextFieldProfil(
                title: 'Pekerjaan',
                value: authenticationController.user?.work.toString() != null
                    ? authenticationController.user!.work.toString()
                    : 'Kesalahan',
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                ),
                icon: const Icon(
                  Icons.save,
                  color: TColors.black,
                ),
                label: Text(
                  'Simpan',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: TColors.black,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () {
          authenticationController.logout();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
        ),
        icon: const Icon(
          Icons.logout_rounded,
          color: TColors.white,
        ),
        label: Text(
          'Keluar',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: TColors.white,
              ),
        ),
      ),
    );
  }
}
