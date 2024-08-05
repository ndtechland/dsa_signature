import 'dart:io';
import 'package:dsa_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dsa_app/services/MyHttpOverrides.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure SharedPreferences is initialized
  await SharedPreferences.getInstance();
  await GetStorage.init();
  // Set custom HTTP overrides
  HttpOverrides.global = MyHttpOverrides();

  // Start the application
  runApp(const SignatureApp());
}

/// Renders the SignatureApp widget.
class SignatureApp extends StatelessWidget {
  const SignatureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}