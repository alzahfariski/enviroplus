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
              const Text('Penghargaan Berbasis Poin'),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: TColors.accent,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Penghargaan Berbasis Misi'),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: TColors.accent,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
