import 'package:dsa_app/controller/controller.dart';
import 'package:dsa_app/view/register_user3.dart';
import 'package:dsa_app/view/widgets/appbar.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:dsa_app/view/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/addMember_controller.dart';
import '../controller/generateMaf_controller.dart';

class RegisterUser2 extends StatefulWidget {
  const RegisterUser2({super.key});

  @override
  State<RegisterUser2> createState() => _RegisterUser2State();
}

class _RegisterUser2State extends State<RegisterUser2> {
  final GenerateMafController _controller = Get.put(GenerateMafController());
  final AddMemberController _addMemberController = Get.put(AddMemberController());

  @override
  Widget build(BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    double h= MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Container(
              decoration: const BoxDecoration(
                //color: Colors.white,
              ),
              child: const Image(image:AssetImage('assets/logo.png'),height: 70,width: 70,)),
          centerTitle: true,
        ),
      body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.fromLTRB(18, 2, 18, 0),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //SizedBox(height: 10,),
                  // AppText(text: "Mobile Number 2", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                  // const SizedBox(height: 6,),
                  // SizedBox(
                  //   width: w / 1.1,
                  //   height: h / 15,
                  //   child: TextFormField(
                  //     controller: numberController2,
                  //     keyboardType: TextInputType.number,
                  //     inputFormatters: [
                  //       FilteringTextInputFormatter.digitsOnly,
                  //       LengthLimitingTextInputFormatter(10),
                  //     ],
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  //       ),
                  //       hintText: 'Enter Mobile Number',
                  //     ),
                  //     validator: (value) {
                  //       if (value == null || value.isEmpty) {
                  //         return 'Please enter a mobile number';
                  //       } else if (value.length != 10) {
                  //         return 'Only 10 digit phone number allowed';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 10,),
                  AppText(text: "Address", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                  const SizedBox(height: 6,),
                  SizedBox(
                    width: w / 1.1,
                    height: h/15,
                    child: TextFormField(
                      controller: _addMemberController.addressController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintText: 'Address',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter address';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  AppText(text: "Residence No", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                  const SizedBox(height: 6,),
                  SizedBox(
                    width: w / 1.1,
                    height: h/15,
                    child: TextFormField(
                      controller: _addMemberController.residenceController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintText: 'Residence Number',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  AppText(text: "Email", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                  const SizedBox(height: 6,),
                  SizedBox(
                    width: w / 1.1,
                    height: h/15,
                    child: TextFormField(
                      controller: _addMemberController.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintText: 'Email Id',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter valid Email';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  AppText(text: "City", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                  const SizedBox(height: 6,),
                  SizedBox(
                    width: w / 1.1,
                    height: h/15,
                    child: TextFormField(
                      controller: _addMemberController.cityController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintText: 'City Name',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter city name';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  AppText(text: "Pincode", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                  const SizedBox(height: 6,),
                  SizedBox(
                    width: w / 1.1,
                    height: h/15,
                    child: TextFormField(
                      controller: _addMemberController.pincodeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        hintText: 'pincode',
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter pincode';
                      //   }
                      //   return null;
                      // },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NextButton(onTap: (){

                        Get.to((const RegisterUser3()));}, text: "Fill Membership Details", h: h/18, w: w/1.5),
                    ],
                  ),

                ],
              ),
           ),
          )
    );
  }
}
