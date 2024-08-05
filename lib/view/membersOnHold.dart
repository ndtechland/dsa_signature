import 'package:dsa_app/controller/addMember_controller.dart';
import 'package:dsa_app/controller/generateMaf_controller.dart';
import 'package:dsa_app/controller/getMembersOnHoldList_controller.dart';
import 'package:dsa_app/model/getMembersOnHoldList_model.dart';
import 'package:dsa_app/view/register_user.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:dsa_app/view/widgets/onHoldAddMember.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/membersOnHold_controller.dart';
import '../controller/newUserHolding_controller.dart';

class MembersOnHold extends StatefulWidget {
  const MembersOnHold({super.key});

  @override
  State<MembersOnHold> createState() => _MembersOnHoldState();
}

class _MembersOnHoldState extends State<MembersOnHold> {
  final GetMembersOnHoldListController _getMembersOnHold = Get.put(GetMembersOnHoldListController());
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  final GenerateMafController _controller = Get.put(GenerateMafController());
  final MembersOnHoldController _membersOnHoldController = Get.put(MembersOnHoldController());
  final NewuserholdingController _newuserholdingController = Get.put(NewuserholdingController());

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        title: const Image(
          image: AssetImage('assets/logo.png'),
          height: 70,
          width: 70,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          children: [
            AppText(
              text: "Members On Hold",
              size: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            Obx(() {
              if (_getMembersOnHold.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                // Ensure dropdownvalue is part of the items
                String initialValue = _getMembersOnHold.dropdownvalue;
                if (_getMembersOnHold.members.isNotEmpty &&
                    !_getMembersOnHold.members.any((member) => member.name == initialValue)) {
                  initialValue = 'Select'; // Reset to 'Select' if initial value doesn't match
                }

                return DropdownButtonFormField<String>(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  value: initialValue.isNotEmpty ? initialValue : null,
                  icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'Select',
                      child: const Text(
                        'Select',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    ..._getMembersOnHold.members.map((MemberData member) {
                      return DropdownMenuItem<String>(
                        value: member.name,
                        child: Text(
                          member.name,
                          style: const TextStyle(fontSize: 14),
                        ),
                      );
                    }).toList(),
                  ],
                  onChanged: (String? newValue) {
                    setState(() {
                      _getMembersOnHold.dropdownvalue = newValue ?? '';
                      if (_getMembersOnHold.dropdownvalue.isNotEmpty && _getMembersOnHold.dropdownvalue != 'Select') {
                        var selectedMember = _getMembersOnHold.members.firstWhere(
                              (member) => member.name == _getMembersOnHold.dropdownvalue,
                          orElse: () => MemberData(
                            id: 0,
                            mobileNumber: "",
                            name: "",
                            email: "",
                            amount: 0,
                            mop: '',
                            isSeen: false,
                            createDate: '',
                            recieptNumber: 0,
                            otherCash: null,
                            otherCheque: null,
                            otherCard: null,
                            otherOnline: null,
                            preName: '',
                            dsaCode: '',
                            mafNumber: '',
                          ),
                        );

                        _newuserholdingController.nameController.text = selectedMember.name;
                        _newuserholdingController.mobileController.text = selectedMember.mobileNumber;
                        _newuserholdingController.dateHolding.text = selectedMember.createDate.toString();
                        _newuserholdingController.dropdownvalue1 = selectedMember.preName;
                        _membersOnHoldController.emailController?.text = selectedMember.email.toString();
                        _membersOnHoldController.preAmoController?.text = selectedMember.amount.toString();
                        _membersOnHoldController.dropdownPayment = selectedMember.mop;
                        Get.to(() => OnHoldAddMember(selectedMember: selectedMember,));

                      }
                    });
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

