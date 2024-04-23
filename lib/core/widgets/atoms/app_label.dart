import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class AppLabel extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double fontSize;
  final TextOverflow? textOverflow;
  final FontStyle? fontStyle;
  final TextAlign? textAlign;

  const AppLabel(
      {Key? key,
      required this.text,
      this.textColor = AppColors.appColorBlack,
      this.fontSize = 16.0,
      this.fontStyle,
      this.textAlign,
      this.textOverflow,
      this.fontWeight = FontWeight.w500})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: 3,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontStyle: fontStyle,
      ),
    );
  }
}
