// ignore_for_file: library_private_types_in_public_api

part of 'color_theme.dart';

class LightColors implements IColors {
  @override
  final AppColors colors = AppColors();

  @override
  late final Color? appBarColor;

  @override
  late final Brightness? brightness;

  @override
  late final Brightness? iconBrightness;

  @override
  late final ColorScheme? colorScheme;

  @override
  late final Color? scaffoldBackgroundColor;
  @override
  late final Color? bottomTabBarColor;
  @override
  late final Color? textColor;

  @override
  Color? iconColor;

  @override
  late final Color? textColor2;

  @override
  late final Color? textColor3;

  @override
  late final Color? backgroundColor;

  @override
  late final Color? cardColor;
  @override
  late final Color? buttonColor;
  @override
  late final Color? disabledButtonColor;
  @override
  late final Color? buttonTextColor;

  LightColors() {
    appBarColor = colors.white;
    backgroundColor = colors.white;
    scaffoldBackgroundColor = colors.white;
    bottomTabBarColor = colors.white;
    buttonColor = colors.green;
    disabledButtonColor = colors.grey1;
    buttonTextColor = colors.white;
    iconColor = colors.grey1;
    textColor = colors.green;
    brightness = Brightness.dark;
    iconBrightness = Brightness.light;
    colorScheme = const ColorScheme.light().copyWith(
      primary: colors.green,
      secondary: colors.grey1,
      onSurface: colors.white,
    );
  }
}
