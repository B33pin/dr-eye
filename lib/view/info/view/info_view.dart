import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import 'package:drscanner_ai/core/init/theme/color/color_theme.dart';
import 'package:drscanner_ai/view/blog/controller/blog_controller.dart';
import 'package:drscanner_ai/view/home/view/widget/title_with_description_widget.dart';
import 'package:drscanner_ai/view/info/controller/info_controller.dart';

class InfoView extends GetView<BlogController> {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(InfoController());
    InfoController infoController = Get.find();

    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleWithDescription(title: "info"),
              SizedBox(
                height: Utility(context).dynamicHeight(0.90),
                width: Utility(context).dynamicWidth(1),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: Utility(context).dynamicWidthPixel(22),
                    top: Utility(context).dynamicWidthPixel(30),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: Utility(context).dynamicWidth(1),
                        decoration: BoxDecoration(
                          color: AppColors().white,
                          borderRadius: BorderRadius.all(Radius.circular(
                              Utility(context).dynamicHeightPixel(22))),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                              right: Utility(context).dynamicWidthPixel(16),
                              left: Utility(context).dynamicWidthPixel(16),
                              top: Utility(context).dynamicWidthPixel(16),
                              bottom: Utility(context).dynamicWidthPixel(16),
                            ),
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: Get.locale.obs.value ==
                                        const Locale('ar_AR')
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    Get.locale.obs.value ==
                                            const Locale('ar_AR')
                                        ? infoController.arabicinfos[0]['text']!
                                        : infoController.infos[0]['text']!,
                                    style:
                                        Utility(context).textTheme.titleSmall!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: Utility(context)
                                          .dynamicWidthPixel(16),
                                      bottom: Utility(context)
                                          .dynamicWidthPixel(16),
                                    ),
                                    child: Text(
                                      Get.locale.obs.value ==
                                              const Locale('ar_AR')
                                          ? infoController.arabicinfos[0]
                                              ['description']!
                                          : infoController.infos[0]
                                              ['description']!,
                                      style:
                                          Utility(context).textTheme.bodyMedium,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
