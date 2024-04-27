import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/auth/domain/usecases/logout_usercase.dart';
import '../../../features/auth/presentation/screens/login_screen/login_screen.dart';
import '../../../injection_container.dart';
import '../../constant/app_colors.dart';
import '../atoms/app_label.dart';
import '../buttons/bordered_button.dart';
import '../buttons/custom_filled_button.dart';

void userLogOutBottomSheet({required BuildContext context}) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    ),
    context: context,
    backgroundColor: AppColors.appColorWhite,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.appColorLightGray,
          ),
        ),
        const SizedBox(height: 20),
        const AppLabel(text: "Are you sure you want to logout?"),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomFilledButton(
              text: "Logout",
              clickEvent: () async {
                LogoutUsecase logoutUsercase =
                    LogoutUsecase(authRepository: sl());
                await logoutUsercase.call(LogoutParams()).then((value) {
                  if (value) {
                    Get.to(const LoginScreen());
                  }
                });
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BorderedButton(
            text: "Cancel",
            clickEvent: () {
              Get.back();
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    ),
  );
}
