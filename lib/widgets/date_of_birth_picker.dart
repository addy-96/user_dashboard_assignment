import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';

class DateOfBirthPicker extends StatefulWidget {
  const DateOfBirthPicker({super.key, required this.dobController});
  final TextEditingController dobController;

  @override
  State<DateOfBirthPicker> createState() => _DateOfBirthPickerState();
}

class _DateOfBirthPickerState extends State<DateOfBirthPicker> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked == null) {
      widget.dobController.clear();
    }
    if (picked != null) {
      if (picked.day == DateTime.now().day) {
        showSnack(context: context, message: 'Happy Birthday!');
      }
      setState(() {
        widget.dobController.text =
            "${picked.day} ${months[picked.month - 1]}, ${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: widget.dobController,
        readOnly: true,
        decoration: InputDecoration(
          hintStyle: textStyle(15, Colors.grey.shade600),
          hintText: 'Date of Birth',
          suffixIcon: Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }
}
