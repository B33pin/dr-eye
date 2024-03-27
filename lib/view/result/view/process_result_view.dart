import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drscanner_ai/core/base/components/bottom_navigation_bar_widget.dart';
import 'package:drscanner_ai/core/base/components/button/base_button.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import 'package:drscanner_ai/core/init/theme/color/color_theme.dart';
import 'package:drscanner_ai/view/home/view/widget/title_with_description_widget.dart';
import 'package:drscanner_ai/view/process/controller/process_controller.dart';

class ProcessResultView extends GetView<ProcessController> {
  const ProcessResultView({super.key});

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
          builder: (processController) {
            return Obx(() => Column(
                  crossAxisAlignment:
                      Get.locale.obs.value == const Locale('ar_AR')
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                  children: [
                    const TitleWithDescription(
                      title: "scanResult",
                      description: "scanResultDescription",
                      isBackButtonActive: true,
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: Utility(context).dynamicWidthPixel(90),
                      ),
                      child: Container(
                        width: Utility(context).dynamicWidth(1),
                        height: Utility(context).dynamicWidthPixel(230),
                        decoration: BoxDecoration(
                          color: AppColors().backgroundColor,
                          borderRadius: BorderRadius.circular(
                            Utility(context).dynamicHeightPixel(15),
                          ),
                          image: DecorationImage(
                            image: FileImage(
                                io.File(processController.xFileImage!.path)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // if index == 0 Retinopathy
                    // if index == 1 Healthy
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Utility(context).dynamicWidthPixel(60),
                        ),
                        child: Text(
                          processController.output[0]['index'] == 0
                              ? "retinopathy".tr
                              : "healthy".tr,
                          style: Utility(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: processController.output[0]['index'] == 0
                                    ? AppColors().red
                                    : AppColors().green,
                              ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: Utility(context).dynamicWidthPixel(90),
                        bottom: Utility(context).dynamicWidthPixel(30),
                      ),
                      child: BaseButton(
                        buttonText: 'complete'.tr,
                        onPressed: () {
                          Get.off(
                              const BottomNavigationBarView(selectedIndex: 0));
                        },
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
