import 'dart:typed_data';

import 'package:dsa_app/constant.dart';
import 'package:dsa_app/controller/getDocument_controller.dart';
import 'package:dsa_app/sign.dart';
import 'package:dsa_app/view/documentScreen.dart';
import 'package:dsa_app/view/signature.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/approvalForm_controller.dart';
import '../controller/controller.dart';
import '../controller/sign_controller.dart';

class ApprovalForm3 extends StatefulWidget {
  const ApprovalForm3({super.key});

  @override
  State<ApprovalForm3> createState() => _ApprovalForm3State();
}

class _ApprovalForm3State extends State<ApprovalForm3> {
  Uint8List? _signature1;
  Uint8List? _signature2;
  final ApprovalFormController approvalFormController = Get.put(ApprovalFormController());
  final SignatureController signController = Get.put(SignatureController());
  final GetDocumentController getDocumentController = Get.put(GetDocumentController());

  void showSignatureDialog(BuildContext context, int signatureNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Sign(
              onSignComplete: (signature) {
                signController.setSignature(signatureNumber, signature);
                Navigator.of(context).pop(); // Close the dialog after signing
              },
            ),
          ),
        );
      },
    );
  }

  void _showSignatureDialog(int signatureNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Sign(
              onSignComplete: (signature) {
                setState(() {
                  if (signatureNumber == 1) {
                    _signature1 = signature;
                  } else {
                    _signature2 = signature;
                  }
                });
              },
            ),
          ),
        );
      },
    );
  }

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
      body: GetBuilder<SignatureController>(
        builder: (controller) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     IconButton(
                      //       icon: const Icon(
                      //         Icons.arrow_back_outlined,
                      //         color: Colors.black,
                      //       ),
                      //       onPressed: () {
                      //         Get.back();
                      //       },
                      //     ),
                      //     Container(
                      //       width: w / 4,
                      //       height: h / 22,
                      //       decoration: const BoxDecoration(
                      //           //color: Colors.pink,
                      //           image: DecorationImage(
                      //               image: AssetImage("assets/logo.png"),
                      //               fit: BoxFit.contain)),
                      //     ),
                      //     AppText(
                      //       text: "Date: ",
                      //       size: 16,
                      //       color: Colors.black,
                      //     )
                      //   ],
                      // ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: w / 1 / 1,
                        height: h / 20,
                        decoration: BoxDecoration(
                            color: gold,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: const Text(
                          "INITIAL PAYMENT MODE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Table(
                          border: TableBorder.all(width: 1, color: Colors.black),
                          children:  [
                            // TableRow(
                            //   children: [
                            //     Container(
                            //       color: gold,
                            //       child: Padding(
                            //         padding: const EdgeInsets.all(8.0),
                            //         child: Text("INITIAL PAYMENT MODE",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr),
                            //       ),
                            //     ),
                            //   ]
                            // ),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("S.NO.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("1",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("AMOUNT",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("${approvalFormController.getjobdetailbyidModel?.data?.initialPayment.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("MODE",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("${approvalFormController.getjobdetailbyidModel?.data?.modeOfPayment.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("DATE",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("${approvalFormController.getjobdetailbyidModel?.data?.dateOfJoining.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: w / 1 / 1,
                        height: h / 20,
                        decoration: BoxDecoration(
                            color: gold,
                            border: Border.all(color: Colors.black, width: 1)),
                        child: const Text(
                          "BALANCE PAYMENT MODE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Table(
                          border: TableBorder.all(width: 1, color: Colors.black),
                          children:  [
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("S.NO.",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("1",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("AMOUNT (X) NO OF EMI's",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("${approvalFormController.getjobdetailbyidModel?.data?.numberOfEmi.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("MODE",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("${approvalFormController.getjobdetailbyidModel?.data?.modeOfPayment.toString()}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                            TableRow(children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("DATE",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textDirection: TextDirection.ltr),
                              ),
                            ]),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: w / 1.1,
                        height: h / 12,
                        decoration:  BoxDecoration(
                            border:Border.all(color: Colors.black) ,
                           borderRadius: BorderRadius.circular(6)
                           // hintText: "Membership Offer/ Remark (If Any).."),
                        ),
                        child: Text(
                          "${approvalFormController.getjobdetailbyidModel?.data?.offerIncludeRemark.toString()}",
                        ),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.black,width: 1)
                        // ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Sign: ", size: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => showSignatureDialog(context, 1),
                                child: Container(
                                  height: h / 12,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: controller.signature1 == null
                                      ? Center(child: Text('Tap to sign'))
                                      : Image.memory(controller.signature1!),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: Container(
                            //     //width: w/2,
                            //     height: h / 10,
                            //     decoration: BoxDecoration(
                            //         //color: Colors.grey[200],
                            //         border:
                            //             Border.all(color: Colors.black, width: 1),
                            //         borderRadius: BorderRadius.circular(4)),
                            //     child: GestureDetector(
                            //       onTap: () => _showSignatureDialog(1),
                            //       child: _signature1 == null
                            //           ? const Center(child: Text('Tap to sign'))
                            //           : Image.memory(_signature1!),
                            //     ),
                            //   ),
                            // ),
                            AppText(text: "(Applicant)", size: 16),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(text: "Sign: ", size: 16),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => showSignatureDialog(context, 2),
                                child: Container(
                                  height: h / 12,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: controller.signature2 == null
                                      ? Center(child: Text('Tap to sign'))
                                      : Image.memory(controller.signature2!),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: Container(
                            //     //width: w/2,
                            //     height: h / 10,
                            //     decoration: BoxDecoration(
                            //         //color: Colors.grey[200],
                            //         border:
                            //             Border.all(color: Colors.black, width: 1),
                            //         borderRadius: BorderRadius.circular(4)),
                            //     child: GestureDetector(
                            //       onTap: () => _showSignatureDialog(2),
                            //       child: _signature2 == null
                            //           ? const Center(child: Text('Tap to sign'))
                            //           : Image.memory(_signature2!),
                            //     ),
                            //   ),
                            // ),
                            AppText(text: "(Co-Applicant)", size: 16),
                          ]),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          AppText(text: "Consultant Name:", size: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0,top: 3),
                              child: Container(
                                decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                child: Text(
                                  "${approvalFormController.getjobdetailbyidModel?.data?.repName.toString()}",style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.w500,
                                  // decoration: TextDecoration.underline,

                                ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15,),
                      AppText(text: "MANAGER NAME & SIGN :", size: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0,top: 3),
                              child: Container(
                                decoration: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.black)),
                                child: Text(
                                  "${approvalFormController.getjobdetailbyidModel?.data?.managerName.toString()}",style: TextStyle(
                                  fontSize: 17,fontWeight: FontWeight.w500,
                                  // decoration: TextDecoration.underline,

                                ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => showSignatureDialog(context, 3),
                              child: Container(
                                height: h / 12,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black, width: 1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: controller.signature3 == null
                                    ? Center(child: Text('Tap to sign'))
                                    : Image.memory(controller.signature3!),
                              ),
                            ),
                          ),
                          // Expanded(
                          //   child: SizedBox(
                          //       //width: w/2,
                          //       height: h / 20,
                          //       //color: Colors.pinkAccent,
                          //       child: TextField(
                          //         controller: amcController,
                          //       )),
                          // )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   width: w / 3,
                          //   height: h / 17,
                          //   decoration: BoxDecoration(
                          //     color: blue,
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   child: TextButton(
                          //       onPressed: () {
                          //         print("sign");
                          //         Get.to(()=>Signature());
                          //       },
                          //       child: const Text(
                          //         "Sign Here",
                          //         style:
                          //             TextStyle(color: Colors.white, fontSize: 15),
                          //       )),
                          // ),
                          // SizedBox(width: 10,),
                          Container(
                            width: w / 5,
                            height: h / 17,
                            decoration: BoxDecoration(
                              color: blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton(
                              onPressed: () async {
                                print("print document");
                                print("fetch document");
                                bool success = await signController.saveSignatures();
                                if (success) {
                                  getDocumentController.fetchDocument();
                                  print("sign:${signController.signature1}");
                                  Get.to(() => DocumentScreen());
                                } else {
                                  // Handle failure to save signatures
                                  Get.snackbar("Error", "Failed to save signatures. Please try again.");
                                }
                              },
                              child: const Text(
                                "Print",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
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
          );
        }
      ),
    );
  }
}
