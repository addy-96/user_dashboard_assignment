import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';

class ReportCard extends StatelessWidget {
  const ReportCard({
    super.key,
    required this.reportTitle,
    required this.reportSubTitle,
    required this.iconData,
  });

  final String reportTitle;
  final String reportSubTitle;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showSnack(context: context, message: 'Feature yet to be added!');
      },
      child: Card(
        color: cardWhite,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 58,
                width: 58,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: thmeBlue,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(iconData, size: 34, color: Colors.white),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reportTitle,
                      style: textStyle(
                        20,
                        Colors.black,
                      ).copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    Text(
                      reportSubTitle,
                      style: textStyle(15, Colors.black54),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
