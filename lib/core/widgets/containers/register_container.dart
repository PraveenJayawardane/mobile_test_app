import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_bloc.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_event.dart';

import '../../constant/app_colors.dart';
import '../atoms/app_heading.dart';
import '../atoms/app_label.dart';
import '../buttons/bordered_button.dart';
import '../input_fields/app_input_field.dart';

class RegisterContainer extends StatelessWidget {
  RegisterContainer({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> rePasswordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> genderKey = GlobalKey<FormState>();
  final GlobalKey<FormState> ageKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 50,
        ),
        const AppHeading(
          text: 'Registration',
          fontSize: 32,
        ),
        const AppLabel(
            textColor: AppColors.appColorLightGray,
            fontSize: 16,
            text: 'Create your account'),
        const SizedBox(
          height: 20,
        ),
        AppInputField(
          inputType: TextInputType.name,
          formKey: emailKey,
          validator: MultiValidator(
              [RequiredValidator(errorText: 'Email is required')]),
          controller: emailController,
          hintText: 'Email',
        ),
        const SizedBox(
          height: 20,
        ),
        AppInputField(
          inputType: TextInputType.name,
          formKey: userNameKey,
          validator: MultiValidator(
              [RequiredValidator(errorText: 'User Name is required')]),
          controller: userNameController,
          hintText: 'User Name',
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: AppInputField(
                inputType: TextInputType.name,
                formKey: genderKey,
                validator: MultiValidator(
                    [RequiredValidator(errorText: 'Gender is required')]),
                controller: genderController,
                hintText: 'Gender',
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: AppInputField(
                inputType: TextInputType.name,
                formKey: ageKey,
                validator: MultiValidator(
                    [RequiredValidator(errorText: 'Age is required')]),
                controller: ageController,
                hintText: 'Age',
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        AppInputField(
          inputType: TextInputType.emailAddress,
          formKey: passwordKey,
          validator: MultiValidator([
            RequiredValidator(errorText: 'Email is required'),
          ]),
          controller: passwordController,
          hintText: 'Password',
        ),
        const SizedBox(
          height: 20,
        ),
        AppInputField(
          inputType: TextInputType.emailAddress,
          formKey: rePasswordKey,
          validator: MultiValidator([
            RequiredValidator(errorText: 'Confirm Password is required'),
          ]),
          controller: rePasswordController,
          hintText: 'Confirm Password',
        ),
        const SizedBox(
          height: 80,
        ),
        BorderedButton(
            clickEvent: () {
              // if (isValidate()) {
              //   if (passwordController.text == rePasswordController.text) {
              context.read<RegistrationBloc>().add(RegistrationEvent(
                  password: passwordController.text,
                  email: emailController.text,
                  gender: genderController.text,
                  userName: userNameController.text));
              // } else {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //       toastMessage(message: "Password not matched"));
              // }
              // }
            },
            text: "Create Account",
            radius: 20,
            textColor: AppColors.appColorWhite,
            backgroundColor: AppColors.appColorPurple),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  bool isValidate() {
    if (emailKey.currentState!.validate() &&
        userNameKey.currentState!.validate() &&
        genderKey.currentState!.validate() &&
        ageKey.currentState!.validate() &&
        passwordKey.currentState!.validate() &&
        rePasswordKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
