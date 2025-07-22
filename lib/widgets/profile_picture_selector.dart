import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/providers/user_provider.dart';

class ProfilePictureSelector extends StatelessWidget {
  const ProfilePictureSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () async {
        await userProvider.selectProfilePicture();
      },
      child: Material(
        borderRadius: BorderRadius.circular(100),
        elevation: 1,
        child: CircleAvatar(
          radius: screenWidth / 6,
          backgroundColor: scaffoldBackgroundColor,
          backgroundImage: userProvider.selectedProfilePicPath != null
              ? FileImage(File(userProvider.selectedProfilePicPath!))
              : null,
          child: userProvider.selectedProfilePicPath == null
              ? Icon(
                  CupertinoIcons.person_add,
                  size: screenWidth / 8,
                  color: thmeBlue,
                )
              : null,
        ),
      ),
    );
  }
}
