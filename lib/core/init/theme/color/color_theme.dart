// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
part 'light_color.dart';

@immutable
class AppColors {
  final Color white = const Color(0xffffffff);
  final Color black = const Color(0xff000000);
  final Color backgroundColor = const Color(0xffF3F4F6);
  final Color red = const Color(0xffBD4747);
  final Color green = const Color(0xfff05A9E3);
  final Color grey1 = const Color(0xff7C99A2);
}

abstract class IColors {
  AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? backgroundColor;
  Color? appBarColor;
  Color? bottomTabBarColor;
  ColorScheme? colorScheme;
  Color? textColor;
  Color? textColor2;
  Color? textColor3;
  Color? iconColor;
  Color? cardColor;
  Color? buttonColor;
  Color? disabledButtonColor;
  Color? buttonTextColor;
  Brightness? brightness;
  Brightness? iconBrightness;
}
