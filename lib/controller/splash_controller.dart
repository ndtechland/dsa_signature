import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashScreenControllers extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool timerStarted = false; // Added field to track timer state

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        update();
      });

    animationController.forward();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}