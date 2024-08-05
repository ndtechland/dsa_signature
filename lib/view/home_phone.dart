import 'package:dsa_app/constant.dart';
import 'package:dsa_app/controller/addMember_controller.dart';
import 'package:dsa_app/controller/getMembersOnHoldList_controller.dart';
import 'package:dsa_app/controller/mafList_controller.dart';
import 'package:dsa_app/controller/profile_controller.dart';
import 'package:dsa_app/controller/userName_controller.dart';
import 'package:dsa_app/model/getMembersOnHoldList_model.dart';
import 'package:dsa_app/view/generateMafGREList.dart';
import 'package:dsa_app/view/membersOnHold.dart';
import 'package:dsa_app/view/new_user_holding_payment.dart';
import 'package:dsa_app/view/profile.dart';
import 'package:dsa_app/view/register_user.dart';
import 'package:dsa_app/view/signature.dart';
import 'package:dsa_app/view/widgets/home_container.dart';
import 'package:dsa_app/view/widgets/slider_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/approvalForm_controller.dart';
import '../controller/generateMaf_controller.dart';
import '../controller/getGenerateMaf_controller.dart';
import '../model/mafList_model.dart';
import 'gen_manualy.dart';
class PhoneHome extends StatefulWidget {
  const PhoneHome({super.key});

  @override
  State<PhoneHome> createState() => _PhoneHomeState();
}

class _PhoneHomeState extends State<PhoneHome> {
  ProfileController profileController = Get.put(ProfileController());
  MemberController _memberController = Get.put(MemberController());
  final MafController mafController = Get.put(MafController());
  final UserNameController userNameController = Get.put(UserNameController());
  final GetMembersOnHoldListController getMembersOnHoldListController = Get.put(GetMembersOnHoldListController());
  final ApprovalFormController approvalFormController = Get.put(ApprovalFormController());
  final AddMemberController _addMemberController = Get.put(AddMemberController());
  final GenerateMafController generateMafcontroller = Get.put(GenerateMafController());

  bool amcDueAfter90Days = false;
  bool nonRci = false;
  bool withRci = false;
  String dropdown = 'Select';
  var items = [
    'Select',
    '3 year',
    '5 year',
    '10 year',
  ];

  @override
  void initState() {
    super.initState();
    _fetchMembers();
    _fetchMembersOnHold();
  }

  Future<void> _fetchMembers() async {
    // Replace this with your API call to fetch member data
    List<MafListData> members = await _memberController.members(); // Adjust method name as per your implementation
    _memberController.members.value = members;
  }
  Future<void> _fetchMembersOnHold() async {
    // Replace this with your API call to fetch member data
    List<MemberData> members = await getMembersOnHoldListController.members(); // Adjust method name as per your implementation
    getMembersOnHoldListController.members.value = members;
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // ),

      body: OrientationBuilder(
        builder: (context, orientation) {
      return LayoutBuilder(
          builder: (context, constraints) {
            var screenWidth = constraints.maxWidth;
            var screenHeight = constraints.maxHeight;

            // Define sizes based on orientation
            var imageWidth = orientation == Orientation.portrait
                ? screenWidth * 0.9
                : screenWidth * 0.9;
            var imageHeight = orientation == Orientation.portrait
                ? screenHeight * 0.2
                : screenHeight * 0.5;

            var categoryWidth = orientation == Orientation.portrait
                ? screenWidth * 1.0
                : screenWidth * 1.0;
            var categoryHeight = orientation == Orientation.portrait
                ? screenHeight * 0.12
                : screenHeight * 0.20;

            var textFieldWidth = orientation == Orientation.portrait
                ? screenWidth * 0.84
                : screenWidth * 0.87;
            var textFieldHeight = orientation == Orientation.portrait
                ? screenHeight * 0.15
                : screenHeight * 0.4;

            var iconSize = orientation == Orientation.portrait
                ? screenWidth * 0.08
                : screenWidth * 0.04;

            var textSize = orientation == Orientation.portrait
                ? screenWidth * 0.06
                : screenWidth * 0.03;
            var radiusSize = orientation == Orientation.portrait
                ? screenWidth * 0.08
                : screenWidth * 0.04;
           return SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    SliderBanner(
                      h: imageHeight,
                      w: imageWidth,
                    ),
                    SizedBox(height: 15,),
                    HomeContainer(onTap: () async {
                      await mafController.fetchMafNumber();
                      await Get.to(const GenerateManualy());
                      // showDialog(context: context, builder: (context) {
                      //   return StatefulBuilder(builder: (context, setState) {
                      //     return AlertDialog(
                      //       content: SizedBox(
                      //         height: h * 0.2,
                      //         child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             Container(
                      //               alignment: Alignment.center,
                      //               width: w / 1.7,
                      //               height: h / 15,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(30),
                      //                 color: home1,
                      //                 //border: Border.all(color: Colors.black,)
                      //               ),
                      //               child: TextButton(onPressed: () async {
                      //                 Navigator.pop(context);
                      //                 await mafController.fetchMafNumber();
                      //                 await Get.to(const GenerateManualy());
                      //               }, child: const Text("Generate Manually",
                      //                 style: TextStyle(
                      //                     fontSize: 18,
                      //                     color: Colors.black
                      //                 ),),),
                      //             ),
                      //             const SizedBox(height: 20,),
                      //             Container(
                      //               alignment: Alignment.center,
                      //               width: w / 1.7,
                      //               height: h / 15,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(30),
                      //                 color: home2,
                      //                 //border: Border.all(color: Colors.black,)
                      //               ),
                      //               child: TextButton(onPressed: () {
                      //                 Navigator.pop(context);
                      //                 Get.to(const GenerateMafGREList());
                      //               },
                      //                   child: const Text(
                      //                     "Generate From GRE List",
                      //                     style: TextStyle(
                      //                         fontSize: 18,
                      //                         color: Colors.black
                      //                     ), textAlign: TextAlign.center,)
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //     );
                      //   });
                      // });
                    },
                        text: "Generate MAF",
                        h: categoryHeight*0.8,
                        w: categoryWidth*0.9,
                        color: home1,
                        icon: Icons.edit, iconSize: iconSize*0.9, textSize: textSize*0.8, radius: radiusSize*0.7,),
                    SizedBox(height: 15,),
                    HomeContainer(onTap: () {
                      {
                        showDialog(
                          context: context,
                          builder: (context) {
                            bool tempValue = amcDueAfter90Days;
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text(
                                    "Please Select Any one option as per your sale's type",
                                    style: TextStyle(fontSize: 18),),
                                  content: SizedBox(
                                    height: tempValue ? MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.2 : MediaQuery
                                        .of(context)
                                        .size
                                        .height * 0.13,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(
                                              child: Text(
                                                "AMC Due After 90 days",
                                                style: TextStyle(fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w500),
                                              ),
                                            ),
                                            Checkbox(
                                              value: tempValue,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  tempValue = value ?? true;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20,),
                                        Text(tempValue == true
                                            ? "Make sure in this option any holidays (either regular week or any offer) can be availed after AMC payment only."
                                            : "", style: const TextStyle(
                                            fontWeight: FontWeight.w400
                                        ),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          amcDueAfter90Days = tempValue;
                                        });
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            bool rciValue = nonRci;
                                            bool withRciValue = withRci;
                                            return StatefulBuilder(
                                              builder: (context, setState) {
                                                return AlertDialog(
                                                  title: const Text(
                                                    "Please Confirm This Membership is",
                                                    style: TextStyle(
                                                        fontSize: 18),),
                                                  content: SizedBox(
                                                    height: withRciValue
                                                        ? MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height * 0.2
                                                        : MediaQuery
                                                        .of(context)
                                                        .size
                                                        .height * 0.1,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Expanded(
                                                              child: Text(
                                                                "1. Non RCI",
                                                                style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight: FontWeight
                                                                        .w500),
                                                              ),
                                                            ),
                                                            Checkbox(
                                                              value: rciValue,
                                                              onChanged: (
                                                                  bool? value) {
                                                                setState(() {
                                                                  rciValue =
                                                                      value ??
                                                                          false;
                                                                });
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        // Row(
                                                        //   children: [
                                                        //     const Expanded(
                                                        //       child: Text(
                                                        //         "2. With RCI",
                                                        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                        //       ),
                                                        //     ),
                                                        //     Checkbox(
                                                        //       value: withRciValue,
                                                        //       onChanged: (bool? value) {
                                                        //         setState(() {
                                                        //           withRciValue = value ?? false;
                                                        //         });
                                                        //       },
                                                        //     ),
                                                        //   ],
                                                        // ),
                                                        withRciValue
                                                            ? Container(
                                                          padding: const EdgeInsets
                                                              .only(left: 10,
                                                              right: 10),
                                                          width: w / 2,
                                                          decoration: BoxDecoration(
                                                            borderRadius: const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    8.0)),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          child: DropdownButtonFormField(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            decoration: const InputDecoration(
                                                                border: InputBorder
                                                                    .none
                                                            ),
                                                            value: dropdown,
                                                            icon: const Icon(
                                                              Icons
                                                                  .keyboard_arrow_down,
                                                              size: 16,),
                                                            items: items.map((
                                                                String items) {
                                                              return DropdownMenuItem(
                                                                value: items,
                                                                child: Text(
                                                                  items,
                                                                  style: const TextStyle(
                                                                      fontSize: 14),),
                                                              );
                                                            }).toList(),
                                                            onChanged: (
                                                                String? newValue) {
                                                              setState(() {
                                                                dropdown =
                                                                newValue!;
                                                              });
                                                            },
                                                            validator: (value) {
                                                              if (value ==
                                                                  null || value
                                                                  .isEmpty) {
                                                                return "*";
                                                              }
                                                              else {
                                                                return "";
                                                              }
                                                            },
                                                          ),
                                                        )
                                                            : Container(),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        setState(() {
                                                          nonRci = rciValue;
                                                          withRci =
                                                              withRciValue;
                                                        });
                                                        Navigator.pop(context);
                                                        //_memberController.fetchMembersList();
                                                        // Navigator.pop(context);

                                                        //  _memberController.members.clear();
                                                        //  await Get.off( RegisterUser());
                                                         userNameController.fetchUserName();
                                                         generateMafcontroller.nameController.clear();
                                                         generateMafcontroller.numberController.clear();

                                                         _addMemberController.checkAddMember();
                                                         //generateMafcontroller.dropdownvalue;
                                                        await Get.to(()=>
                                                                  RegisterUser());
                                                          //  (Route<dynamic> route) => false,

                                                        //await _memberController.fetchMembersList();

                                                      },
                                                      child: const Text(
                                                          "Continue"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        );
                                        // Get.to(RegisterUser());
                                      },
                                      child: const Text("Continue"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                        text: "Add New Member",
                        h: categoryHeight*0.8,
                        w: categoryWidth*0.9,
                        color: home2,
                        icon: Icons.person_add_rounded, iconSize: iconSize*0.9, textSize: textSize*0.8,radius: radiusSize*0.7,),
                    SizedBox(height: 15,),
                    HomeContainer(onTap: () {
                      Get.to(() => NewUserHoldingPayment());
                    },
                        text: "New User Holding Payment",
                        h: categoryHeight*0.8,
                        w: categoryWidth*0.9,
                        color: home1,
                        icon: Icons.payments, iconSize: iconSize*0.9, textSize: textSize*0.8,radius: radiusSize*0.7,),
                    SizedBox(height: 15,),
                    HomeContainer(onTap: () {
                      getMembersOnHoldListController.fetchMembersOnHold();
                      print("MembersOnHold");
                      Get.to(()=> MembersOnHold());
                    },
                        text: "Members on Hold",
                        h: categoryHeight*0.8,
                        w: categoryWidth*0.9,
                        color: home2,
                        icon: Icons.pause, iconSize: iconSize*0.9, textSize: textSize*0.8,radius: radiusSize*0.7,),
                    SizedBox(height: 15,),
                    HomeContainer(onTap: () {},
                        text: "Document Re-Print",
                        h: categoryHeight*0.8,
                        w: categoryWidth*0.9,
                        color: home1,
                        icon: Icons.document_scanner_sharp, iconSize: iconSize*0.9, textSize: textSize*0.8,radius: radiusSize*0.7,),
                    SizedBox(height: 15,),
                    HomeContainer(onTap: () {
                      Get.to(() => Signature());
                    },
                        text: "Sign",
                        h: categoryHeight*0.8,
                        w: categoryWidth*0.9,
                        color: home2,
                        icon: Icons.brush, iconSize: iconSize*0.9, textSize: textSize*0.8,radius: radiusSize*0.7,),
                    // Container(
                    //   height: h/12,
                    //   width: w/1.1,
                    //   decoration: BoxDecoration(
                    //     color: home1,
                    //     borderRadius: BorderRadius.circular(12)
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.fromLTRB(14.0,0,18,0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         TextButton(onPressed: (){}, child: Text("Generate MAF",
                    //         style: GoogleFonts.roboto(
                    //           fontSize: 20,
                    //           color: Colors.black
                    //         )
                    //         )),
                    //         CircleAvatar(child: Icon(Icons.edit,size: 22,)),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //     Row(
                    //       children: [
                    //      HomeContainer1(onTap: (){Get.to(()=>GenerateMaf());}, text: "Generate MAF", h: h/5, w: w/2.3, color: home1),
                    //      HomeContainer1(onTap: (){{
                    //        showDialog(
                    //          context: context,
                    //          builder: (context) {
                    //            bool tempValue = amcDueAfter90Days;
                    //            return StatefulBuilder(
                    //              builder: (context, setState) {
                    //                return AlertDialog(
                    //                  title: const Text("Please Select Any one option as per your sale's type",style: TextStyle(fontSize: 18),),
                    //                  content: SizedBox(
                    //                    height: tempValue?MediaQuery.of(context).size.height*0.2:MediaQuery.of(context).size.height*0.11,
                    //                    child: Column(
                    //                      children: [
                    //                        Row(
                    //                          children: [
                    //                            const Expanded(
                    //                              child: Text(
                    //                                "AMC Due After 90 days",
                    //                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    //                              ),
                    //                            ),
                    //                            Checkbox(
                    //                              value: tempValue,
                    //                              onChanged: (bool? value) {
                    //                                setState(() {
                    //                                  tempValue = value ?? true;
                    //                                });
                    //                              },
                    //                            ),
                    //                          ],
                    //                        ),
                    //                        const SizedBox(height: 20,),
                    //                        Text(tempValue == true ? "Make sure in this option any holidays (either regular week or any offer) can be availed after AMC payment only.":"",style: const TextStyle(
                    //                            fontWeight: FontWeight.w400
                    //                        ),
                    //                        )
                    //                      ],
                    //                    ),
                    //                  ),
                    //                  actions: [
                    //                    TextButton(
                    //                      onPressed: () {
                    //                        setState(() {
                    //                          amcDueAfter90Days = tempValue;
                    //                        });
                    //                        showDialog(
                    //                          context: context,
                    //                          builder: (context) {
                    //                            bool rciValue = nonRci;
                    //                            bool withRciValue = withRci;
                    //                            return StatefulBuilder(
                    //                              builder: (context, setState) {
                    //                                return AlertDialog(
                    //                                  title: const Text("Please Confirm This Membership is",style: TextStyle(fontSize: 18),),
                    //                                  content: SizedBox(
                    //                                    height :withRciValue?MediaQuery.of(context).size.height*0.2:MediaQuery.of(context).size.height*0.1,
                    //                                    child: Column(
                    //                                      crossAxisAlignment: CrossAxisAlignment.start,
                    //                                      children: [
                    //                                        Row(
                    //                                          children: [
                    //                                            const Expanded(
                    //                                              child: Text(
                    //                                                "1. Non RCI",
                    //                                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    //                                              ),
                    //                                            ),
                    //                                            Checkbox(
                    //                                              value: rciValue,
                    //                                              onChanged: (bool? value) {
                    //                                                setState(() {
                    //                                                  rciValue = value ?? false;
                    //                                                });
                    //                                              },
                    //                                            ),
                    //                                          ],
                    //                                        ),
                    //                                        // Row(
                    //                                        //   children: [
                    //                                        //     const Expanded(
                    //                                        //       child: Text(
                    //                                        //         "2. With RCI",
                    //                                        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    //                                        //       ),
                    //                                        //     ),
                    //                                        //     Checkbox(
                    //                                        //       value: withRciValue,
                    //                                        //       onChanged: (bool? value) {
                    //                                        //         setState(() {
                    //                                        //           withRciValue = value ?? false;
                    //                                        //         });
                    //                                        //       },
                    //                                        //     ),
                    //                                        //   ],
                    //                                        // ),
                    //                                        withRciValue?Container(
                    //                                          padding: const EdgeInsets.only(left: 10,right: 10),
                    //                                          width: w / 2,
                    //                                          decoration: BoxDecoration(
                    //                                            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    //                                            border: Border.all(color: Colors.grey),
                    //                                          ),
                    //                                          child: DropdownButtonFormField(
                    //                                            alignment: Alignment.centerLeft,
                    //                                            decoration: const InputDecoration(
                    //                                                border: InputBorder.none
                    //                                            ),
                    //                                            value: dropdown,
                    //                                            icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                    //                                            items: items.map((String items) {
                    //                                              return DropdownMenuItem(
                    //                                                value: items,
                    //                                                child: Text(items,style: const TextStyle(fontSize: 14),),
                    //                                              );
                    //                                            }).toList(),
                    //                                            onChanged: (String? newValue) {
                    //                                              setState(() {
                    //                                                dropdown = newValue!;
                    //                                              });
                    //                                            },
                    //                                            validator: (value){
                    //                                              if(value==null || value.isEmpty){
                    //                                                return "*";
                    //                                              }
                    //                                              else {
                    //                                                return "";
                    //                                              }
                    //                                            },
                    //                                          ),
                    //                                        ):Container(),
                    //                                      ],
                    //                                    ),
                    //                                  ),
                    //                                  actions: [
                    //                                    TextButton(
                    //                                      onPressed: () async {
                    //                                        setState(() {
                    //                                          nonRci = rciValue;
                    //                                          withRci = withRciValue;
                    //                                        });
                    //                                        Navigator.pop(context);
                    //                                        // Navigator.pop(context);
                    //                                        //  _memberController.members.clear();
                    //                                        //  await Get.off( RegisterUser());
                    //                                        await Navigator.pushReplacement(
                    //                                          context,
                    //                                          MaterialPageRoute(builder: (context) => RegisterUser()),
                    //                                          //  (Route<dynamic> route) => false,
                    //                                        );
                    //                                        //await _memberController.fetchMembersList();
                    //
                    //                                      },
                    //                                      child: const Text("Continue"),
                    //                                    ),
                    //                                  ],
                    //                                );
                    //                              },
                    //                            );
                    //                          },
                    //                        );
                    //                        // Get.to(RegisterUser());
                    //                      },
                    //                      child: const Text("Continue"),
                    //                    ),
                    //                  ],
                    //                );
                    //              },
                    //            );
                    //          },
                    //        );
                    //      }}, text: "Add New Member", h: h/5, w: w/2.3, color: home2),
                    // // Container(
                    // //   width: w / 2.3,
                    // //   height: h / 5,
                    // //   alignment: Alignment.center,
                    // //   decoration: BoxDecoration(
                    // //     color: home2,
                    // //       borderRadius: BorderRadius.circular(12)
                    // //   ),
                    // //   margin: const EdgeInsets.fromLTRB(10,10,18,0),
                    // //   padding: const EdgeInsets.all(15),
                    // //   child: GestureDetector(
                    // //     onTap: () {
                    // //       showDialog(
                    // //         context: context,
                    // //         builder: (context) {
                    // //           bool tempValue = amcDueAfter90Days;
                    // //           return StatefulBuilder(
                    // //             builder: (context, setState) {
                    // //               return AlertDialog(
                    // //                 title: const Text("Please Select Any one option as per your sale's type",style: TextStyle(fontSize: 18),),
                    // //                 content: SizedBox(
                    // //                   height: tempValue?MediaQuery.of(context).size.height*0.2:MediaQuery.of(context).size.height*0.11,
                    // //                   child: Column(
                    // //                     children: [
                    // //                       Row(
                    // //                         children: [
                    // //                           const Expanded(
                    // //                             child: Text(
                    // //                               "AMC Due After 90 days",
                    // //                               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    // //                             ),
                    // //                           ),
                    // //                           Checkbox(
                    // //                             value: tempValue,
                    // //                             onChanged: (bool? value) {
                    // //                               setState(() {
                    // //                                 tempValue = value ?? true;
                    // //                               });
                    // //                             },
                    // //                           ),
                    // //                         ],
                    // //                       ),
                    // //                       const SizedBox(height: 20,),
                    // //                       Text(tempValue == true ? "Make sure in this option any holidays (either regular week or any offer) can be availed after AMC payment only.":"",style: const TextStyle(
                    // //                         fontWeight: FontWeight.w400
                    // //                       ),
                    // //                       )
                    // //                     ],
                    // //                   ),
                    // //                 ),
                    // //                 actions: [
                    // //                   TextButton(
                    // //                     onPressed: () {
                    // //                       setState(() {
                    // //                         amcDueAfter90Days = tempValue;
                    // //                       });
                    // //                       showDialog(
                    // //                         context: context,
                    // //                         builder: (context) {
                    // //                           bool rciValue = nonRci;
                    // //                           bool withRciValue = withRci;
                    // //                           return StatefulBuilder(
                    // //                             builder: (context, setState) {
                    // //                               return AlertDialog(
                    // //                                 title: const Text("Please Confirm This Membership is",style: TextStyle(fontSize: 18),),
                    // //                                 content: SizedBox(
                    // //                                   height :withRciValue?MediaQuery.of(context).size.height*0.2:MediaQuery.of(context).size.height*0.1,
                    // //                                   child: Column(
                    // //                                     crossAxisAlignment: CrossAxisAlignment.start,
                    // //                                     children: [
                    // //                                       Row(
                    // //                                         children: [
                    // //                                           const Expanded(
                    // //                                             child: Text(
                    // //                                               "1. Non RCI",
                    // //                                               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    // //                                             ),
                    // //                                           ),
                    // //                                           Checkbox(
                    // //                                             value: rciValue,
                    // //                                             onChanged: (bool? value) {
                    // //                                               setState(() {
                    // //                                                 rciValue = value ?? false;
                    // //                                               });
                    // //                                             },
                    // //                                           ),
                    // //                                         ],
                    // //                                       ),
                    // //                                       // Row(
                    // //                                       //   children: [
                    // //                                       //     const Expanded(
                    // //                                       //       child: Text(
                    // //                                       //         "2. With RCI",
                    // //                                       //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    // //                                       //       ),
                    // //                                       //     ),
                    // //                                       //     Checkbox(
                    // //                                       //       value: withRciValue,
                    // //                                       //       onChanged: (bool? value) {
                    // //                                       //         setState(() {
                    // //                                       //           withRciValue = value ?? false;
                    // //                                       //         });
                    // //                                       //       },
                    // //                                       //     ),
                    // //                                       //   ],
                    // //                                       // ),
                    // //                                       withRciValue?Container(
                    // //                                         padding: const EdgeInsets.only(left: 10,right: 10),
                    // //                                         width: w / 2,
                    // //                                         decoration: BoxDecoration(
                    // //                                           borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    // //                                           border: Border.all(color: Colors.grey),
                    // //                                         ),
                    // //                                         child: DropdownButtonFormField(
                    // //                                           alignment: Alignment.centerLeft,
                    // //                                           decoration: const InputDecoration(
                    // //                                               border: InputBorder.none
                    // //                                           ),
                    // //                                           value: dropdown,
                    // //                                           icon: const Icon(Icons.keyboard_arrow_down,size: 16,),
                    // //                                           items: items.map((String items) {
                    // //                                             return DropdownMenuItem(
                    // //                                               value: items,
                    // //                                               child: Text(items,style: const TextStyle(fontSize: 14),),
                    // //                                             );
                    // //                                           }).toList(),
                    // //                                           onChanged: (String? newValue) {
                    // //                                             setState(() {
                    // //                                               dropdown = newValue!;
                    // //                                             });
                    // //                                           },
                    // //                                           validator: (value){
                    // //                                             if(value==null || value.isEmpty){
                    // //                                               return "*";
                    // //                                             }
                    // //                                             else {
                    // //                                               return "";
                    // //                                             }
                    // //                                           },
                    // //                                         ),
                    // //                                       ):Container(),
                    // //                                     ],
                    // //                                   ),
                    // //                                 ),
                    // //                                 actions: [
                    // //                                   TextButton(
                    // //                                     onPressed: () async {
                    // //                                       setState(() {
                    // //                                         nonRci = rciValue;
                    // //                                         withRci = withRciValue;
                    // //                                       });
                    // //                                       Navigator.pop(context);
                    // //                                      // Navigator.pop(context);
                    // //                                      //  _memberController.members.clear();
                    // //                                      //  await Get.off( RegisterUser());
                    // //                                      await Navigator.pushReplacement(
                    // //                                           context,
                    // //                                           MaterialPageRoute(builder: (context) => RegisterUser()),
                    // //                                             //  (Route<dynamic> route) => false,
                    // //                                           );
                    // //                                       //await _memberController.fetchMembersList();
                    // //
                    // //                                     },
                    // //                                     child: const Text("Continue"),
                    // //                                   ),
                    // //                                 ],
                    // //                               );
                    // //                             },
                    // //                           );
                    // //                         },
                    // //                       );
                    // //                      // Get.to(RegisterUser());
                    // //                     },
                    // //                     child: const Text("Continue"),
                    // //                   ),
                    // //                 ],
                    // //               );
                    // //             },
                    // //           );
                    // //         },
                    // //       );
                    // //     },
                    // //     child: Text(
                    // //       "Add New Member",
                    // //       style: GoogleFonts.roboto(
                    // //         //fontWeight: FontWeight.bold,
                    // //         fontSize: 22,
                    // //         //color: Colors.white,
                    // //       ),
                    // //     ),
                    // //   ),
                    // // ),
                    //
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         HomeContainer1(onTap: (){Get.to(()=>NewUserHoldingPayment());}, text: "New User Holding Payment", h: h/5, w: w/2.3, color: home2),
                    //         HomeContainer1(onTap: (){}, text: "Members on Hold", h: h/5, w: w/2.3, color: home1),
                    //       ],
                    //     ),
                    //     Row(
                    //       children: [
                    //         HomeContainer1(onTap: (){Get.to(()=>());}, text: "Document Re-Print", h: h/5, w: w/2.3, color: home1),
                    //         HomeContainer1(onTap: (){Get.to(()=>Signature());}, text: "Sign", h: h/5, w: w/2.3, color: home2),
                    //       ],
                    //     ),
                    SizedBox(height: 15,),
                    // HomeContainer(onTap: ()async{
                    //   await _memberController.fetchMembersList();
                    //   await approvalFormController.fetchApprovalForm();
                    //   print("Hit Approval Form Api");
                    // }, text: "Approval Form",  h: categoryHeight*0.8,
                    //     w: categoryWidth*0.9,
                    //     color: home1,  icon: Icons.brush, iconSize: iconSize*0.9, textSize: textSize*0.8,radius: radiusSize*0.7,)
                  ],
                ),
              ),
            );
          });})
    );
  }
}
