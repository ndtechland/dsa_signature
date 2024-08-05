import 'package:dsa_app/controller/addMember_controller.dart';
import 'package:dsa_app/controller/userName_controller.dart';
import 'package:dsa_app/view/register_user2.dart';
import 'package:dsa_app/view/widgets/appbar.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:dsa_app/view/widgets/register_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';

import '../controller/controller.dart';
import '../controller/generateMaf_controller.dart';
import '../controller/mafList_controller.dart';
import '../model/mafList_model.dart';
import 'generateMafGREList.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final GenerateMafController _controller = Get.put(GenerateMafController());
  final MemberController _memberController = Get.put(MemberController());
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  final UserNameController _userNameController = Get.put(UserNameController());

  String dropdownvalue1 = 'Select';
  String dropdownvalue2 = 'Select';

  final List<String> prefix1 = ['Select', 'MR', 'MS', 'MRS'];
  final List<String> prefix2 = ['Select', 'MR', 'MS', 'MRS'];



  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    resetDropdownValues();
    _addMemberController.userNameController?.text = _userNameController.resultUserName.value;
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
        if(_addMemberController.isLoading.value && _userNameController.isLoading.value){
          return Center(child: CircularProgressIndicator());
        }
        else{
          _addMemberController.userNameController?.text = _userNameController.resultUserName.value;
      return SingleChildScrollView(
                child: Form(
                  key: _addMemberController.addMemberFormKey,
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
                                  controller: _addMemberController.userNameController,
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
                                  // validator: (value) {
                                  //   if (value == null || value.isEmpty) {
                                  //     return 'Please enter guest name';
                                  //   }
                                  //   return null;
                                  // },
                                ),
                              ),
                              // Container(
                              //   height: 100,
                              //   width: 200,
                              //   child: TextField(
                              //     controller: _addMemberController.userNameController,
                              //     readOnly: true,
                              //   ),
                              // )
                            ],
                          );}
                        }
                        ),
                        const SizedBox(height: 10),
                        AppText(text: "GuestID", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                        const SizedBox(height: 6),
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
                        Obx(() {
                          if (_memberController.isLoading.value) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            // Ensure dropdownvalue is part of the items
                            String initialValue = _memberController.dropdownvalue;
                            if (_memberController.members.isNotEmpty &&
                                !_memberController.members.any((member) => member.mafNumber == initialValue)) {
                              initialValue = 'Select'; // Reset to 'Select' if initial value doesn't match
                            }

                            return DropdownButtonFormField<String>(
                              decoration: const InputDecoration(border: OutlineInputBorder()),
                              value: initialValue.isNotEmpty && initialValue != 'Select' ? initialValue : null,
                              icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Select',
                                  child: const Text(
                                    'Select',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                ..._memberController.members.map((MafListData member) {
                                  return DropdownMenuItem<String>(
                                    value: member.mafNumber,
                                    child: Text(
                                      member.mafNumber,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  );
                                }).toList(),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  _memberController.dropdownvalue = newValue ?? 'Select';
                                  if (_memberController.dropdownvalue != 'Select') {
                                    var selectedMember = _memberController.members.firstWhere(
                                          (member) => member.mafNumber == _memberController.dropdownvalue,
                                      orElse: () => MafListData(
                                        id: 0,
                                        memberName: '',
                                        mobileNumber: '',
                                        approvalNumber: 0,
                                        craeteDate: '',
                                        welcomeFormNumber: null,
                                        isMember: false,
                                        mafNumber: '',
                                        dsaCode: '',
                                        status: '',
                                        preName: '',
                                        isAdd: null,
                                      ),
                                    );
                                    _controller.nameController.text = selectedMember.memberName;
                                    _controller.numberController.text = selectedMember.mobileNumber;
                                    _controller.dateInput.text = selectedMember.craeteDate;
                                    _controller.dropdownvalue = selectedMember.preName;
                                  }
                                });
                              },
                            );
                          }
                        }),
                        const SizedBox(height: 10),
                        AppText(text: "Date of Joining", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                        const SizedBox(height: 6),
                        SizedBox(
                          width: w / 1.1,
                          height: h / 15,
                          child: TextFormField(
                            controller: _controller.dateInput,
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
                                  _controller.dateInput.text = formattedDate;
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
                                      value: _controller.dropdownvalue,
                                      icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                                      items: prefix1.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items, style: const TextStyle(fontSize: 14)),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _controller.dropdownvalue = newValue!;
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
                                      controller: _controller.nameController,
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
                            controller: _addMemberController.dob1,
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
                                  _addMemberController.dob1?.text = formattedDate;
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
                            controller: _controller.numberController,
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
                                      value: _addMemberController.dropdownvalue2,
                                      icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                                      items: prefix2.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: Text(items, style: const TextStyle(fontSize: 14)),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _addMemberController.dropdownvalue2 = newValue!;
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
                                      controller: _addMemberController.nameController2,
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
                            controller: _addMemberController.numberController2,
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
                        AppText(text: "Member 2 DOB", size: 16,fontWeight: FontWeight.w500,color: Colors.black87,),
                        const SizedBox(height: 6,),
                        SizedBox(
                          width: w / 1.1,
                          height: h/15,
                          child: TextFormField(
                            controller: _addMemberController.dob2,
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
                                  _addMemberController.dob2?.text =
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
                        const SizedBox(height: 10),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(minimumSize: const Size(200, 50)),
                            onPressed: () {
                              print("add member");
                             // _addMemberController.checkAddMember();
                              // if (_controller.registerformkey.currentState!.validate()) {
                                Get.to(const RegisterUser2());
                              // }
                            },
                            child: const Text("Submit"),
                          ),
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