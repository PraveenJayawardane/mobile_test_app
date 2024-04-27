import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

bool isUserName(String input) =>
    RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]").hasMatch(input);

class AppEmailPasswordField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextInputType inputType;
  final String hintText;
  final Color? hintColor;
  final bool? isObscure;
  final bool? isEnable;
  final int? minLine;
  final int? maxLine;

  const AppEmailPasswordField(
      {super.key,
      required this.formKey,
      required this.controller,
      required this.inputType,
      this.hintColor = AppColors.appColorLightGray,
      required this.hintText,
      this.isObscure = false,
      this.isEnable = true,
      this.minLine,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.left,
        style: const TextStyle(color: AppColors.appColorGray, fontSize: 14),
        keyboardType: inputType,
        obscureText: isObscure!,
        enabled: isEnable,
        minLines: minLine,
        maxLines: maxLine,
        decoration: InputDecoration(
          fillColor: AppColors.appColorGray03.withOpacity(0.1),
          filled: true,
          focusColor: AppColors.appColorWhiteGray,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.appColorWhite)),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.appColorWhite)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.appColorWhite)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.appColorWhite)),
          hintStyle: TextStyle(color: hintColor, fontSize: 14),
          hintText: hintText,
        ),
        validator: (value) {
          if (!isUserName(value!)) {
            return 'Please enter username.';
          }
          return null;
        },
      ),
    );
  }
}
