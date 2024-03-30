import 'package:enviroplus/app/modules/badge/widget/badge_widget.dart';
import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Total Poin',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: TColors.primary,
                    ),
              ),
              Text(
                '20',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: TColors.primary,
                      fontSize: 64,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              const BadgeWidget(
                title: 'Penghargaan',
              ),
              const SizedBox(
                height: 20,
              ),
              const BadgeWidget(
                title: 'Pencapain Misi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
