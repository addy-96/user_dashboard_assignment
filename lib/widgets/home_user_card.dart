import 'package:flutter/material.dart';
import 'package:user_dashboard/core/constants.dart';
import 'package:user_dashboard/core/textstyle.dart';

class HomeUserCard extends StatelessWidget {
  const HomeUserCard({
    super.key,
    required this.username,
    required this.emailAddress,
    required this.profileimgaeUrl,
  });
  final String profileimgaeUrl;
  final String username;
  final String emailAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: cardWhite,
            borderRadius: BorderRadius.circular(18),
          ),
          height: MediaQuery.of(context).size.height / 10,

          child: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(profileimgaeUrl)),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: textStyle(22, Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    SizedBox(height: 5),
                    Text(
                      emailAddress,
                      style: textStyle(15, Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
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
