import 'package:enviroplus/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CuacaWidget extends StatelessWidget {
  const CuacaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 160,
      decoration: BoxDecoration(
        color: TColors.accent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.cloud,
              color: TColors.accent,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Humidity',
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 10,
                ),
          ),
          Text(
            '36,1 %',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
