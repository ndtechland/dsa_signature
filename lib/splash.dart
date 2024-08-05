import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/splash_controller.dart';
import 'package:dsa_app/view/account_service2.dart';
import 'view/home.dart';
import 'view/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenControllers>(
        init: SplashScreenControllers(),
        builder: (controller) {
          if (controller.animation.status == AnimationStatus.completed && !controller.timerStarted) {
            controller.timerStarted = true; // Mark the timer as started to prevent re-entering

            // Start the timer
            Timer(const Duration(seconds: 2), () async {
              try {
                final accountData2 = await accountService2.getAccountData2;
                if (accountData2 != null ) {
                  // Navigate to Home if logged in
                  Get.offAll(() => const Home());
                } else {
                  // Navigate to Login page if not logged in
                  Get.offAll(() => const LoginPage());
                }
              } catch (error) {
                print('Error in SplashScreen: $error');
                // Handle error accordingly, navigate to Login page
                Get.offAll(() => const LoginPage());
              }
            });
          }

          return Center(
            child: AnimatedBuilder(
              animation: controller.animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: controller.animation.value * 2,
                  child: Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 200,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}