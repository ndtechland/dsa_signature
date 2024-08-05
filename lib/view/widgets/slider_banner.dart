import 'dart:async';
import 'dart:convert';
import 'package:dsa_app/controller/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constant.dart';

class SliderBanner extends StatelessWidget {
  final double h ;
  final double w ;
   SliderBanner({Key? key, required this.h, required this.w,});

  // List<String> bannerImages = [];
  List<Widget> indicators(int imagesLength, int currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  BannerController bannerController = Get.put(BannerController());

  @override
  Widget build(BuildContext context) {
    // double w = MediaQuery.of(context).size.width;
    // double h = MediaQuery.of(context).size.height;
    return Obx(() {
      if (bannerController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (bannerController.bannerImages.isEmpty) {
        return Center(child: Text("No banners available"));
      } else {
        return Container(
          child: Column(
            children: [
              Container(
                width: w,
                height: h,
                child: PageView.builder(
                  controller: bannerController.pageController,
                  itemCount: bannerController.bannerImages.length,
                    // onPageChanged: (page) {
                    //               setState(() {
                    //                 bannerController.activePage = page;
                    //               });
                    //             },
                  itemBuilder: (context, index) {
                    bool active = index == bannerController.activePage;
                    return slider(bannerController.bannerImages, index, active);
                  },
                ),
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(bannerController.bannerImages.length, bannerController.activePage),
                  ),
            ],
          ),
        );
      }
    }
    );
  }
}

AnimatedContainer slider(List<String> images, int pagePosition, bool active) {
  double margin = active ? 2 : 5;
  return AnimatedContainer(
    duration: const Duration(seconds: 1),
    curve: Curves.fastOutSlowIn,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
     // color: Colors.pinkAccent,
      border: Border.all(color: gold),
    ),
    child: Image.network(
      images[pagePosition],
      fit: BoxFit.fill,
    ),
  );
}
