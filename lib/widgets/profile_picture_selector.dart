import 'package:flutter/material.dart';

class ProfilePictureSelector extends StatelessWidget {
  const ProfilePictureSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: MediaQuery.of(context).size.width / 6);
  }
}
