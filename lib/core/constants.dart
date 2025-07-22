import 'package:flutter/material.dart';
import 'package:user_dashboard/core/textstyle.dart';

const scaffoldBackgroundColor = Color.fromARGB(255, 248, 247, 247);
const cardWhite = Colors.white;
const thmeBlue = Color.fromARGB(255, 51, 117, 238);

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
