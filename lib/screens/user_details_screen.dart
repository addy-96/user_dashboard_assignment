import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: scaffoldBackgroundColor,
        title: Text(
          'User Details',
          style: textStyle(
            28,
            Colors.black,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Card(),
    );
  }
}
