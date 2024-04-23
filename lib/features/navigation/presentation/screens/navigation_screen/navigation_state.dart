import 'package:equatable/equatable.dart';

import '../../../../../../../core/constant/app_nav_bar_item.dart';

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}
