import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class BorderedButton extends StatelessWidget {
  final String text;
  final Function clickEvent;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? radius;
  final double? fontSize;
  Color? backgroundColor;
  BorderedButton(
      {Key? key,
      required this.text,
      required this.clickEvent,
      this.borderColor = AppColors.appColorBlack,
      this.textColor = AppColors.appColorBlack,
      this.height = 50.0,
      this.backgroundColor,
      this.width,
      this.radius = 6.0,
      this.fontSize = 14.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(textColor!),
              backgroundColor: MaterialStateProperty.all<Color>(
                  backgroundColor ?? AppColors.appColorWhite),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!),
              ))),
          onPressed: () {
            clickEvent();
          },
          child: Text(text, style: TextStyle(fontSize: fontSize))),
    );
  }
}
