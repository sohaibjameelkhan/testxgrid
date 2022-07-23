import 'package:flutter/material.dart';

import '../../configurations/colors.dart';

class testCardWidget extends StatelessWidget {
  final String text;
  final Icon icon;

  testCardWidget({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(23)),
        height: 55,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  icon,
                  // Icon(
                  //   Icons.privacy_tip_outlined,
                  //   size: 28,
                  // ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
