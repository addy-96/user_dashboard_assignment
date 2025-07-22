import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/providers/user_provider.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({super.key});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {


  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        dropdownColor: scaffoldBackgroundColor,

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: Colors.grey.shade200, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: thmeBlue, width: 3),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        value: userProvider.selectedGender,
        hint: Text(genderHint, style: textStyle(15, Colors.grey.shade600)),
        items: genderOptions.map((String gender) {
          return DropdownMenuItem<String>(
            value: gender,
            child: Text(gender, style: textStyle(15, Colors.black87)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            if (newValue == null) {
              return;
            }
            userProvider.setGender = newValue;
          });
        },
      ),
    );
  }
}
