import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class AppHeading extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;

  const AppHeading(
      {super.key,
      required this.text,
      this.color = AppColors.appColorBlack,
      this.fontWeight = FontWeight.w600,
      this.fontSize = 20.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          overflow: TextOverflow.ellipsis),
    );
  }
}
