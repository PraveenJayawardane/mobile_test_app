import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant/app_colors.dart';

class BorderedIconButton extends StatelessWidget {
  final String text;
  final Function clickEvent;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? radius;
  final double? fontSize;
  final FaIcon faIcon;

  const BorderedIconButton(
      {Key? key,
      required this.text,
      required this.clickEvent,
      this.borderColor = AppColors.appColorBlack,
      this.textColor = AppColors.appColorBlack,
      this.height = 50.0,
      this.width,
      this.radius = 6.0,
      required this.faIcon,
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
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius!),
                      side: BorderSide(color: borderColor!)))),
          onPressed: () {
            clickEvent();
          },
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: faIcon,
                ),
              ),
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          fontSize: fontSize, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Text(
                  "",
                ),
              )
            ],
          )),
    );
  }
}
