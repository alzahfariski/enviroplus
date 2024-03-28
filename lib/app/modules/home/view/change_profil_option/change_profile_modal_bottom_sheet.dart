import 'package:enviroplus/app/modules/home/view/change_profil_option/change_profil_btn_widget.dart';
import 'package:flutter/material.dart';

class ChangeProfilScreen {
  static Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, Size size) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(30),
        height: size.height * 0.28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ganti Foto Profil',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Pilih opsi Ganti Profil',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChangeProfilBtnWidget(
                  btnIcon: Icons.camera,
                  title: 'Kamera',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ChangeProfilBtnWidget(
                  btnIcon: Icons.folder,
                  title: 'File',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
