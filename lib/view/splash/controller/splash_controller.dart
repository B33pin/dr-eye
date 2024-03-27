import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:drscanner_ai/view/onboarding/view/onboarding_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Get.updateLocale(const Locale('en_US'));
    routePage();
    super.onInit();
  }

  routePage() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const OnboardingView());
    });
  }
}
