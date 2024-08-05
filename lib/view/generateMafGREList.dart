import 'package:dsa_app/view/gen_manualy.dart';
import 'package:dsa_app/view/widgets/apptext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import '../controller/generateMaf_controller.dart';
import '../controller/getGenerateMaf_controller.dart';
import 'approval_form.dart';

class GenerateMafGREList extends StatefulWidget {
  const GenerateMafGREList({super.key});

  @override
  State<GenerateMafGREList> createState() => _GenerateMafGREListState();
}

class _GenerateMafGREListState extends State<GenerateMafGREList> {
  final GenerateMafController generateMafcontroller = Get.put(GenerateMafController());
  final MafController mafController = Get.put(MafController());

  String? dropdown = 'Select';
  var items = [
    'Select',
    '3 year',
    '5 year',
    '10 year',
  ];
  @override
  Widget build(BuildContext context) {

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
          if (mafController.isLoading.value && generateMafcontroller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            generateMafcontroller.guestIdController.text = mafController.mafNumber.value;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 0, 18, 18),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Text(
                      "Generate MAF",
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "WelcomeForm SrNo.",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    DropdownButtonFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      value: dropdown,
                      icon: const Icon(Icons.keyboard_arrow_down, size: 16),
                      onChanged: (String? newValue) {
                        // setState(() {
                        //   dropdown = newValue;
                        // });
                      },
                      items: items
                          .map<DropdownMenuItem<String>>((String valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Guest ID",
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: w / 1.1,
                      height: h / 15,
                      child: TextFormField(
                        controller: generateMafcontroller.guestIdController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          // hintText: 'Guest Id',
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Please Enter GuestId";
                        //   } else {
                        //     return "";
                        //   }
                        // },
                      ),
                    ),
                    SizedBox(height: 10,),
                    AppText(text: "Date of Joining", size: 16, fontWeight: FontWeight.w500, color: Colors.black87),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: w / 1.1,
                      height: h / 15,
                      child: TextFormField(
                        controller: generateMafcontroller.dateInput,
                        readOnly: true,
                        onTap: () async {
                          // DateTime? pickedDate = await DateTime.now();
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now(),
                              initialEntryMode: DatePickerEntryMode.calendar
                          );
                          //
                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                            DateFormat('yyyy-MM-dd')
                                .format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              generateMafcontroller.dateInput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          }
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                          ),
                          hintText: '01/07/2024',
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Please Select Date";
                        //   } else {
                        //     return "";
                        //   }
                        // },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Guest Name",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 8,),
                    SizedBox(
                      width: w / 1.1,
                      height: h / 15,
                      child: TextFormField(
                        controller: generateMafcontroller.nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius
                                .all(
                                Radius.circular(8.0)),
                          ),
                          hintText: 'Guest Name',
                        ),
                        // validator: (value) {
                        //   if (value == null ||
                        //       value.isEmpty) {
                        //     return 'Please enter guest name';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child:
                      Obx(() {
                        return generateMafcontroller.isLoading.value
                            ? CircularProgressIndicator()
                            : Container(
                          width: w / 3,
                          height: h / 17,
                          decoration: const BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          child:
                          TextButton(
                            onPressed: () {
                              print("submit");
                              print("object");
                              // print('Form data: ${data.toJson()}');
                              generateMafcontroller.checkGenerateMaf();
                              Get.to(()=>ApprovalForm());
                              print('Generate MAF From GRE List');
                              //  }
                            },
                            child: const Text(
                              "Generate",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),

                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
