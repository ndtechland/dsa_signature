import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PhoneContainer extends StatelessWidget {
  final double w;
  final double h;
  final TextEditingController controller;
  String hintText;

  PhoneContainer({
    super.key,
    required this.h,
    required this.w,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ,
      height: h ,
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ],
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
          ),
          hintText: hintText,
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
    );
  }
}
