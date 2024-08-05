import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateContainer extends StatefulWidget {
  final double w;
  final double h;
  final TextEditingController controller;
  final DateTime firstDate;
  final DateTime lastDate;
  String hintText;

   DateContainer({super.key,
    required this.h,
    required this.w,
    required this.controller,
    required this.firstDate,
    required this.lastDate,
    required this.hintText,
  });

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.w ,
      height: widget.h,
      //color: Colors.pink,
      child: TextFormField(
        controller: widget.controller,
        readOnly: true,
        onTap: () async {
          // DateTime? pickedDate = await DateTime.now();
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
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
              widget.controller.text =
                  formattedDate; //set output date to TextField value.
            });
          }
        },
        decoration:  InputDecoration(
          border: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(8.0)),
          ),
          hintText: widget.hintText,
        ),
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return "Please Select Date";
        //   } else {
        //     return "";
        //   }
        // },
      ),
    );
  }
}
