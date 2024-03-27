import 'package:drscanner_ai/view/home/view/confirm_photo_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import 'package:drscanner_ai/core/constants/image_constants.dart';
import 'package:drscanner_ai/core/init/theme/color/color_theme.dart';
import 'package:drscanner_ai/view/home/view/widget/image_source_boxes.dart';
import '../controller/home_controller.dart';
import 'widget/title_with_description_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleWithDescription(
                title: "selectPhoto", description: "selectPhotoDescription"),
            ImageSourceWidget(
              title: "Select From Gallery",
              iconColor: AppColors().green,
              iconPath: ImageConstants.instance.svgPath.gallery,
              onTap: () async {
                Get.put(HomeController());
                HomeController homeController = Get.find();
                await homeController.captureImage(context, ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
