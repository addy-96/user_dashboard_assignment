import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/model/user_profile.dart';
import 'package:user_dashboard/providers/user_provider.dart';
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
  final TextEditingController titleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();


  @override
  void dispose() {
    firstNameController.dispose();
    titleNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void onCreateUser({required UserProvider userProvider}) {
    if (validateInput(userProvider: userProvider)) {
      final UserProfile userProfile = UserProfile(
        name: Name(
          title: titleNameController.text.trim(),
          first: firstNameController.text.trim(),
          last: lastNameController.text.trim(),
        ),
        dob: DateOfBirth(date: '01/03/2000', age: 25),
        gender: userProvider.selectedGender!,
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        picture: userProvider.selectedProfilePicPath!,
      );

      final action = userProvider.addUser(userProfile: userProfile);
      if (!action) {
        showSnack(
          context: context,
          message: 'Some Error oiccured while adding user',
        );
        Navigator.of(context).pop();
        return;
      } else {
        showSnack(context: context, message: 'User Added!');
        Navigator.of(context).pop();
        return;
      }
    }
  }

  bool validateInput({required UserProvider userProvider}) {
    if (userProvider.selectedProfilePicPath == null) {
      showSnack(context: context, message: 'Please select a profile picture');
      return false;
    } else if (firstNameController.text.trim().isEmpty) {
      showSnack(context: context, message: 'Enter the First Name to proceed!');
      return false;
    } else if (titleNameController.text.trim().isEmpty) {
      showSnack(context: context, message: 'Enter the Middle Name to proceed!');
      return false;
    } else if (lastNameController.text.trim().isEmpty) {
      showSnack(context: context, message: 'Enter the Last Name to proceed!');
      return false;
    } else if (dobController.text.trim().isEmpty) {
      showSnack(
        context: context,
        message: 'Please select the date of birth to proceed!',
      );
      return false;
    } else if (userProvider.selectedGender == null) {
      showSnack(context: context, message: 'Please select gender to proceed!');
      return false;
    } else if (emailController.text.trim().isEmpty) {
      showSnack(context: context, message: 'Enter the email to proceed!');
      return false;
    } else if (!emailController.text.trim().contains('@') ||
        !emailController.text.trim().contains('.')) {
      showSnack(context: context, message: 'Please enter a valid email!');
    } else if (phoneController.text.trim().isEmpty) {
      showSnack(context: context, message: 'Enter the phone to proceed!');
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
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
              textController: titleNameController,
              hintText: middleNameHint,
            ),
            CreateUserTextField(
              textController: firstNameController,
              hintText: firstNameHint,
            ),
   
            CreateUserTextField(
              textController: lastNameController,
              hintText: lastNameHint,
            ),

            CustomDivider(),
            DateOfBirthPicker(dobController: dobController),
            CustomDivider(),
            GenderDropdown(),
            CustomDivider(),
            CreateUserTextField(
              textController: emailController,
              hintText: emailHint,
            ),
            CreateUserTextField(
              textController: phoneController,
              hintText: phoneHint,
            ),
            SizedBox(height: 10),
Text(
              '*User will only be added locally and when you reopen the app you may not find the user! :)',
              style: textStyle(12, Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            HomeNavButton(
              buttonText: 'Create User',
              onPressed: () {
                onCreateUser(userProvider: userProvider);
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
