import 'package:flutter/material.dart';
import '../../state/base_state.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? buttonTextColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final String buttonText;
  const BaseButton({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    this.backgroundColor,
    this.disabledColor,
    this.buttonTextColor,
    required this.buttonText,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Utility(context).dynamicHeightPixel(48),
      width: width ?? Utility(context).dynamicWidth(1),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: backgroundColor,
          foregroundColor: buttonTextColor,
          disabledBackgroundColor: disabledColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(
              Utility(context).dynamicWidthPixel(3),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: Utility(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: buttonTextColor ??
                    Utility(context).theme.scaffoldBackgroundColor,
              ),
        ),
      ),
    );
  }
}
