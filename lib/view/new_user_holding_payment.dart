
import 'package:dsa_app/controller/controller.dart';
import 'package:dsa_app/view/widgets/appbar.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:dsa_app/view/widgets/date_container.dart';
import 'package:dsa_app/view/widgets/next_button.dart';
import 'package:dsa_app/view/widgets/register_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/newUserHolding_controller.dart';
class NewUserHoldingPayment extends StatefulWidget {
  const NewUserHoldingPayment({super.key});

  @override
  State<NewUserHoldingPayment> createState() => _NewUserHoldingPaymentState();
}

class _NewUserHoldingPaymentState extends State<NewUserHoldingPayment> {
  DateTime dateTime = DateTime.now();
  NewuserholdingController newuserholdingController = Get.put(NewuserholdingController());
  bool _showAdditionalFields = false;
  //String dropdownvalue2 = 'Select';
  var prefix1 = [
    'Select',
    'MR',
    'MS',
    'MRS',
  ];
  var payment = [
    'Select',
    'Card',
    'Online',
    'Cheque',
    'Cash',
    'Other/Multiple',
  ];
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
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 2, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: "New User Holding Payment", size: 25,fontWeight: FontWeight.bold,color: Colors.black,),
                      const SizedBox(height: 15,),
                      AppText(text: "Date", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                      const SizedBox(height: 6,),
                      DateContainer(h: h/18, w: w/1.1, controller: newuserholdingController.dateHolding, firstDate: DateTime(1950), lastDate: DateTime(2100), hintText: "${DateTime.now()}"),
                     // RegisterContainer(text: dateTime.toString(), h: h/18, w: w/1.1),
                      const SizedBox(height: 10,),
                      Container(
                        //color: Colors.pink,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: w / 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(text: "Prefix", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                                  const SizedBox(height: 6,),
                                  Container(
                                    width: w / 4,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: DropdownButtonFormField(
                                      alignment: AlignmentDirectional.center,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none
                                      ),
                                      value: newuserholdingController.dropdownvalue1,
                                      icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                                      items: prefix1.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items,style: const TextStyle(fontSize: 14),),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          newuserholdingController.dropdownvalue1 = newValue!;
                                        });
                                      },
                                      // validator: (value){
                                      //   if(value==null || value.isEmpty){
                                      //     return "*";
                                      //   }
                                      //   else {
                                      //     return "";
                                      //   }
                                      // },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //SizedBox(width: 10,),
                            SizedBox(
                              //color: Colors.pink,
                              width: w / 1.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(text: "Name", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                                  const SizedBox(height: 6,),
                                  SizedBox(
                                    width: w / 1.5,
                                    height: h/15,
                                    child: TextFormField(
                                      controller: newuserholdingController.nameController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        ),
                                        hintText: 'Member Name',
                                      ),
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return 'Please enter name';
                                      //   }
                                      //   return null;
                                      // },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      AppText(text: "Email", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                      const SizedBox(height: 6,),
                      SizedBox(
                        width: w / 1.1,
                        height: h/15,
                        child: TextFormField(
                          controller: newuserholdingController.emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            hintText: 'Email',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter email';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      AppText(text: "Mobile No.", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                      const SizedBox(height: 6,),
                      SizedBox(
                        width: w / 1.1,
                        height: h/15,
                        child: TextFormField(
                          controller: newuserholdingController.mobileController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            hintText: 'Enter Mobile Number',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter Number';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      AppText(text: "Amount", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                      const SizedBox(height: 6,),
                      SizedBox(
                        width: w / 1.1,
                        height: h/15,
                        child: TextFormField(
                          controller: newuserholdingController.amountController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                            hintText: 'Amount',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Amount';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      AppText(text: "Mode Of Initial Payment ", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                      const SizedBox(height: 6,),
                      Container(
                        width: w / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: DropdownButtonFormField(
                          alignment: AlignmentDirectional.center,
                          decoration: const InputDecoration(
                              border: InputBorder.none
                          ),
                          value: newuserholdingController.dropdownPayment,
                          icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                          items: payment.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,style: const TextStyle(fontSize: 14),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              newuserholdingController.dropdownPayment = newValue!;
                              _showAdditionalFields =
                                  newuserholdingController.dropdownPayment == 'Other/Multiple';
                            });
                          },
                          // validator: (value){
                          //   if(value==null || value.isEmpty){
                          //     return "*";
                          //   }
                          //   else {
                          //     return "";
                          //   }
                          // },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      if (_showAdditionalFields) ...[
                        AppText(
                          text: "Card",
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: w / 1.1,
                          height: h / 15,
                          child: TextFormField(
                            controller: newuserholdingController.otherCardController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                              ),
                              //hintText: 'Additional Payment Mode 1',
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Additional Payment Mode 1';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: "Online",
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: w / 1.1,
                          height: h / 15,
                          child: TextFormField(
                            controller: newuserholdingController.otherOnlineController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                              ),
                            //  hintText: 'Additional Payment Mode 2',
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Additional Payment Mode 2';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: "Cheque",
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: w / 1.1,
                          height: h / 15,
                          child: TextFormField(
                            controller: newuserholdingController.otherChequeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                              ),
                             // hintText: 'Additional Payment Mode 3',
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Additional Payment Mode 3';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: "Cash",
                          size: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: w / 1.1,
                          height: h / 15,
                          child: TextFormField(
                            controller: newuserholdingController.otherCashController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                              ),
                              //hintText: 'Additional Payment Mode 4',
                            ),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Please enter Additional Payment Mode 4';
                            //   }
                            //   return null;
                            // },
                          ),
                        ),
                      ],
                      const SizedBox(height: 10,),
                      Center(child: NextButton(onTap: (){
                        print("submit new user");
                        newuserholdingController.postNewUserHolding();
                        print("added Successfully");
                      }, text: "Submit", h: h/15, w: w/2))
                    ],
                  ),
                ),
              ),
            )

    );
  }
}
