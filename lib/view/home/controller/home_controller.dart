import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../view/confirm_photo_view.dart';

class HomeController extends GetxController {
  ImagePicker imagePick = ImagePicker();
  XFile? xFileImage;

  Future<void> captureImage(BuildContext context, ImageSource source) async {
    try {
      XFile? picked = await imagePick.pickImage(
        source: ImageSource.gallery,
      );
      if (picked != null) {
        xFileImage = XFile(picked.path);
        if (xFileImage != null) {
          Get.to(ConfirmPhotoView(xFileImage: xFileImage));
        }
      } else {
        return;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }
}
