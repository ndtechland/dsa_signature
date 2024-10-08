import 'dart:math';

import 'package:dsa_app/controller/addMember_controller.dart';
import 'package:dsa_app/controller/userName_controller.dart';
import 'package:dsa_app/model/getMembersOnHoldList_model.dart';
import 'package:dsa_app/view/register_user2.dart';
import 'package:dsa_app/view/widgets/appbar.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:dsa_app/view/widgets/next_button.dart';
import 'package:dsa_app/view/widgets/register_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../../controller/generateMaf_controller.dart';
import '../../controller/getMembersOnHoldList_controller.dart';
import '../../controller/mafList_controller.dart';
import '../../controller/membersOnHold_controller.dart';
import '../../controller/newUserHolding_controller.dart';
import '../../model/mafList_model.dart';
import '../onHoldMember2.dart';


class OnHoldAddMember extends StatefulWidget {
  final MemberData selectedMember;
  const OnHoldAddMember({super.key, required this.selectedMember});

  @override
  State<OnHoldAddMember> createState() => _OnHoldAddMemberState();
}

class _OnHoldAddMemberState extends State<OnHoldAddMember> {
  final GenerateMafController _controller = Get.put(GenerateMafController());
  final MemberController _memberController = Get.put(MemberController());
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  final UserNameController _userNameController = Get.put(UserNameController());
  final GetMembersOnHoldListController _onHoldListController = Get.put(GetMembersOnHoldListController());
  final NewuserholdingController _newuserholdingController = Get.put(NewuserholdingController());
  final MembersOnHoldController membersOnHoldController = Get.put(MembersOnHoldController());

  String dropdownvalue1 = 'Select';
  String dropdownvalue2 = 'Select';

  final List<String> prefix1 = ['Select', 'MR', 'MS', 'MRS'];
  final List<String> prefix2 = ['Select', 'MR', 'MS', 'MRS'];


  String? selectedGuestId;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    resetDropdownValues();
    _onHoldListController.dropdownvalue= widget.selectedMember.mafNumber;
    (_addMemberController.userNameController?.text = _userNameController.resultUserName.value)!;
    print("userName:${_addMemberController.userNameController}");
    print("userName:${_userNameController.resultUserName}");
    print("userName:${_userNameController.userName}");
    print("userName:${_addMemberController.userNameController?.text}");

  }

  void resetDropdownValues() {
    setState(() {
      //dropdownvalue = 'Select';
      dropdownvalue1 = 'Select';
      dropdownvalue2 = 'Select';
      // nameController1.clear();
      // numberController1.clear();
      // dateInput.clear();
      // dateInput1.clear();
      // nameController2.clear();
    });
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
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: Container(
              decoration: const BoxDecoration(
                // color: Colors.white,
              ),
              child: const Image(image:AssetImage('assets/logo.png'),height: 70,width: 70,)),
          centerTitle: true,
        ),
        body: Obx(() {
          if(membersOnHoldController.isLoading.value && _userNameController.isLoading.value){
            return Center(child: CircularProgressIndicator());
          }
          else{
            membersOnHoldController.userNameController?.text = _userNameController.resultUserName.value;
            return SingleChildScrollView(
              child: Form(
                key: membersOnHoldController.membersOnHoldFormKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 2, 18, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: "Register User", size: 28, fontWeight: FontWeight.bold, color: Colors.black),
                      //const SizedBox(height: 10),
                      Obx( ()
                      {  if (_userNameController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(text: "Username :", size: 18, fontWeight: FontWeight.w500, color: Colors.black87),
                            SizedBox(width: 10,),
                            Container(
                              width: w / 3,
                              height: h / 18,
                              //color:Colors.pink,
                              child: TextFormField(
                                controller: membersOnHoldController.userNameController,
                                readOnly: true,
                                style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17
                                ),
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(
                                      borderSide: BorderSide.none
                                  ),
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                  hintText: 'Member Name',
                                ),
                              ),
                            ),
                          ],
                        );}
                      }
                      ),
                      const SizedBox(height: 10),
                      AppText(text: "GuestID", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                      const SizedBox(height: 6),
                      // SizedBox(
                      //   width: w/1.1,
                      //   height: h/15,
                      //   child: ,
                      // ),
                      // Obx(
                      //       () {
                      //     if (_memberController.isLoading.value) {
                      //       return const Center(child: CircularProgressIndicator());
                      //     } else {
                      //       String initialValue = _memberController.dropdownvalue;
                      //       if (_memberController.members.isNotEmpty &&
                      //           !_memberController.members.any((member) => member.mafNumber == initialValue)) {
                      //         initialValue = 'Select'; // Reset to 'Select' if initial value doesn't match
                      //       }
                      //       return DropdownButtonFormField<String>(
                      //         alignment: Alignment.centerLeft,
                      //         decoration: const InputDecoration(border: OutlineInputBorder()),
                      //         value: initialValue.isNotEmpty ? initialValue : null,
                      //         icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                      //         items: [
                      //           DropdownMenuItem<String>(
                      //             value: 'Select',
                      //             child: const Text(
                      //               'Select',
                      //               style: TextStyle(fontSize: 14),
                      //             ),
                      //           ),
                      //           ..._memberController.members.map((Dataa member) {
                      //             return DropdownMenuItem<String>(
                      //               value: member.mafNumber.toString(),
                      //               child: Text(
                      //                 member.mafNumber.toString(),
                      //                 style: const TextStyle(fontSize: 14),
                      //               ),
                      //             );
                      //           }).toList(),
                      //         ],
                      //         onChanged: (String? newValue) {
                      //           setState(() {
                      //             _memberController.dropdownvalue = newValue!;
                      //             var selectedMember = _memberController.members.firstWhere(
                      //                   (member) => member.mafNumber.toString() == _memberController.dropdownvalue,
                      //               orElse: () => Dataa(id: 0, memberName: '', mobileNumber: '', approvalNumber: 0, craeteDate: '', welcomeFormNumber: null, isMember: false, mafNumber: '', dsaCode: '', status: '', preName: '', isAdd: null),
                      //             );
                      //             _controller.nameController.text = selectedMember.memberName ?? '';
                      //             _controller.numberController.text = selectedMember.mobileNumber ?? '';
                      //             _controller.dateInput.text = selectedMember.craeteDate??"";
                      //             _controller.dropdownvalue = selectedMember.preName;
                      //           });
                      //         },
                      //         // validator: (value) {
                      //         //   if (value == null || value.isEmpty) {
                      //         //     return "*";
                      //         //   } else {
                      //         //     return null;
                      //         //   }
                      //         // },
                      //       );
                      //     }
                      //   },
                      // ),
                      Container(
                        alignment: Alignment.centerLeft,
                          width: w / 1.1,
                          height: h / 15,
                          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.black54),
                          borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text(
                            widget.selectedMember.mafNumber),
                          )),
                      // Obx(() {
                      //   if (_onHoldListController.isLoading.value) {
                      //     return Center(child: CircularProgressIndicator());
                      //   } else {
                      //     // Ensure dropdownvalue is part of the items
                      //     String initialValue = _onHoldListController.dropdownvalue;
                      //     if (_onHoldListController.members.isNotEmpty &&
                      //         !_onHoldListController.members.any((member) => member.mafNumber == initialValue)) {
                      //       initialValue = 'Select'; // Reset to 'Select' if initial value doesn't match
                      //     }
                      //
                      //     return DropdownButtonFormField<String>(
                      //       decoration: const InputDecoration(border: OutlineInputBorder()),
                      //       value: initialValue.isNotEmpty && initialValue != 'Select' ? initialValue : null,
                      //       icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                      //       items: [
                      //         DropdownMenuItem<String>(
                      //           value: 'Select',
                      //           child: const Text(
                      //             'Select',
                      //             style: TextStyle(fontSize: 14),
                      //           ),
                      //         ),
                      //         ..._onHoldListController.members.map((MemberData member) {
                      //           return DropdownMenuItem<String>(
                      //             value: member.mafNumber,
                      //             child: Text(
                      //               member.mafNumber,
                      //               style: const TextStyle(fontSize: 14),
                      //             ),
                      //           );
                      //         }).toList(),
                      //       ], onChanged: (String? value) {  },
                      //       // onChanged: (String? newValue) {
                      //       //   setState(() {
                      //       //     _memberController.dropdownvalue = newValue ?? 'Select';
                      //       //     if (_memberController.dropdownvalue != 'Select') {
                      //       //       var selectedMember = _memberController.members.firstWhere(
                      //       //             (member) => member.mafNumber == _memberController.dropdownvalue,
                      //       //         orElse: () => Dataa(
                      //       //           id: 0,
                      //       //           memberName: '',
                      //       //           mobileNumber: '',
                      //       //           approvalNumber: 0,
                      //       //           craeteDate: '',
                      //       //           welcomeFormNumber: null,
                      //       //           isMember: false,
                      //       //           mafNumber: '',
                      //       //           dsaCode: '',
                      //       //           status: '',
                      //       //           preName: '',
                      //       //           isAdd: null,
                      //       //         ),
                      //       //       );
                      //       //       _controller.nameController.text = selectedMember.memberName;
                      //       //       _controller.numberController.text = selectedMember.mobileNumber;
                      //       //       _controller.dateInput.text = selectedMember.craeteDate;
                      //       //       _controller.dropdownvalue = selectedMember.preName;
                      //       //     }
                      //       //   });
                      //       // },
                      //     );
                      //   }
                      // }),
                      const SizedBox(height: 10),
                      AppText(text: "Date of Joining", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: w / 1.1,
                        height: h / 15,
                        child: TextFormField(
                          controller: membersOnHoldController.dateOfJoining,
                          readOnly: true,
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
                                membersOnHoldController.dateOfJoining?.text = formattedDate;
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                            hintText: '01/07/2024',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Please Select Date";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                      //RegisterContainer(text: dateTime.toString(), h: h / 18, w: w / 1.1),
                      const SizedBox(height: 10),
                      AppText(text: "Date of Holding", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: w / 1.1,
                        height: h / 15,
                        child: TextFormField(
                          controller: membersOnHoldController.dateOfHolding,
                          readOnly: true,
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
                                membersOnHoldController.dateOfHolding?.text = formattedDate;
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                            hintText: '01/07/2024',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Please Select Date";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                      //RegisterContainer(text: dateTime.toString(), h: h / 18, w: w / 1.1),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(text: "Prefix", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                                Container(
                                  width: w / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: DropdownButtonFormField(
                                    alignment: AlignmentDirectional.center,
                                    decoration: const InputDecoration(border: InputBorder.none),
                                    value: _newuserholdingController.dropdownvalue1,
                                    icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                                    items: prefix1.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items, style: const TextStyle(fontSize: 14)),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _newuserholdingController.dropdownvalue1 = newValue!;
                                      });
                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return "*";
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w / 1.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(text: "Member 1", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: w / 1.5,
                                  height: h / 15,
                                  child: TextFormField(
                                    controller: _newuserholdingController.nameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                      hintText: 'Member Name',
                                    ),
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'Please enter guest name';
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
                      const SizedBox(height: 10),
                      AppText(text: "Member 1 DOB", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: w / 1.1,
                        height: h / 15,
                        child: TextFormField(
                          controller: membersOnHoldController.dob1,
                          readOnly: true,
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
                                membersOnHoldController.dob1?.text = formattedDate;
                              });
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                            hintText: '01/07/2024',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return "Please Select Date";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppText(text: "Mobile Number 1", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: w / 1.1,
                        height: h / 15,
                        child: TextFormField(
                          controller: _newuserholdingController.mobileController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                            hintText: 'Enter Mobile Number',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter a mobile number';
                          //   } else if (value.length != 10) {
                          //     return 'Only 10 digit phone number allowed';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: w / 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(text: "Prefix", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                                Container(
                                  width: w / 4,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: DropdownButtonFormField(
                                    alignment: AlignmentDirectional.center,
                                    decoration: const InputDecoration(border: InputBorder.none),
                                    value: membersOnHoldController.dropdownvalue2,
                                    icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                                    items: prefix2.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items, style: const TextStyle(fontSize: 14)),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        membersOnHoldController.dropdownvalue2 = newValue!;
                                      });
                                    },
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return "*";
                                    //   } else {
                                    //     return null;
                                    //   }
                                    // },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: w / 1.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(text: "Member 2", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: w / 1.5,
                                  height: h / 15,
                                  child: TextFormField(
                                    controller: membersOnHoldController.nameController2,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                      hintText: 'Member Name',
                                    ),
                                    // validator: (value) {
                                    //   if (value == null || value.isEmpty) {
                                    //     return 'Please enter guest name';
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
                      const SizedBox(height: 10),
                      AppText(text: "Mobile Number 2", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: w / 1.1,
                        height: h / 15,
                        child: TextFormField(
                          controller: membersOnHoldController.numberController2,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                            hintText: 'Enter Mobile Number',
                          ),
                          // validator: (value) {
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter a mobile number';
                          //   } else if (value.length != 10) {
                          //     return 'Only 10 digit phone number allowed';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                      const SizedBox(height: 10),

                      Center(
                        child: NextButton(onTap: () {
                          print("add member");
                          // _addMemberController.checkAddMember();
                          // if (_controller.registerformkey.currentState!.validate()) {
                          Get.to(const OnHoldMember2());
                          // }
                        }, text: "Next", h: h/17, w: w/2)
                        // ElevatedButton(
                        //   style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
                        //   onPressed: () {
                        //     print("add member");
                        //     // _addMemberController.checkAddMember();
                        //     // if (_controller.registerformkey.currentState!.validate()) {
                        //     Get.to(const OnHoldMember2());
                        //     // }
                        //   },
                        //   child: const Text("Next"),
                        // ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          }})

    );
  }
}