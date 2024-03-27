import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import 'package:drscanner_ai/core/constants/image_constants.dart';
import 'package:drscanner_ai/core/init/theme/color/color_theme.dart';
import 'package:drscanner_ai/view/blog/controller/blog_controller.dart';
import 'package:drscanner_ai/view/home/view/widget/title_with_description_widget.dart';

class BlogDetailView extends GetView<BlogController> {
  final int index;
  const BlogDetailView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: GetBuilder<BlogController>(
          init: BlogController(),
          builder: (blogController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleWithDescription(
                    title: "postDetail", isBackButtonActive: true),
                Padding(
                  padding: EdgeInsets.only(
                    top: Utility(context).dynamicWidthPixel(30),
                    bottom: Utility(context).dynamicWidthPixel(30),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: Utility(context).dynamicWidth(1),
                        height: Utility(context).dynamicWidthPixel(150),
                        decoration: BoxDecoration(
                          color: AppColors().white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                                Utility(context).dynamicHeightPixel(22)),
                            topRight: Radius.circular(
                                Utility(context).dynamicHeightPixel(22)),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                                blogController.blogList[index].imageName),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: Utility(context).dynamicWidth(1),
                        height: Utility(context).dynamicHeight(0.50),
                        decoration: BoxDecoration(
                          color: AppColors().white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(
                                Utility(context).dynamicHeightPixel(22)),
                            bottomRight: Radius.circular(
                                Utility(context).dynamicHeightPixel(22)),
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(
                              right: Utility(context).dynamicWidthPixel(16),
                              left: Utility(context).dynamicWidthPixel(16),
                              top: Utility(context).dynamicWidthPixel(16),
                              bottom: Utility(context).dynamicWidthPixel(22),
                            ),
                            child: Obx(
                              () => Column(
                                crossAxisAlignment: Get.locale.obs.value ==
                                        const Locale('ar_AR')
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: Utility(context)
                                          .dynamicWidthPixel(22),
                                    ),
                                    child: Text(
                                      blogController.blogList[index].title,
                                      style: Utility(context)
                                          .textTheme
                                          .titleSmall!,
                                      textAlign: Get.locale.obs.value ==
                                              const Locale('ar_AR')
                                          ? TextAlign.end
                                          : TextAlign.start,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      blogController.blogList[index].text,
                                      style: Utility(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: AppColors().grey1,
                                          ),
                                      textAlign: Get.locale.obs.value ==
                                              const Locale('ar_AR')
                                          ? TextAlign.end
                                          : TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
