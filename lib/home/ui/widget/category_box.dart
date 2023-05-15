import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/common/color.dart';

class CategoryCard extends HookConsumerWidget {
  const CategoryCard({super.key, required this.icon, required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6.0,
        bottom: 6,
      ),
      child: Expanded(
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: ref.watch(primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(
                      icon,
                      color: ref.watch(buttonColor),
                      size: 30,
                    )),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  text,
                  style: GoogleFonts.sourceSansPro(
                      height: 1, fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PicOfTheDayCard extends StatelessWidget {
  const PicOfTheDayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: Expanded(
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width * 0.43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Color.fromARGB(255, 45, 43, 43),
          ),
          child: Column(
            children: [
              Icon(
                Icons.image,
                color: Colors.white,
                size: 130,
              ),
              // SizedBox(
              //   height: 4,
              // ),
              Text(
                "Time Table",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
