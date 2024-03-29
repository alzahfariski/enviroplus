import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldProfil extends StatelessWidget {
  const TextFieldProfil({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: TColors.white,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: TColors.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                width: 1,
                color: TColors.primary,
              ),
            ),
            hintText: value, // Menggunakan labelText alih-alih label
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: TColors.white,
                ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
