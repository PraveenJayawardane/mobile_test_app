import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/features/navigation/presentation/screens/navigation_screen/navigation_screen.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/widgets/buttons/app_text_button.dart';
import '../../../../../core/widgets/buttons/bordered_button.dart';
import '../../../../../core/widgets/input_fields/app_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  final GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: SizedBox(
              child: Center(
                  child: Image.asset(
                'assets/launch_img.png',
                fit: BoxFit.fill,
              )),
            ),
          ),
          Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: AppInputField(
                        inputType: TextInputType.name,
                        formKey: userNameKey,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Email is required')
                        ]),
                        controller: userNameController,
                        hintText: 'Email',
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: AppInputField(
                        inputType: TextInputType.name,
                        formKey: passwordKey,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Password is required')
                        ]),
                        controller: userNameController,
                        hintText: 'Password',
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: AppTextButton(
                          textColor: AppColors.appColorBlack,
                          event: () {},
                          textSpan: const TextSpan(children: [
                            TextSpan(
                                text: "Forgot password? ",
                                style: TextStyle(
                                    color: AppColors.appColorPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Poppins'))
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: AppTextButton(
                          textColor: AppColors.appColorBlack,
                          event: () {},
                          textSpan: const TextSpan(children: [
                            TextSpan(
                                text: "By continuing, you agree to our  ",
                                style: TextStyle(
                                    color: AppColors.appColorBlack,
                                    fontFamily: 'Poppins')),
                            TextSpan(
                                text: "Terms of Service",
                                style: TextStyle(
                                    color: AppColors.appColorPurple,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins')),
                            TextSpan(
                                text: " and ",
                                style: TextStyle(
                                    color: AppColors.appColorBlack,
                                    fontFamily: 'Poppins')),
                            TextSpan(
                                text: " Privacy Policy.",
                                style: TextStyle(
                                    color: AppColors.appColorPurple,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins'))
                          ]),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: BorderedButton(
                            clickEvent: () {
                              Get.to(NavigationScreen());
                              //if (isValidate()) {}
                            },
                            text: "Login",
                            radius: 20,
                            textColor: AppColors.appColorWhite,
                            backgroundColor: AppColors.appColorPurple),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  bool isValidate() {
    if (userNameKey.currentState!.validate() &&
        passwordKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
