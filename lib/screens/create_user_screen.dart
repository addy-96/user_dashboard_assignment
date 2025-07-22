import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/widgets/create_user_text_field.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
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
                Text(
                  'Enter your details',
                  style: textStyle(
                    20,
                    Colors.black,
                  ).copyWith(fontWeight: FontWeight.bold),
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
              textController: middleNameController,
              hintText: 'Middle name',
            ),
          ],
        ),
      ),
    );
  }
}
