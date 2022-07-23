import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configurations/colors.dart';
import '../../configurations/theme_notifier.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundCOlor;

  ButtonWidget(
      {required this.text,
      required this.textColor,
      required this.backgroundCOlor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundCOlor, borderRadius: BorderRadius.circular(28)),
      height: 55,
      width: double.infinity,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16, color: textColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
