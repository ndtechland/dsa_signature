import 'package:flutter/material.dart';
class RegisterContainer extends StatelessWidget {
   RegisterContainer(
      {super.key,
        required this.text,
        required this.h,
        required this.w,
        });
String text;
double w;
double h;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      width: w ,
      height: h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(text),
    );
  }
}
