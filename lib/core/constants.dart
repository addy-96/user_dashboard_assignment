import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_dashboard/core/textstyle.dart';

const scaffoldBackgroundColor = Color.fromARGB(255, 248, 247, 247);
const cardWhite = Colors.white;
const thmeBlue = Color.fromARGB(255, 51, 117, 238);

const firstNameHint = 'First name';
const middleNameHint = 'Title';
const lastNameHint = 'Last name';
const emailHint = 'Email';
const phoneHint = 'Phone';
const dobHint = 'Date of Birth';
const genderHint = 'Select Gender';



final List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

showSnack({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        elevation: 10,
        backgroundColor: thmeBlue,
        behavior: SnackBarBehavior.floating,
        content: Center(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              message,
              style: textStyle(
                15,
                Colors.white,
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
}


int defaultInputMaxLenght = 10;
int emailMaxLength = 25;

int getInputMaxLength({required bool isEmail}) {
  return isEmail ? emailMaxLength : defaultInputMaxLenght;
}

TextInputType getKeyBoardType({required String inputType}) {
  return (inputType == firstNameHint ||
          inputType == middleNameHint ||
          inputType == lastNameHint)
      ? TextInputType.text
      : inputType == emailHint
      ? TextInputType.emailAddress
      : inputType == phoneHint
      ? TextInputType.number
      : TextInputType.name;
}
