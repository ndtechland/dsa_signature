import 'package:dsa_app/controller/controller.dart';
import 'package:dsa_app/controller/generateMaf_controller.dart';
import 'package:dsa_app/controller/login_controller.dart';
import 'package:dsa_app/view/onHoldMember4.dart';
import 'package:dsa_app/view/register_user4.dart';
import 'package:dsa_app/view/widgets/appbar.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:dsa_app/view/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/addMember_controller.dart';
import '../controller/getMembersOnHoldList_controller.dart';
import '../controller/membersOnHold_controller.dart';
import '../controller/newUserHolding_controller.dart';
class OnHoldMember3 extends StatefulWidget {
  const OnHoldMember3({super.key});

  @override
  State<OnHoldMember3> createState() => _OnHoldMember3State();
}

class _OnHoldMember3State extends State<OnHoldMember3> {
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  final GenerateMafController _generateMafController = Get.put(GenerateMafController());
  final LoginController _loginController = Get.put(LoginController());
  final GetMembersOnHoldListController _onHoldListController = Get.put(GetMembersOnHoldListController());
  final NewuserholdingController _newuserholdingController = Get.put(NewuserholdingController());
  final MembersOnHoldController membersOnHoldController = Get.put(MembersOnHoldController());

  String dropdown = 'Select';
  String dropdowntype = 'Regular';
  String dropdownseason = 'Premium';
  String dropdownApartment = 'Select';
  var tenure = [
    'Select',
    '5',
    '10',
    '30',
  ];
  var type = [
    'Regular',
  ];
  var season = [
    'Premium',
    'Executive',
  ];
  var apartment = [
    'Select',
    'Studio',
    '1 Bedroom',
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
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: "Membership Details ", size: 28,fontWeight: FontWeight.bold,color: Colors.black,),
                const SizedBox(height: 10,),
                AppText(text: "Tenure", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
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
                    value: membersOnHoldController.dropdownTenure,
                    icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                    items: tenure.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: const TextStyle(fontSize: 14),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        membersOnHoldController.dropdownTenure = newValue!;
                        if ( membersOnHoldController.dropdownTenure != 'Select') {
                          int yearsToAdd = int.parse( membersOnHoldController.dropdownTenure);
                          DateTime newDate = DateTime.now().add(Duration(days: 365 * yearsToAdd));
                          String formattedDate = DateFormat('yyyy-MM-dd').format(newDate);
                          membersOnHoldController.validityController?.text = formattedDate;
                        } else {
                          membersOnHoldController.validityController?.text = '';
                        }
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
                const SizedBox(height: 10,),
                AppText(text: "Validity", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.validityController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '10/2/2024 12:00:00 AM',
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          membersOnHoldController.validityController?.text = formattedDate;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                AppText(text: "Type", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
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
                    value: membersOnHoldController.dropdownType,
                    icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                    items: type.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: const TextStyle(fontSize: 14),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        membersOnHoldController.dropdownType = newValue!;
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
                const SizedBox(height: 10,),
                AppText(text: "Season", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
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
                    value: membersOnHoldController.dropdownSeason,
                    icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                    items: season.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: const TextStyle(fontSize: 14),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        membersOnHoldController.dropdownSeason = newValue!;
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
                const SizedBox(height: 10,),
                AppText(text: "Apartment", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
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
                    value: membersOnHoldController.dropdownApartment,
                    icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                    items: apartment.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items,style: const TextStyle(fontSize: 14),),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        membersOnHoldController.dropdownApartment = newValue!;
                        if (membersOnHoldController.dropdownApartment == 'Studio') {
                          membersOnHoldController.occupancyController?.text ="2 ADULTS 2 KIDS (Below 8 yrs)";
                          membersOnHoldController.amcController?.text="8500";
                        } else if (membersOnHoldController.dropdownApartment == '1 Bedroom') {
                          membersOnHoldController.occupancyController?.text ="4 ADULTS 2 KIDS (Below 8 yrs)";
                          membersOnHoldController.amcController?.text="14000";
                        } else {
                          membersOnHoldController.occupancyController?.text = '';
                        }
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
                const SizedBox(height: 10,),
                AppText(text: "Occupancy", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.occupancyController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                AppText(text: "AMC(Amount) + GST", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.amcController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                AppText(text: "AMC(1st Due Date) ", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.amcDueController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '10/2/2024 12:00:00 AM',
                    ),
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          membersOnHoldController.amcDueController?.text = formattedDate;
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                AppText(text: "DSA-Code) ", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: _loginController.usernameController1,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                AppText(text: "EMP-Code) ", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.empCodeController,
                    // readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                AppText(text: "RCI-Enrollment ", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                const SizedBox(height: 6,),
                SizedBox(
                  width: w / 1.1,
                  height: h/15,
                  child: TextFormField(
                    controller: membersOnHoldController.rciController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      hintText: '',
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NextButton(onTap: (){Get.to((const OnHoldMember4()));}, text: "Payment Details", h: h/18, w: w/1.5),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
