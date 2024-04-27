import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_test/features/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:mobile_app_test/features/home/presentation/screens/home_screen/home_screen.dart';

import '../../../../../../../core/constant/app_nav_bar_item.dart';
import '../../../../../core/constant/app_colors.dart';
import 'navigation_block.dart';
import 'navigation_state.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationBlock, NavigationState>(
        builder: (context, state) {
          return Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: AppColors.appColorWhite,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.appColorLightBlue,
              selectedFontSize: 9,
              unselectedFontSize: 9,
              unselectedItemColor: Colors.grey,
              currentIndex: state.index,
              showUnselectedLabels: true,
              items: navBarMenuItem,
              onTap: (index) {
                if (index == 0) {
                  BlocProvider.of<NavigationBlock>(context)
                      .getNavBarItem(NavbarItem.home);
                } else if (index == 1) {
                  BlocProvider.of<NavigationBlock>(context)
                      .getNavBarItem(NavbarItem.heart);
                } else if (index == 2) {
                  BlocProvider.of<NavigationBlock>(context)
                      .getNavBarItem(NavbarItem.profile);
                }
              },
            ),
          );
        },
      ),
      body: BlocBuilder<NavigationBlock, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return const HomeScreen();
        } else if (state.navbarItem == NavbarItem.heart) {
          return const LoginScreen();
        } else if (state.navbarItem == NavbarItem.profile) {
          return const LoginScreen();
        } else {
          return const LoginScreen();
        }
      }),
    );
  }
}
