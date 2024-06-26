import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../constant/app_colors.dart';

class AppPasswordField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final TextInputType inputType;
  final MultiValidator validator;
  final String hintText;
  final Color? hintColor;
  bool isObscure;
  final bool? isEnable;
  final int? minLine;
  final int? maxLine;

  AppPasswordField(
      {super.key,
      required this.formKey,
      required this.controller,
      required this.inputType,
      required this.validator,
      this.hintColor = AppColors.appColorLightGray,
      required this.hintText,
      this.isObscure = false,
      this.isEnable = true,
      this.minLine,
      this.maxLine = 1});

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
          controller: widget.controller,
          textAlign: TextAlign.left,
          style: const TextStyle(color: AppColors.appColorBlack, fontSize: 14),
          keyboardType: widget.inputType,
          obscureText: widget.isObscure,
          enabled: widget.isEnable,
          minLines: widget.minLine,
          maxLines: widget.maxLine,
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
              hintStyle: TextStyle(color: widget.hintColor, fontSize: 14),
              hintText: widget.hintText,
              suffixIcon: IconButton(
                icon: Icon(
                    widget.isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    widget.isObscure = !widget.isObscure;
                  });
                },
              )),
          validator: widget.validator.call),
    );
  }
}
