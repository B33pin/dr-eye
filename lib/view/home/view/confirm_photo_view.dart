import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:drscanner_ai/core/base/components/button/base_button.dart';
import 'package:drscanner_ai/core/base/state/base_state.dart';
import 'package:drscanner_ai/core/init/theme/color/color_theme.dart';
import '../../../core/base/components/popup/general_popup.dart';
import '../../process/view/process_view.dart';
import '../controller/home_controller.dart';
import 'widget/title_with_description_widget.dart';

class ConfirmPhotoView extends GetView<HomeController> {
  final XFile? xFileImage;
  const ConfirmPhotoView({super.key, this.xFileImage});

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
                title: "confirmPhoto",
                description: "confirmPhotoDescription",
                isBackButtonActive: true),
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
                    image: FileImage(io.File(xFileImage!.path)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Utility(context).dynamicWidthPixel(90),
                bottom: Utility(context).dynamicWidthPixel(20),
              ),
              child: BaseButton(
                buttonText: 'confirm'.tr,
                onPressed: () {
                  BaseDialog.show(
                    context: context,
                    text: "warningText".tr,
                    buttonText: "understand".tr,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(const ProcessView());
                    },
                  );
                },
              ),
            ),
            BaseButton(
              buttonText: 'reselect'.tr,
              borderColor: AppColors().green,
              backgroundColor: Colors.transparent,
              buttonTextColor: AppColors().green,
              onPressed: () {
                xFileImage == null;
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
