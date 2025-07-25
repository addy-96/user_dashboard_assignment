
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/providers/user_provider.dart';
import 'package:user_dashboard/widgets/home_cta_section.dart';
import 'package:user_dashboard/widgets/home_user_card.dart';
import 'package:user_dashboard/widgets/search_box.dart';
import 'package:user_dashboard/widgets/sort_button.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<UserProvider>(context, listen: false).loadUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: true,
        backgroundColor: scaffoldBackgroundColor,
        title: Text(
          'User Dashboard',
          style: textStyle(
            28,
            Colors.black,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 5),
              Expanded(child: SearchBox()),
              SizedBox(width: 10),
              SortButton(),
              SizedBox(width: 5),
            ],
          ),
          Expanded(
            child: Consumer<UserProvider>(
              builder: (context, providerValue, child) {
                if (providerValue.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (!providerValue.isLoading &&
                    providerValue.userProfile.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 4),
                        Expanded(
                          child: ListView.builder(
                            itemCount:
                                providerValue.searchController.text
                                    .trim()
                                    .isEmpty
                                ? providerValue.userProfile.length
                                : providerValue.userBuffer.length,
                            itemBuilder: (context, index) {
                              final userProfile =
                                  providerValue.searchController.text
                                      .trim()
                                      .isEmpty
                                  ? providerValue.userProfile[index]
                                  : providerValue.userBuffer[index];
                              return HomeUserCard(
                                profileimgaeUrl: userProfile.picture,
                                emailAddress: userProfile.email,
                                username:
                                    '${userProfile.name.title} ${userProfile.name.first} ${userProfile.name.last}',
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 4),
                        const HomeCtaSection(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  );
                }

                return const Center(child: Text('Some Error Occured'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
