import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PolutanWIdget extends StatelessWidget {
  const PolutanWIdget({
    super.key,
    required this.angka,
    required this.zat,
    required this.nama,
  });

  final String zat;
  final String angka;
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: TColors.primary,
        ),
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              zat,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: TColors.dark,
                  ),
            ),
            Text(
              angka,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: TColors.dark,
                    fontSize: 18,
                  ),
            ),
            Text(
              nama,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: TColors.dark,
                    fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
