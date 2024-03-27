import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class ITextTheme {
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const bold = FontWeight.w700;

  final Color? primaryColor;
  late final TextTheme data;
  TextStyle? titleLarge;
  TextStyle? titleMedium;
  TextStyle? titleSmall;
  TextStyle? bodyLarge;
  TextStyle? bodyMedium;
  TextStyle? bodySmall;
  TextStyle? labelMedium;
  TextStyle? labelStyle;
  TextStyle? errorStyle;
  TextStyle? hintStyle;

  ITextTheme(this.primaryColor);
}

class TextSize {
  double dynamicTextSize(double fontSize) {
    if (MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.shortestSide > 600) {
      return fontSize.sp * 0.55;
    } else {
      return fontSize.sp * 0.88;
    }
  }
}
