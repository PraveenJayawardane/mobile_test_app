import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_bloc.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_event.dart';

import '../../constant/app_colors.dart';
import '../buttons/app_text_button.dart';
import '../buttons/bordered_button.dart';
import '../input_fields/app_input_field.dart';

class LoginContainer extends StatelessWidget {
  LoginContainer({super.key});
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: AppInputField(
                      inputType: TextInputType.name,
                      formKey: emailKey,
                      validator: MultiValidator(
                          [RequiredValidator(errorText: 'Email is required')]),
                      controller: emailController,
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
                      controller: passwordController,
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
                            if (isValidate()) {
                              context.read<LoginBloc>().add(LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
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
    );
  }

  bool isValidate() {
    if (emailKey.currentState!.validate() &&
        passwordKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
