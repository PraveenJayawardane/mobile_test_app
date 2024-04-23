import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/widgets/atoms/app_heading.dart';
import '../../../../../core/widgets/atoms/app_label.dart';
import '../../../../../core/widgets/buttons/bordered_button.dart';
import '../../../../../core/widgets/input_fields/app_input_field.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> firstNameKey = GlobalKey<FormState>();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> lastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> genderKey = GlobalKey<FormState>();
  final GlobalKey<FormState> ageKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
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
                formKey: firstNameKey,
                validator: MultiValidator(
                    [RequiredValidator(errorText: 'Email is required')]),
                controller: firstNameController,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 20,
              ),
              AppInputField(
                inputType: TextInputType.name,
                formKey: lastNameKey,
                validator: MultiValidator(
                    [RequiredValidator(errorText: 'Last Name is required')]),
                controller: lastNameController,
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
                      controller: lastNameController,
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
                      controller: lastNameController,
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
                formKey: emailKey,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Password is required'),
                ]),
                controller: emailController,
                hintText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              AppInputField(
                inputType: TextInputType.emailAddress,
                formKey: passwordKey,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Confirm Password is required'),
                ]),
                controller: emailController,
                hintText: 'Confirm Password',
              ),
              const SizedBox(
                height: 80,
              ),
              BorderedButton(
                  clickEvent: () {
                    if (isValidate()) {}
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
          ),
        ),
      ),
    );
  }

  bool isValidate() {
    if (firstNameKey.currentState!.validate() &&
        passwordKey.currentState!.validate() &&
        lastNameKey.currentState!.validate() &&
        emailKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
