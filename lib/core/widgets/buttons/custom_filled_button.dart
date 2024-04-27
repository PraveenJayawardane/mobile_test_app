import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final Function clickEvent;
  final Color bgColor;
  final Color textColor;
  final double height;
  final double? width;
  final double radius;
  final double fontSize;
  final bool? btnController;
  final Color? disableColor;

  const CustomFilledButton(
      {super.key,
      required this.text,
      required this.clickEvent,
      this.bgColor = AppColors.appColorLightBlue,
      this.textColor = AppColors.appColorWhite,
      this.height = 50.0,
      this.width,
      this.btnController,
      this.disableColor = AppColors.appColorBlack,
      this.radius = 6.0,
      this.fontSize = 14.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: SizedBox(
          height: height,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(textColor),
                  backgroundColor:
                      btnController == null || btnController == true
                          ? MaterialStateProperty.all<Color>(bgColor)
                          : MaterialStateProperty.all<Color>(
                              AppColors.appColorLightGray),
                  elevation: MaterialStateProperty.all(10),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius),
                          side: const BorderSide(color: Colors.transparent)))),
              onPressed: btnController ?? true
                  ? () {
                      clickEvent();
                    }
                  : null,
              child: Text(text,
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.w500)))),
    );
  }
}
