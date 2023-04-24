import 'package:flutter/material.dart';

class AnnounceText extends StatelessWidget {
  const AnnounceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 10, bottom: 0),
          child: Text(
            "Announcement",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 20, right: 10, bottom: 0),
          child: Text(
            "See all",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
