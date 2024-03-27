import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:drscanner_ai/core/constants/data_constants.dart';
import 'package:drscanner_ai/view/blog/model/blog_model.dart';

class BlogController extends GetxController {
  late List<BlogModel> blogList = [];
  late List<BlogModel> arabicBlog = [];
  @override
  Future<void> onInit() async {
    await loadJsonData();
    super.onInit();
  }

  Future loadJsonData() async {
    var jsonText =
        await rootBundle.loadString(DataConstants.instance.jSONPath.data);
    var arabic =
        await rootBundle.loadString(DataConstants.instance.jSONPath.data);
    blogList = blogModelFromJson(jsonText);
    arabicBlog = blogModelFromJson(arabic);
    update();
  }
}
