import 'package:enviroplus/app/modules/badge/widget/badge_widget.dart';
import 'package:flutter/material.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BadgeWidget(
                title: 'Penhargaan',
              ),
              SizedBox(
                height: 20,
              ),
              BadgeWidget(
                title: 'Pencapain Misi',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
