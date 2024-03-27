import 'package:flutter/material.dart';
import '../../state/base_state.dart';

class BaseTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? buttonTextColor;
  final double? width;
  final double? height;
  final String buttonText;
  const BaseTextButton({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    this.backgroundColor,
    this.buttonTextColor,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? Utility(context).dynamicHeightPixel(48),
        width: width ?? Utility(context).dynamicWidth(1),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: Utility(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: buttonTextColor ?? Utility(context).colors.secondary,
                ),
          ),
        ));
  }
}
