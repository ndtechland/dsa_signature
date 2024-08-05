import 'package:dsa_app/constant.dart';
import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {
  final VoidCallback onTap; // Change to VoidCallback
  final String text;
  final double w;
  final double h;

  const NextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.h,
    required this.w,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: blue,
        borderRadius: BorderRadius.circular(24),
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ), // Use onTap without calling it
      ),
    );
  }
}
