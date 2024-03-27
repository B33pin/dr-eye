import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:drscanner_ai/core/init/theme/text/text_theme.dart';
import 'package:drscanner_ai/core/init/theme/text/text_theme_light.dart';
import 'color/color_theme.dart';

abstract class ITheme {
  ITextTheme get textTheme;
  IColors get colors;
}

// main.dart dosyasında ThemeManager.createTheme(AppThemeDark())

abstract class ThemeManager {
  static ThemeData createTheme(ITheme theme) => ThemeData(
        fontFamily: 'Roboto',
        textTheme: theme.textTheme.data,
        appBarTheme: AppBarTheme(
          backgroundColor: theme.colors.appBarColor,
          iconTheme: IconThemeData(color: theme.colors.iconColor, size: TextSize().dynamicTextSize(24)),
          systemOverlayStyle:
              (theme.colors.colorScheme?.brightness == Brightness.dark ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light).copyWith(
            statusBarColor: Colors.transparent,
            statusBarBrightness: theme.colors.brightness,
            statusBarIconBrightness: theme.colors.iconBrightness,
            systemNavigationBarColor: theme.colors.backgroundColor,
            systemNavigationBarIconBrightness: theme.colors.iconBrightness,
          ),
        ),
        scaffoldBackgroundColor: theme.colors.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: theme.colors.iconColor, size: TextSize().dynamicTextSize(24)),
        brightness: theme.colors.colorScheme?.brightness,
        progressIndicatorTheme: ProgressIndicatorThemeData(color: theme.colors.iconColor),
        elevatedButtonTheme: elevatedButtonTheme(theme),
        dividerColor: theme.colors.textColor,
        buttonTheme: ButtonThemeData(buttonColor: theme.colors.buttonColor),
        bottomAppBarTheme: BottomAppBarTheme(color: theme.colors.scaffoldBackgroundColor),
        colorScheme: theme.colors.colorScheme?.copyWith(background: theme.colors.backgroundColor),
        unselectedWidgetColor: theme.colors.iconColor,
      );

  static ElevatedButtonThemeData elevatedButtonTheme(ITheme theme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: theme.colors.buttonTextColor,
        backgroundColor: theme.colors.buttonColor,
        disabledBackgroundColor: theme.colors.disabledButtonColor,
      ),
    );
  }
}

class AppThemeLight extends ITheme {
  @override
  late final ITextTheme textTheme;

  AppThemeLight() {
    textTheme = TextThemeLight();
  }

  @override
  IColors get colors => LightColors();
}
