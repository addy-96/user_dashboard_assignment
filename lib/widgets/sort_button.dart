import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/providers/user_provider.dart';

class SortButton extends StatelessWidget {
  const SortButton({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return PopupMenuButton(
      color: cardWhite,
      icon: const Icon(Icons.sort),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            if (userProvider.currentSort == SortType.az) {
              return;
            }
            userProvider.sortUser(SortType.az);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                userProvider.currentSort == SortType.az
                    ? 'Sorted A-Z'
                    : 'Sort A-Z',
                style: textStyle(
                  18,
                  userProvider.currentSort == SortType.az
                      ? thmeBlue
                      : Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ),
        PopupMenuItem(
          onTap: () {
            if (userProvider.currentSort == SortType.za) {
              return;
            }
            userProvider.sortUser(SortType.za);
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                userProvider.currentSort == SortType.za
                    ? 'Sorted Z-A'
                    : 'Sort Z-A',
                style: textStyle(
                  18,
                  userProvider.currentSort == SortType.za
                      ? thmeBlue
                      : Colors.grey.shade500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
