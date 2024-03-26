import 'package:enviroplus/utils/constants/colors.dart';
import 'package:enviroplus/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isSeder = false,
    this.hasProduct = false,
    required this.messege,
  });

  final String messege;
  final bool isSeder;
  final bool hasProduct;

  Widget productPriview() {
    return Container(
      width: 230,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isSeder ? 10 : 0),
          topRight: Radius.circular(!isSeder ? 10 : 0),
          bottomLeft: const Radius.circular(10),
          bottomRight: const Radius.circular(10),
        ),
        color: isSeder ? const Color(0xFFD1EEC9) : Colors.white,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              TImages.productImage1,
              width: 74,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Komputer Gaming',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp 2.000.000',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment:
            isSeder ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          hasProduct ? productPriview() : const SizedBox(),
          Row(
            mainAxisAlignment:
                isSeder ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(isSeder ? 10 : 0),
                      topRight: Radius.circular(!isSeder ? 10 : 0),
                      bottomLeft: const Radius.circular(10),
                      bottomRight: const Radius.circular(10),
                    ),
                    color: isSeder ? const Color(0xFFD1EEC9) : Colors.white,
                  ),
                  child: Text(
                    messege,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: TColors.black,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
