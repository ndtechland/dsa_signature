import 'package:flutter/material.dart';

class DropdownContainer extends StatefulWidget {
  final double w;
  final TextEditingController controller;

  const DropdownContainer({
    super.key,
    required this.w,
    required this.controller,
  });

  @override
  State<DropdownContainer> createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  String? selectedValue; // Variable to store the selected value

  @override
  Widget build(BuildContext context) {
    var prefix = [
      'Select',
      'MR',
      'MS',
      'MRS',
    ];
    return Container(
      width: widget.w,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonFormField<String>(
        alignment: AlignmentDirectional.center,
        decoration: const InputDecoration(border: InputBorder.none),
        value: selectedValue,
        icon: const Icon(
          Icons.keyboard_arrow_down,
          size: 16,
        ),
        items: prefix.map((String items) {
          return DropdownMenuItem<String>(
            value: items,
            child: Text(
              items,
              style: const TextStyle(fontSize: 14),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            //selectedValue = newValue;
            widget.controller.text = newValue!; // Update the controller's text with the selected value
          });
        },
      ),
    );
  }
}
