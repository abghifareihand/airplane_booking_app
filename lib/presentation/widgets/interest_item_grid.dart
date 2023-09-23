import 'package:airplane_booking_app/common/constants.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String text;
  const InterestItem({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          Text(
            text,
            style: blackTextStyle,
          )
        ],
      ),
    );
  }
}
