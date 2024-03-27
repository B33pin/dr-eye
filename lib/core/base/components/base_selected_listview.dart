import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import '../../init/theme/color/color_theme.dart';

class BaseSelectedListViewWidget extends StatelessWidget {
  final String buttonText;
  final Color color;

  const BaseSelectedListViewWidget({
    Key? key,
    required this.buttonText,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Utility(context).dynamicWidthPixel(18),
      ),
      child: Container(
        width: Utility(context).dynamicWidthPixel(340),
        height: 56,
        decoration: BoxDecoration(
          color: AppColors().white,
          border: Border.all(width: 1.5, color: color),
          borderRadius: BorderRadius.circular(
            Utility(context).dynamicHeightPixel(3),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: Utility(context).dynamicWidthPixel(16),
            right: Utility(context).dynamicWidthPixel(8),
            top: Utility(context).dynamicWidthPixel(14),
            bottom: Utility(context).dynamicWidthPixel(14),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: Utility(context).dynamicWidthPixel(8),
                  right: Utility(context).dynamicWidthPixel(8),
                ),
                child: Text(
                  buttonText.tr,
                  style: Utility(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
