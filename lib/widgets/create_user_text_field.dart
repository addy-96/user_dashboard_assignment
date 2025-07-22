import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';

class CreateUserTextField extends StatelessWidget {
  const CreateUserTextField({
    super.key,
    required this.textController,
    required this.hintText,
  });
  final TextEditingController textController;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: getKeyBoardType(inputType: hintText),
        maxLength: getInputMaxLength(isEmail: hintText == 'Email'),
        controller: textController,
        style: textStyle(15, Colors.black87),
        cursorColor: thmeBlue,
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: thmeBlue, width: 3),
          ),
          hintText: hintText,
          hintStyle: textStyle(15, Colors.grey.shade600),
        ),
      ),
    );
  }
}
