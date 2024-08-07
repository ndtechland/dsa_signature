import 'package:flutter/material.dart';
class FormContainer extends StatelessWidget {
  final double w;
  final double h;
  final TextEditingController controller;
 // bool readOnly;
   String hintText;
   FormContainer({
    super.key,
    required this.h,
    required this.w,
    required this.controller,
    required this.hintText,
   // required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      //color: Colors.yellow,
      child: TextFormField(
        //key: _inputKey,
        //readOnly: readOnly,
        controller: controller,
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius
                .all(
                Radius.circular(8.0)),
          ),
          hintText: hintText,
        ),
        // validator: (value) {
        //   if (value == null ||
        //       value.isEmpty) {
        //     return 'Please enter guest name';
        //   }
        //   return null;
        // },
      ),
    );
  }
}
