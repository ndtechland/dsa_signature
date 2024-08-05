import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  AppText({
    super.key,
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.fontFamily = 'poppins',
    this.overflow,
  });

  final String text;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final String fontFamily;
  TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        overflow: overflow,
      ),
    );
  }
}
