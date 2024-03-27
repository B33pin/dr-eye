import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../color/color_theme.dart';

class ThemeController extends GetxController {
  void changeThemeMode() {
    Get.changeThemeMode(ThemeMode.light);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: LightColors().brightness,
        statusBarIconBrightness: LightColors().iconBrightness,
        systemNavigationBarColor: LightColors().backgroundColor,
        systemNavigationBarIconBrightness: LightColors().iconBrightness));

    update();
  }
}
