import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/constant/app_nav_bar_item.dart';
import 'navigation_state.dart';

class NavigationBlock extends Cubit<NavigationState> {
  NavigationBlock() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.heart:
        emit(const NavigationState(NavbarItem.heart, 1));
        break;
      case NavbarItem.profile:
        emit(const NavigationState(NavbarItem.profile, 2));
        break;
    }
  }
}
