import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum NavbarItem {
  home,
  heart,
  profile,
}

double iconSize = 25;

var navBarMenuItem = [
  BottomNavigationBarItem(
    icon: Icon(
      FontAwesomeIcons.circle,
      size: iconSize,
    ),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      FontAwesomeIcons.heart,
      size: iconSize,
    ),
    label: '',
  ),
  BottomNavigationBarItem(
    icon: Icon(
      FontAwesomeIcons.circle,
      size: iconSize,
    ),
    label: '',
  ),
];
