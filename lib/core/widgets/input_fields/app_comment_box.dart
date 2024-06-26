import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constant/app_colors.dart';

class AppCommentBox extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextInputType inputType;
  final MultiValidator validator;
  final String hintText;
  final Color? hintColor;
  final Color? bgColor;
  final bool? isObscure;
  final bool? isEnable;
  final int? minLine;
  final int? maxLine;

  const AppCommentBox(
      {super.key,
      required this.formKey,
      required this.controller,
      required this.inputType,
      required this.validator,
      this.hintColor = AppColors.appColorLightGray,
      this.bgColor = AppColors.appColorLightGray,
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
          style: const TextStyle(color: AppColors.appColorBlack, fontSize: 14),
          keyboardType: inputType,
          obscureText: isObscure!,
          enabled: isEnable,
          minLines: minLine,
          maxLines: maxLine,
          decoration: InputDecoration(
              filled: true,
              fillColor: bgColor,
              hintStyle: TextStyle(color: hintColor, fontSize: 14),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              )),
          validator: validator.call),
    );
  }
}
