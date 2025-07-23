import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';
import 'package:user_dashboard/widgets/report_card.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: cardWhite,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.back, size: 30),
        ),
        title: Text(
          'Report',
          style: textStyle(
            28,
            Colors.black,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            ReportCard(
              reportTitle: 'Monthly Active Users',
              reportSubTitle:
                  'Summary of User Activity of ${months[DateTime.now().month + 1]}',
              iconData: Icons.signal_cellular_alt_rounded,
            ),
            const ReportCard(
              reportTitle: 'Revenue Report',
              reportSubTitle: 'Quarterly revenue analysis',
              iconData: Icons.auto_graph_outlined,
            ),
            const ReportCard(
              reportTitle: 'User Feedback',
              reportSubTitle: 'Analysis of recent UUSer feedback',
              iconData: Icons.feed,
            ),
          ],
        ),
      ),
    );
  }
}
