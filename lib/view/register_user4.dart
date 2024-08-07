import 'dart:async';

import 'package:dsa_app/controller/controller.dart';
import 'package:dsa_app/view/approval_form.dart';
import 'package:dsa_app/view/widgets/appbar.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:dsa_app/view/widgets/next_button.dart';
import 'package:dsa_app/view/widgets/pdf_generator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../controller/addMember_controller.dart';
import '../controller/approvalForm_controller.dart';

class RegisterUser4 extends StatefulWidget {
  const RegisterUser4({super.key});

  @override
  State<RegisterUser4> createState() => _RegisterUser4State();
}

class _RegisterUser4State extends State<RegisterUser4> {
  int _selectedValue = 1;
  final int adminCharge = 12000;
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  late final int emi;
  bool _showAdditionalFields = false;
  final ApprovalFormController approvalFormController = Get.put(ApprovalFormController());
  Timer? _debounce;

  var payment = [
    'Select',
    'Card',
    'Online',
    'Cheque',
    'Cash',
    'Other/Multiple',
  ];
  var items = [
    'Select',
    '1',
    '2',
    '3',
    '4',
  ];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _addMemberController.adminController?.text = adminCharge.toString();
    _addMemberController.totalCostController?.addListener(() {
      updatePurchasePrice();
    });
    _addMemberController.initialPayController?.addListener(() {
      updateBalance();
    });
    _addMemberController.noOfEmiController?.addListener(() {
      updateEmi();
    });
    _addMemberController.nightStayController?.addListener((){
      updateDaysAndNights();
    });
  }
void updateDaysAndNights(){
    if(_addMemberController.nightStayController!.text.isNotEmpty){
      try{
        final night = int.parse(_addMemberController.nightStayController!.text);
        final days= night+1;
        _addMemberController.dayStayController!.text = days.toString();
      } catch (e) {
        _addMemberController.dayStayController!.text ='';
      }
    } else {
      _addMemberController.dayStayController!.text ='';
    }
}
  void updatePurchasePrice() {
    if (_addMemberController.totalCostController!.text.isNotEmpty) {
      try {
        final totalCost =
            int.parse(_addMemberController.totalCostController!.text);
        final purchasePrice = totalCost - adminCharge;
        _addMemberController.purchaseController!.text =
            purchasePrice.toString();
      } catch (e) {
        // Handle error (e.g., non-numeric input)
        _addMemberController.purchaseController!.text = '';
      }
    } else {
      _addMemberController.balanceController!.text = '';
    }
  }

  void updateBalance() {
    if (_addMemberController.initialPayController!.text.isNotEmpty) {
      try {
        final totalCost =
            int.parse(_addMemberController.totalCostController!.text);
        final initialPayment =
            int.parse(_addMemberController.initialPayController!.text);
        final balance = totalCost - initialPayment;
        _addMemberController.balanceController!.text = balance.toString();
      } catch (e) {
        // Handle error (e.g., non-numeric input)
        _addMemberController.balanceController!.text = '';
      }
    } else {
      _addMemberController.balanceController!.text = '';
    }
  }

  void updateEmi() {
    if (_addMemberController.balanceController!.text.isNotEmpty &&
        _addMemberController.noOfEmiController!.text.isNotEmpty) {
      try {
        final balance =
            double.parse(_addMemberController.balanceController!.text);
        final noOfEmi =
            double.parse(_addMemberController.noOfEmiController!.text);

        if (noOfEmi != 0) {
          // Ensure no division by zero
          final emi = balance / noOfEmi;
          _addMemberController.emiController!.text =
              emi.toStringAsFixed(2); // Format to 2 decimal places
        } else {
          // Handle case where number of EMIs is zero
          _addMemberController.emiController!.text = '';
        }
      } catch (e) {
        // Handle error (e.g., non-numeric input)
        print('Error updating EMI: $e');
        _addMemberController.emiController!.text = '';
      }
    } else {
      _addMemberController.emiController!.text = '';
    }
  }

  // @override
  // void dispose() {
  //   totalCostController.dispose();
  //   purchaseController.dispose();
  //   adminController.dispose();
  //   balanceController.dispose();
  //   emiController.dispose();
  //   super.dispose();
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
              child: const Image(
                image: AssetImage('assets/logo.png'),
                height: 70,
                width: 70,
              )),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Payment Details ",
                  size: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Total Cost",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.totalCostController,
                    //readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Purchase Price",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.purchaseController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                      //labelText: "${totalCostController.text.isNotEmpty ? int.parse(totalCostController.text) - adminCharge : ''}",
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Admin Charges",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.adminController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                      // labelText: adminCharge.toString()
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "First Year AMC",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.firstAmcController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '0',
                      // labelText: adminCharge.toString()
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w / 2.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Round Off Amount",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: w / 1.1,
                              height: h / 15,
                              child: TextFormField(
                                controller:
                                    _addMemberController.roundOffController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  hintText: '',
                                  // labelText: adminCharge.toString()
                                ),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return '*';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w / 2.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Pre Amount",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: w / 1.1,
                              height: h / 15,
                              child: TextFormField(
                                controller:
                                    _addMemberController.preAmoController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  hintText: '',
                                  // labelText: adminCharge.toString()
                                ),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return '*';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // AppText(text: "Round Off Amount", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                // SizedBox(height: 6,),
                // Container(
                //   width: w / 1.1,
                //   height: h/15,
                //   child: TextFormField(
                //     controller: roundOffController,
                //     readOnly: true,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                //       ),
                //       hintText: '',
                //      // labelText: adminCharge.toString()
                //     ),
                //     // validator: (value) {
                //     //   if (value == null || value.isEmpty) {
                //     //     return '*';
                //     //   }
                //     //   return null;
                //     // },
                //   ),
                // ),
                // SizedBox(height: 10,),
                // AppText(text: "Pre Amount", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                // SizedBox(height: 6,),
                // Container(
                //   width: w / 1.1,
                //   height: h/15,
                //   child: TextFormField(
                //     controller: preAmoController,
                //     readOnly: true,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                //       ),
                //       hintText: '',
                //      // labelText: adminCharge.toString()
                //     ),
                //     // validator: (value) {
                //     //   if (value == null || value.isEmpty) {
                //     //     return '*';
                //     //   }
                //     //   return null;
                //     // },
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Initial Payment",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.initialPayController,
                    //readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                      // labelText: adminCharge.toString()
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Mode Of Initial Payment ",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  width: w / 1.1,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButtonFormField(
                    alignment: AlignmentDirectional.center,
                    decoration: const InputDecoration(border: InputBorder.none),
                    value: _addMemberController.dropdownPayment,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                    ),
                    items: payment.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _addMemberController.dropdownPayment = newValue!;
                        _showAdditionalFields =
                            _addMemberController.dropdownPayment ==
                                'Other/Multiple';
                      });
                    },
                    // validator: (value){
                    //   if(value==null || value.isEmpty){
                    //     return "*";
                    //   }
                    //   else {
                    //     return "";
                    //   }
                    //},
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
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
                      controller: _addMemberController.otherCardController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      controller: _addMemberController.otherOnlineController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      controller: _addMemberController.otherChequeController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      controller: _addMemberController.otherCashController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                const SizedBox(
                  height: 10,
                ),

                AppText(
                  text: "Balance",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.balanceController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                      // labelText: adminCharge.toString()
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w / 2.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "No of EMIs",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: w / 1.1,
                              height: h / 15,
                              child: TextFormField(
                                controller:
                                    _addMemberController.noOfEmiController,
                                //readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  hintText: '',
                                  // labelText: adminCharge.toString()
                                ),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return '*';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: w / 2.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "EMI",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: w / 1.1,
                              height: h / 15,
                              child: TextFormField(
                                controller: _addMemberController.emiController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  hintText: '',
                                  // labelText: adminCharge.toString()
                                ),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return '*';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "EMI Start Date",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.emiDateInput,
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
                          _addMemberController.emiDateInput?.text =
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
                    // validator: (value){
                    //   if(value==null || value.isEmpty){
                    //     return "Please Select Date";
                    //   }
                    //   else {
                    //     return "";
                    //   }
                    //},
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Manager Name",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.managerNameController,
                    //readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                      //labelText: "${totalCostController.text.isNotEmpty ? int.parse(totalCostController.text) - adminCharge : ''}",
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Rep Name",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 15,
                  child: TextFormField(
                    controller: _addMemberController.repNameController,
                    //readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                      //labelText: "${totalCostController.text.isNotEmpty ? int.parse(totalCostController.text) - adminCharge : ''}",
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _addMemberController.specialOffer,
                      onChanged: (bool? value) {
                        setState(() {
                          _addMemberController.specialOffer = value ?? false;
                        });
                      },
                    ),
                    const Expanded(
                      child: Text(
                        "Special Offer (Check it if any)",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                _addMemberController.specialOffer == true
                    ? Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Destination (City Name Only)",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: w / 1.1,
                              height: h / 15,
                              child: TextFormField(
                                controller:
                                    _addMemberController.destinationController,
                                //readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  hintText: '',
                                  //labelText: "${totalCostController.text.isNotEmpty ? int.parse(totalCostController.text) - adminCharge : ''}",
                                ),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return '*';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: "Stay :",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: w / 2.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: "Nights",
                                          size: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        SizedBox(
                                          width: w / 1.1,
                                          height: h / 15,
                                          child: TextFormField(
                                            controller: _addMemberController
                                                .nightStayController,
                                            //readOnly: true,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              hintText: '',
                                              // labelText: adminCharge.toString()
                                            ),
                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return '*';
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 2.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: "Days",
                                          size: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        SizedBox(
                                          width: w / 1.1,
                                          height: h / 15,
                                          child: TextFormField(
                                            controller: _addMemberController
                                                .dayStayController,
                                            readOnly: true,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              hintText: '',
                                              // labelText: adminCharge.toString()
                                            ),
                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return '*';
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: "Occupancy :",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: w / 2.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: "Adults",
                                          size: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        SizedBox(
                                          width: w / 1.1,
                                          height: h / 15,
                                          child: TextFormField(
                                            controller: _addMemberController
                                                .adultOccupancyController,
                                            //readOnly: true,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              hintText: '',
                                              // labelText: adminCharge.toString()
                                            ),
                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return '*';
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: w / 2.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text: "Child (Below 8 yrs)",
                                          size: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87,
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        SizedBox(
                                          width: w / 1.1,
                                          height: h / 15,
                                          child: TextFormField(
                                            controller: _addMemberController
                                                .childOccupancyController,
                                            readOnly: true,
                                            decoration: const InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              hintText: '',
                                              // labelText: adminCharge.toString()
                                            ),
                                            // validator: (value) {
                                            //   if (value == null || value.isEmpty) {
                                            //     return '*';
                                            //   }
                                            //   return null;
                                            // },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        width: 1, color: Colors.black45)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: "Includes :",
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: _addMemberController
                                                .onlyAccomodation,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _addMemberController
                                                        .onlyAccomodation =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Only Accomodation",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                          child: AppText(
                                        text: "OR",
                                        size: 16,
                                        fontWeight: FontWeight.bold,
                                        color: blue,
                                      )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: _addMemberController
                                                .accomodation,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _addMemberController
                                                        .accomodation =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Accomodation",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Checkbox(
                                            value:
                                                _addMemberController.breakfast,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _addMemberController.breakfast =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Breakfast",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ), //accomodation breakfast
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value: _addMemberController.dinner,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _addMemberController.dinner =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Dinner",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Checkbox(
                                            value: _addMemberController
                                                .sightSeeing,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _addMemberController
                                                        .sightSeeing =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Sight Seeing",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ), // dinner sight seeing
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Checkbox(
                                            value:
                                                _addMemberController.airTicket,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                _addMemberController.airTicket =
                                                    value ?? false;
                                              });
                                            },
                                          ),
                                          const Expanded(
                                            child: Text(
                                              "Air Ticket",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      ), //airticket
                                      _addMemberController.airTicket == true
                                          ? Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AppText(
                                                          text:
                                                              "No. of Air Tickets",
                                                          size: 15),
                                                      Container(
                                                        width: w / 2,
                                                        //height: h/18,
                                                        child:
                                                            DropdownButtonFormField(
                                                          //itemHeight: 30,
                                                          decoration:
                                                              const InputDecoration(
                                                                  border:
                                                                      OutlineInputBorder()),
                                                          value:
                                                              _addMemberController
                                                                  .dropdownTicket,
                                                          icon: const Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              size: 16),
                                                          onChanged: (String?
                                                              newValue) {
                                                            setState(() {
                                                              _addMemberController
                                                                      .dropdownTicket =
                                                                  newValue!;
                                                            });
                                                          },
                                                          items: items.map<
                                                              DropdownMenuItem<
                                                                  String>>((String
                                                              valueItem) {
                                                            return DropdownMenuItem(
                                                              value: valueItem,
                                                              child: Text(
                                                                  valueItem),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Row(
                                                          children: [
                                                            Radio<int>(
                                                              value: 1,
                                                              groupValue:
                                                                  _selectedValue,
                                                              onChanged:
                                                                  (int? value) {
                                                                setState(() {
                                                                  _selectedValue =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                            Text('One Way'),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                20), // Add some spacing between the options
                                                        Row(
                                                          children: [
                                                            Radio<int>(
                                                              value: 2,
                                                              groupValue:
                                                                  _selectedValue,
                                                              onChanged:
                                                                  (int? value) {
                                                                setState(() {
                                                                  _selectedValue =
                                                                      value!;
                                                                });
                                                              },
                                                            ),
                                                            Text('Return'),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //
                                                ],
                                              ),
                                            )
                                          : Container(),
                                      AppText(
                                        text:
                                            "Balance Amount To Be Collected Against Offer :",
                                        size: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                        width: w / 1.1,
                                        height: h / 15,
                                        child: TextFormField(
                                          controller: _addMemberController
                                              .balanceOfferController,
                                          //readOnly: true,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                            ),
                                            hintText: '',
                                            //labelText: "${totalCostController.text.isNotEmpty ? int.parse(totalCostController.text) - adminCharge : ''}",
                                          ),
                                          // validator: (value) {
                                          //   if (value == null || value.isEmpty) {
                                          //     return '*';
                                          //   }
                                          //   return null;
                                          // },
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: "Validity:",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: w / 1.1,
                              height: h / 15,
                              child: TextFormField(
                                controller: _addMemberController
                                    .validityOfferController,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                  hintText:
                                      'Six Month from the date of membership.',
                                  //labelText: "${totalCostController.text.isNotEmpty ? int.parse(totalCostController.text) - adminCharge : ''}",
                                ),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return '*';
                                //   }
                                //   return null;
                                // },
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                AppText(
                  text: "Remarks",
                  size: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                const SizedBox(
                  height: 6,
                ),
                SizedBox(
                  width: w / 1.1,
                  height: h / 11,
                  //color: Colors.pinkAccent,
                  child: TextFormField(
                    controller: _addMemberController.remarkController,
                    //readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                      //labelText: "${totalCostController.text.isNotEmpty ? int.parse(totalCostController.text) - adminCharge : ''}",
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return '*';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
                Obx(() {
                  return _addMemberController.isLoading.value
                      ? CircularProgressIndicator()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NextButton(
                              onTap: () {
                                if (_debounce?.isActive ?? false) _debounce?.cancel();
                                _debounce = Timer(const Duration(milliseconds: 300), () async {
                                  if (isLoading) return; // Prevent multiple taps

                                  setState(() {
                                    isLoading = true;
                                  });

                                  try {
                                    print("Starting to add member...");

                                    // Add member
                                    bool memberAdded = await _addMemberController.checkAddMember();
                                    if (memberAdded) {
                                      print("Member added successfully.");

                                      // Delay to simulate some waiting time before fetching approval form
                                      await Future.delayed(Duration(seconds: 2));

                                      // Fetch approval form
                                      bool success = await approvalFormController.fetchApprovalForm();
                                      if (success) {
                                        print("addmember: ${approvalFormController.getjobdetailbyidModel?.data?.member1Dob}");
                                        print("modelApproval: ${approvalFormController.getjobdetailbyidModel}");
                                        await Get.to(() => ApprovalForm());
                                      } else {
                                        Get.snackbar("Error", "Failed to fetch approval form. Please try again.");
                                      }
                                    } else {
                                      Get.snackbar("Error", "Failed to add member. Please try again.");
                                    }
                                  } catch (e) {
                                    Get.snackbar("Error", "An error occurred. Please try again.");
                                  } finally {
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                });
                              },
                              // onTap: () async {
                              //   if (isLoading) return; // Prevent multiple taps
                              //
                              //   setState(() {
                              //     isLoading = true;
                              //   });
                              //
                              //   try {
                              //     print("Starting to add member...");
                              //
                              //     // Add member
                              //     bool memberAdded = await _addMemberController.checkAddMember();
                              //     if (memberAdded) {
                              //       print("Member added successfully.");
                              //
                              //       // Delay to simulate some waiting time before fetching approval form
                              //       await Future.delayed(Duration(seconds: 2));
                              //
                              //       // Fetch approval form
                              //       bool success = await approvalFormController.fetchApprovalForm();
                              //       if (success) {
                              //         print("addmember: ${approvalFormController.getjobdetailbyidModel?.data?.member1Dob}");
                              //         print("modelApproval: ${approvalFormController.getjobdetailbyidModel}");
                              //         await Get.to(() => ApprovalForm());
                              //       } else {
                              //         Get.snackbar("Error", "Failed to fetch approval form. Please try again.");
                              //       }
                              //     } else {
                              //       Get.snackbar("Error", "Failed to add member. Please try again.");
                              //     }
                              //   } catch (e) {
                              //     Get.snackbar("Error", "An error occurred. Please try again.");
                              //   } finally {
                              //     setState(() {
                              //       isLoading = false;
                              //     });
                              //   }
                              // },
                              text: "Submit",
                              h: h / 18,
                              w: w / 2.3,
                            ),

                            // NextButton(
                            //   onTap: () async {
                            //     if (isLoading) return; // Prevent multiple taps
                            //
                            //     setState(() {
                            //       isLoading = true;
                            //     });
                            //
                            //     try {
                            //       print("Starting to add member...");
                            //
                            //       // Add member
                            //       bool memberAdded = await _addMemberController.checkAddMember();
                            //       if (memberAdded) {
                            //         print("Member added successfully.");
                            //
                            //         // Fetch approval form
                            //         bool success = await approvalFormController.fetchApprovalForm();
                            //         if (success) {
                            //           print("addmember: ${approvalFormController.getjobdetailbyidModel?.data?.member1Dob}");
                            //           print("modelApproval: ${approvalFormController.getjobdetailbyidModel}");
                            //         await  Get.to(() => ApprovalForm());
                            //         } else {
                            //           Get.snackbar("Error", "Failed to fetch approval form. Please try again.");
                            //         }
                            //       } else {
                            //         Get.snackbar("Error", "Failed to add member. Please try again.");
                            //       }
                            //     } catch (e) {
                            //       Get.snackbar("Error", "An error occurred. Please try again.");
                            //     } finally {
                            //       setState(() {
                            //         isLoading = false;
                            //       });
                            //     }
                            //   },
                            //   text: "Submit",
                            //   h: h / 18,
                            //   w: w / 2.3,
                            // ),




                            // NextButton(
                            //     onTap: () async {
                            //       if (isLoading) return; // Prevent multiple taps
                            //
                            //       setState(() {
                            //         isLoading = true;
                            //       });
                            //
                            //       try {
                            //         print("final addMember");
                            //
                            //         // Add member
                            //         await _addMemberController.checkAddMember();
                            //         print("Member added successfully.");
                            //
                            //         // Fetch approval form
                            //         bool success = await approvalFormController.fetchApprovalForm();
                            //         if (success) {
                            //           print("addmember:${approvalFormController.getjobdetailbyidModel?.data?.member1Dob}");
                            //           print("modelApproval:${approvalFormController.getjobdetailbyidModel}");
                            //           Get.to(() => ApprovalForm());
                            //         } else {
                            //           Get.snackbar("Error", "Failed to Add Members. Please try again.");
                            //         }
                            //       } catch (e) {
                            //         Get.snackbar("Error", "An error occurred. Please try again.");
                            //       } finally {
                            //         setState(() {
                            //           isLoading = false;
                            //         });
                            //       }
                            //       //  print("final addMember");
                            //       //
                            //       // await _addMemberController.checkAddMember();
                            //       //  bool success = await approvalFormController.fetchApprovalForm();
                            //       //  if (success) {
                            //       //    // approvalFormController.fetchApprovalForm();
                            //       //    print("addmember:${approvalFormController.getjobdetailbyidModel?.data?.member1Dob}");
                            //       //    print("modelApproval:${approvalFormController.getjobdetailbyidModel}");
                            //       //    Get.to(()=> ApprovalForm());
                            //       //  } else {
                            //       //    // Handle failure to save signatures
                            //       //    Get.snackbar("Error", "Failed to Add Members. Please try again.");
                            //       //  }
                            //     },
                            //     text: "Submit",
                            //     h: h / 18,
                            //     w: w / 2.3),
                            NextButton(
                                onTap: () {
                                  print("final addMember");
                                  approvalFormController.fetchApprovalForm();
                                  // _addMemberController.checkAddMember();
                                  Get.to(() => const PdfPreviewPage());
                                },
                                text: "Preview",
                                h: h / 18,
                                w: w / 2.3),
                          ],
                        );

                }),
    // if (isLoading)
    // Container(
    // color: Colors.black.withOpacity(0.5),
    // child: Center(
    // child: CircularProgressIndicator(),
    // ))
                //CircleAvatar(child: IconButton(onPressed: (){Get.to(()=> PdfPreviewPage("text"));}, icon: Icon(Icons.picture_as_pdf_outlined)),)
              ],
            ),

          ),
        ));
  }
}
