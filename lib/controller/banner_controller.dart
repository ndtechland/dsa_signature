// import 'dart:async';
//
// import 'package:dsa_app/apiServices/api_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class BannerController extends GetxController{
//   late Timer _timer;
//   late final PageController pageController;
//   int activePage = 0;
//   List<String> bannerImages = [];
//   final RxBool isLoading = false.obs;
//
//   @override
//   void onInit(){
//     super.onInit();
//     pageController = PageController(viewportFraction: 0.9, initialPage: 0, keepPage: true);
//
//     // Initialize the timer to auto-scroll every 3 seconds
//     _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       try{
//         isLoading.value = true;
//         if (activePage < bannerImages.length - 1) {
//         activePage++;
//       } else {
//         activePage = 0;
//       }}
//       catch (e){
//         isLoading.value=false;
//       }
//       pageController.animateToPage(
//         activePage,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     });
//     print("images:${bannerImages}");
//   }
//   Future<void> banner() async {
//     try{
//       isLoading.value=true;
//       final response = await ApiProvider.getBanner();
//       if(response.statusCode==200){
//         List<String> images = List<String>.from(ApiProvider['Data'].map((item) => 'https://new.signatureresorts.in/Images/${item['BannerPath']}'));
//
//       }
//
//     } catch (e) {
//
//     }
//   }
//   // @override
//   // void onClose() {
//   //   super.onClose();
//   //   pageController.dispose();
//   //   _timer.cancel();
//   // }
//   // void initState() {
//   //   super.initState();
//   //   // getBanner();
//   //
//   // }
//
//   @override
//   void dispose() {
//     pageController.dispose();
//     _timer.cancel(); // Cancel the timer to avoid memory leaks
//     super.dispose();
//   }
//
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dsa_app/apiServices/api_service.dart';

class BannerController extends GetxController {
  late Timer _timer;
  late final PageController pageController;
  int activePage = 0;
  List<String> bannerImages = [];
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.9, initialPage: 0, keepPage: true);
    fetchBanner();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (bannerImages.isNotEmpty) {
        activePage = (activePage + 1) % bannerImages.length;
        pageController.animateToPage(
          activePage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  Future<void> fetchBanner() async {
    try {
      isLoading.value = true;
      final bannerResponse = await ApiProvider.getBanner();
      bannerImages = bannerResponse.data.map((item) => '${ApiProvider.imageUrl}${item.bannerPath}').toList();
      isLoading.value = false;
      print("imags:${bannerImages}");
    } catch (e) {
      isLoading.value = false;
      print("Error fetching banners: $e");
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    _timer.cancel();
    super.dispose();
  }
}
