import 'package:flutter/material.dart';
import 'package:instinfo/announcement/ui/announce_all_screen.dart';

class AnnounceText extends StatelessWidget {
  const AnnounceText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 20, bottom: 8),
          child: Text(
            "Announcement",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (_) {
                return const AnnouceAllScreen();
              }),

          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (_) => AnnouceAllScreen())),
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(top: 20, right: 20, bottom: 0),
            child: const Text(
              "See all",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
