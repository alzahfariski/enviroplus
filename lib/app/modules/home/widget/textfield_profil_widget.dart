import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TextFieldProfil extends StatelessWidget {
  const TextFieldProfil({
    super.key,
    required this.title,
    required this.value,
    required this.controller,
  });

  final String title;
  final String value;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          expands: false,
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
            labelText: title, // Menggunakan labelText alih-alih label
            labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
