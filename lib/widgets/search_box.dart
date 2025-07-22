import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/providers/user_provider.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(19),
      color: cardWhite,

      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TextField(
          controller: userProvider.searchController,
          onChanged: (value) {
            userProvider.searchUserRequested();
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.grey.shade600,
              weight: 20,
            ),
            hintText: 'Search User',
            hintStyle: textStyle(22, Colors.grey.shade600),
          ),
        ),
      ),
    );
  }
}
