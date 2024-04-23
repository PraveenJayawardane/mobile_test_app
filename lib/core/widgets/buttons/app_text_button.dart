import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.event,
    required this.textColor,
    required this.textSpan,
  });
  final Function() event;
  final Color textColor;
  final TextSpan textSpan;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: event,
      style: TextButton.styleFrom(foregroundColor: textColor),
      child: RichText(text: textSpan),
    );
  }
}
