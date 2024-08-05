import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
Widget AppBarr(){
  return SafeArea(
    child: Container(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: (){
            Get.back();
            },
              icon: const Icon(Icons.arrow_back_outlined)),
          Center(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: const Image(image:AssetImage('assets/logo.png'),height: 70,width: 70,)),
          ),
          //centerTitle: true,
        ],
      ),
    ),
  );
}