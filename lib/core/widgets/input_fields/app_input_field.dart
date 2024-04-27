import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constant/app_colors.dart';

class AppInputField extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextInputType inputType;
  final MultiValidator validator;
  final String hintText;
  final Color? hintColor;
  final bool? isObscure;
  final bool? isEnable;
  final int? minLine;
  final int? maxLine;
  final bool? showBorder;
  final TextCapitalization? textCapitalization;

  const AppInputField(
      {super.key,
      required this.formKey,
      required this.controller,
      required this.inputType,
      required this.validator,
      this.hintColor = AppColors.appColorGray,
      required this.hintText,
      this.isObscure = false,
      this.isEnable = true,
      this.showBorder,
      this.minLine,
      this.textCapitalization,
      this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          textAlign: TextAlign.left,
          style: const TextStyle(color: AppColors.appColorGray, fontSize: 14),
          keyboardType: inputType,
          obscureText: isObscure!,
          enabled: isEnable,
          minLines: minLine,
          maxLines: maxLine,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.appColorLightGray)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.appColorLightGray)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.appColorLightGray)),
            focusColor: AppColors.appColorWhiteGray,
            hintStyle: TextStyle(color: hintColor, fontSize: 14),
            hintText: hintText,
          ),
          validator: validator.call),
    );
  }
}
