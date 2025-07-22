import 'package:flutter/material.dart';
import 'package:user_dashboard/screens/create_user_screen.dart';
import 'package:user_dashboard/screens/report_screen.dart';
import 'package:user_dashboard/widgets/home_nav_button.dart';

class HomeCtaSection extends StatelessWidget {
  const HomeCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: HomeNavButton(
            buttonText: 'Report',
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ReportScreen()));
            },
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: HomeNavButton(
            buttonText: 'Create User',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateUserScreen()),
              );
            },
          ),
        ),
      ],
    );
  }
}
