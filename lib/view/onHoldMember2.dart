import 'package:dsa_app/controller/controller.dart';
import 'package:dsa_app/view/onHoldMember3.dart';
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
import '../controller/getMembersOnHoldList_controller.dart';
import '../controller/membersOnHold_controller.dart';
import '../controller/newUserHolding_controller.dart';

class OnHoldMember2 extends StatefulWidget {
  const OnHoldMember2({super.key});

  @override
  State<OnHoldMember2> createState() => _OnHoldMember2State();
}

class _OnHoldMember2State extends State<OnHoldMember2> {
  final GenerateMafController _controller = Get.put(GenerateMafController());
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  final GetMembersOnHoldListController _onHoldListController = Get.put(GetMembersOnHoldListController());
  final NewuserholdingController _newuserholdingController = Get.put(NewuserholdingController());
  final MembersOnHoldController membersOnHoldController = Get.put(MembersOnHoldController());

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
                const SizedBox(height: 10),
                AppText(text: "Member 2 DOB", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.dob2,
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          membersOnHoldController.dob2?.text =
                              formattedDate; //set output date to TextField value.
                        });
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '01/07/2024',
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                AppText(text: "Address", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.addressController,
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
                    controller: membersOnHoldController.residenceController,
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
                    controller: _newuserholdingController.emailController,
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
                    controller: membersOnHoldController.cityController,
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
                    controller: membersOnHoldController.pincodeController,
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

                      Get.to((const OnHoldMember3()));}, text: "Fill Membership Details", h: h/18, w: w/1.5),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }
}
