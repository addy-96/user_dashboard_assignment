import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_dashboard/providers/user_provider.dart';
import 'package:user_dashboard/screens/home_dashboard_screen.dart';
import 'package:user_dashboard/service/services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(services: Services()),
        ),
      ],
      child: UserDashboard(),
    ),
  );
}

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDashboardScreen(),
    );
  }
}
