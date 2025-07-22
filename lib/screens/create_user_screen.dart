import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/widgets/create_user_text_field.dart';
import 'package:user_dashboard/widgets/custom_divider.dart';
import 'package:user_dashboard/widgets/date_of_birth_picker.dart';
import 'package:user_dashboard/widgets/gender_drop_down.dart';
import 'package:user_dashboard/widgets/home_nav_button.dart';
import 'package:user_dashboard/widgets/profile_picture_selector.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cardWhite,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(CupertinoIcons.back, size: 30),
        ),
        title: Text(
          'Create User',
          style: textStyle(
            28,
            Colors.black,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListView(
          children: [
            
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ProfilePictureSelector(),
                    SizedBox(height: 10),
                    Text(
                      'Enter your details',
                      style: textStyle(
                        20,
                        Colors.black,
                      ).copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 15),
            CreateUserTextField(
              textController: firstNameController,
              hintText: 'First name',
            ),
            CreateUserTextField(
              textController: middleNameController,
              hintText: 'Middle name',
            ),
            CreateUserTextField(
              textController: lastNameController,
              hintText: 'Last name',
            ),

            CustomDivider(),
            DateOfBirthPicker(dobController: dobController),
            CustomDivider(),
            GenderDropdown(),
            CustomDivider(),
            CreateUserTextField(
              textController: emailController,
              hintText: 'Email',
            ),
            CreateUserTextField(
              textController: phoneController,
              hintText: 'Phone',
            ),
            SizedBox(height: 10),
            HomeNavButton(buttonText: 'Create User', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
