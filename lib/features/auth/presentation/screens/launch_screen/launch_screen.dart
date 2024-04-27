import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app_test/core/widgets/atoms/app_label.dart';
import 'package:mobile_app_test/core/widgets/buttons/bordered_button.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/registration_screen/registration_screen.dart';

import '../../../../../core/constant/app_colors.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              //keepyoga
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Image.asset(
                  "assets/launch_img.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Positioned(
                  top: 20,
                  left: 10,
                  right: 10,
                  child: AppLabel(
                    text: "keepyoga",
                    textColor: AppColors.appColorLightGray,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                  )),
              const Positioned(
                  top: 40,
                  left: 10,
                  right: 10,
                  child: AppLabel(
                    text: "Practice yoga\n whenever you want.",
                    fontSize: 25,
                    textAlign: TextAlign.center,
                  )),
              Positioned(
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: Column(
                    children: [
                      BorderedButton(
                        backgroundColor: Colors.white,
                        clickEvent: () {
                          Get.to(const RegistrationScreen());
                        },
                        radius: 20,
                        text: 'Get Started',
                        textColor: AppColors.appColorBlack,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BorderedButton(
                        backgroundColor: AppColors.appColorPurple,
                        text: 'Log in',
                        radius: 20,
                        textColor: Colors.white,
                        clickEvent: () {
                          Get.to(const LoginScreen());
                        },
                      )
                    ],
                  )),
            ],
          );
        },
      ),
    );
  }
}
