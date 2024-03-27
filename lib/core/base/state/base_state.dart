import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/enums/device_type_enum.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ThemeData get themeData => Theme.of(context);
  double dynamicHeight(double value) => Get.height * value;
  double dynamicWidth(double value) => Get.width * value;

  double dynamicTextSize(double fontSize) {
    if (MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide >
        600) {
      return fontSize.sp * 0.55;
    } else {
      return fontSize.sp * 0.88;
    }
  }

  double dynamicHeightPixel(double size) => size.h;
  double dynamicWidthPixel(double size) => size.w * 0.88;

  DeviceTypes getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600
        ? DeviceTypes.phone
        : DeviceTypes.tablet;
  }

  get isTablet {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? false : true;
  }
}

class Utility {
  BuildContext context;
  Utility(this.context);
  ThemeData get theme => Theme.of(context);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme
      .copyWith(primary: Color(0xff05A9E3), secondary: Color(0xff05A9E3));

  double get width => Get.width;
  double get height => Get.height;

  double dynamicHeight(double value) => height * value;
  double dynamicWidth(double value) => width * value;
  double dynamicTextSize(double fontSize) {
    if (MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .size
            .shortestSide >
        600) {
      return fontSize.sp * 0.55;
    } else {
      return fontSize.sp * 0.88;
    }
  }

  double dynamicHeightPixel(double size) => size.h;
  double dynamicWidthPixel(double size) => size.w * 0.88;

  DeviceTypes getDeviceType() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600
        ? DeviceTypes.phone
        : DeviceTypes.tablet;
  }

  isTablet() {
    final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    return data.size.shortestSide < 600 ? false : true;
  }
}
