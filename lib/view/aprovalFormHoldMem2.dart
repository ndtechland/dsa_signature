import 'package:flutter/material.dart';
import 'package:dsa_app/constant.dart';
import 'package:dsa_app/controller/sign_controller.dart';
import 'package:dsa_app/view/approval_form3.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:get/get.dart';
import '../controller/approvalFormHoldMem_controller.dart';
import '../controller/approvalForm_controller.dart';
import '../controller/controller.dart';
import '../controller/generateMaf_controller.dart';
import 'aprovalFormHoldMem3.dart';
class ApprovalFormHoldMem2 extends StatefulWidget {
  const ApprovalFormHoldMem2({super.key});

  @override
  State<ApprovalFormHoldMem2> createState() => _ApprovalFormHoldMem2State();
}

class _ApprovalFormHoldMem2State extends State<ApprovalFormHoldMem2> {
  final GenerateMafController _controller = Get.put(GenerateMafController());
  final ApprovalFormHoldMemberController approvalFormHoldController = Get.put(ApprovalFormHoldMemberController());
  final SignatureController _signatureController = Get.put(SignatureController());
  // String formatDate(String? dateStr) {
  //   if (dateStr == null) return '';
  //   try {
  //     DateTime dateTime = DateTime.parse(dateStr);
  //     return DateFormat('yyyy-MM-dd').format(dateTime); // Change the format as per your requirement
  //   } catch (e) {
  //     return dateStr; // If parsing fails, return the original string
  //   }
  // }
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
      body: SingleChildScrollView(
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
                  //       icon:const Icon(Icons.arrow_back_outlined,color: Colors.black,),
                  //       onPressed: () { Get.back(); },
                  //     ),
                  //     Container(
                  //       width: w/4,
                  //       height: h/22,
                  //       decoration: const BoxDecoration(
                  //         //color: Colors.pink,
                  //           image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.contain)
                  //       ),
                  //     ),
                  //     AppText(text: "Date: ", size: 16,color: Colors.black,)
                  //   ],
                  // ),
                  const SizedBox(height: 10,),
                  Table(
                    border: TableBorder.all(width: 1,color: Colors.black),
                    children: [
                      TableRow(
                          children: [
                            Container(
                              color: gold,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("RESORT",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("STGC",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            Container(
                              color: gold,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("APPT TYPE",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("${approvalFormHoldController.approvalFormModel?.data?.apartment.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            Container(
                              color: gold,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("OCCUPANCY",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("PERSON",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            Container(
                              color: gold,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("TENTURE(Yrs)",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("${approvalFormHoldController.approvalFormModel?.data?.tenure.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            Container(
                              color: gold,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("	No.OF WEEKS/YEAR",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("${approvalFormHoldController.approvalFormModel?.data?.offerStayNights==null?"":approvalFormHoldController.approvalFormModel?.data?.offerStayNights.toString()}/${approvalFormHoldController.approvalFormModel?.data?.offerStayDays==null?"":approvalFormHoldController.approvalFormModel?.data?.offerStayDays.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr),
                            ),
                          ]
                      ),
                      TableRow(
                          children: [
                            Container(
                              color: gold,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("	SEASON TYPE",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("${approvalFormHoldController.approvalFormModel?.data?.season.toString()}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),textDirection: TextDirection.ltr),
                            ),
                          ]
                      ),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    children: [
                      AppText(text: "AMC Amount :", size: 17,color: blue,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 3),
                          child: Container(
                            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                            child: Text(
                              "${approvalFormHoldController.approvalFormModel?.data?.amcAmount.toString()}",style: TextStyle(
                              fontSize: 17,fontWeight: FontWeight.w500,
                              // decoration: TextDecoration.underline,

                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      AppText(text: "AMC DUE DATE :", size: 17,color: blue,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 3),
                          child: Container(
                            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                            child: Text(
                              "${approvalFormHoldController.approvalFormModel?.data?.amcDueDate?.toString()}",style: TextStyle(
                              fontSize: 17,fontWeight: FontWeight.w500,
                              //decoration: TextDecoration.underline,

                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      AppText(text: "MEMBERSHIP PRICE :", size: 17,color: blue,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 3),
                          child: Container(
                            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                            child: Text(
                              "${approvalFormHoldController.approvalFormModel?.data?.purchasePrice.toString()}",style: TextStyle(
                              fontSize: 17,fontWeight: FontWeight.w500,
                              // decoration: TextDecoration.underline,

                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      AppText(text: "ADMIN FEE :", size: 18,color: blue,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 3),
                          child: Container(
                            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                            child: Text(
                              "${approvalFormHoldController.approvalFormModel?.data?.adminCharges.toString()}",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.w500,
                              //decoration: TextDecoration.underline,

                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      AppText(text: "TOTAL AMOUNT :", size: 18,color: blue,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 3),
                          child: Container(
                            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                            child: Text(
                              "${approvalFormHoldController.approvalFormModel?.data?.totalCost.toString()}",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.w500,

                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      AppText(text: "INITIAL DEPOSIT :", size: 18,color: blue,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 3),
                          child: Container(
                            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                            child: Text(
                              "${approvalFormHoldController.approvalFormModel?.data?.initialPayment.toString()}",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.w500,
                              //decoration: TextDecoration.underline,

                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      AppText(text: "BALANCE AMOUNT :", size: 18,color: blue,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0,top: 3),
                          child: Container(
                            decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                            child: Text(
                              "${approvalFormHoldController.approvalFormModel?.data?.balance.toString()}",style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.w500,
                              //decoration: TextDecoration.underline,

                            ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     AppText(text: "AMC DUE DATE :", size: 16),
                  //     Expanded(
                  //       child: SizedBox(
                  //         //width: w/2,
                  //           height: h/20,
                  //           //color: Colors.pinkAccent,
                  //           child: TextField(
                  //             controller: amcController,
                  //           )),
                  //     )
                  //   ],
                  // ),
                  const SizedBox(height: 25,),
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
                        child: TextButton(onPressed: (){
                          _signatureController.saveSignatures();
                          Get.to(const ApprovalFormHoldMem3());
                        }, child: const Text("Next",style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),)),
                      ),
                      // CircleAvatar(
                      //   radius: 25,
                      //   backgroundColor: Colors.grey[300],
                      //   child: IconButton(onPressed: (){Get.to(ApprovalForm2());}, icon: Icon(Icons.arrow_forward_rounded,color: Colors.black87,)),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
