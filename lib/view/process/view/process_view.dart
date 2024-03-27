import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import 'package:drscanner_ai/core/constants/data_constants.dart';
import 'package:drscanner_ai/core/init/theme/color/color_theme.dart';
import 'package:drscanner_ai/view/home/view/widget/title_with_description_widget.dart';
import 'package:drscanner_ai/view/process/controller/process_controller.dart';

class ProcessView extends GetView<ProcessController> {
  const ProcessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: GetBuilder<ProcessController>(
            init: ProcessController(),
            builder: (processController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWithDescription(
                    title: "scanning",
                    description: "scanningPageDescription",
                    isBackButtonActive: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Utility(context).dynamicWidthPixel(90),
                    ),
                    child: LottieBuilder.asset(
                      fit: BoxFit.contain,
                      width: Utility(context).dynamicWidth(1),
                      DataConstants.instance.jSONPath.searchLottie,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
