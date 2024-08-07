import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/approvalFormHoldMem_controller.dart';
import '../controller/approvalForm_controller.dart';
import '../controller/generateMaf_controller.dart';
import 'package:dsa_app/constant.dart';
import 'package:dsa_app/view/approval_form2.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'aprovalFormHoldMem2.dart';

class ApprovalFormHoldMem extends StatefulWidget {
  const ApprovalFormHoldMem({super.key});

  @override
  State<ApprovalFormHoldMem> createState() => _ApprovalFormHoldMemState();
}

class _ApprovalFormHoldMemState extends State<ApprovalFormHoldMem> {
  final GenerateMafController _controller = Get.put(GenerateMafController());
  final ApprovalFormHoldMemberController approvalFormHoldController = Get.put(ApprovalFormHoldMemberController());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: blue, size: 28),
          ),
          title: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: const Image(
              image: AssetImage('assets/logo.png'),
              height: 70,
              width: 70,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.white,
        //   leading: IconButton(
        //       icon:Icon(Icons.arrow_back_outlined,color: Colors.black,),
        //     onPressed: () { Get.back(); },
        //   ),
        //   title: Text("Membership & Approval Form",
        //     style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 22,
        //         color: blue
        //     ),),
        // ),
        body: Obx(() {
          if(approvalFormHoldController.isLoading.value ){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 20.0),
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     IconButton(
                        //             icon:const Icon(Icons.arrow_back_outlined,color: Colors.black,),
                        //           onPressed: () { Get.back(); },
                        //         ),
                        //     Container(
                        //       width: w/4,
                        //       height: h/22,
                        //       decoration: const BoxDecoration(
                        //         //color: Colors.pink,
                        //         image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.contain)
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 10,),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: gold,width: 1)
                            ),
                            child: const Text("Membership & Approval Form On Hold",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.white
                              ),),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),


                        Obx(() {
                          if(_controller.isLoading.value){
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Row(
                              children: [
                                AppText(text: "S. No.:  ", size: 18,color: blue,),
                                AppText(text: "${approvalFormHoldController.approvalFormModel?.data!.approvalNumber.toString()}/${_controller.dsaCode.value}/${_controller.guestIdController.text}", size: 18,fontWeight: FontWeight.bold,)
                              ],
                            );}}
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppText(text: "Date: ", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.dateOfJoining.toString()}",style: TextStyle(
                                    fontSize: 16,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(text: "Main Applicant:", size: 17,color: blue,),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.memberName1.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(text: "DOB :", size: 17,color: blue,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0,top: 3),
                                  child: Container(
                                    decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                    child: Text(
                                      "${approvalFormHoldController.approvalFormModel?.data?.member1Dob.toString()}",style: TextStyle(
                                      fontSize: 17,fontWeight: FontWeight.w500,
                                      //decoration: TextDecoration.underline,

                                    ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "Co-Applicant:", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.memberName2.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    // decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "DOB :", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.member2Dob.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "Address :", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.address.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "Pincode :", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.pincode.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "Mobile No.1 :", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.mobile1.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                            // Expanded(
                            //   child: SizedBox(
                            //       //width: w/2,
                            //       height: h/20,
                            //       //color: Colors.pinkAccent,
                            //       child: TextField(
                            //         controller: _controller.numberController,
                            //       )),
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "Mobile No.2 :", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.mobile2.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "Ph(Resi) :", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.mobile1.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AppText(text: "Email Id:", size: 17,color: blue,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0,top: 3),
                                child: Container(
                                  decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                  child: Text(
                                    "${approvalFormHoldController.approvalFormModel?.data?.email.toString()}",style: TextStyle(
                                    fontSize: 17,fontWeight: FontWeight.w500,
                                    //decoration: TextDecoration.underline,

                                  ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: w/5,
                              height: h/17,
                              decoration: BoxDecoration(
                                color: gold,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextButton(onPressed: (){Get.to(const ApprovalFormHoldMem2());}, child: const Text("Next",style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );}})
    );
  }
}
