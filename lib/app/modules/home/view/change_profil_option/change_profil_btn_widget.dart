import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ChangeProfilBtnWidget extends StatelessWidget {
  const ChangeProfilBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.onTap,
    super.key,
  });

  final IconData btnIcon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: TColors.dark,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 40.0,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
