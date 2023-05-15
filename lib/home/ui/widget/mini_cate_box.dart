import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/utils/common/color.dart';

class MiniCard extends HookConsumerWidget {
  const MiniCard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: SizedBox(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.43,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ref.watch(primaryColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.calendar_view_month_sharp,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Time Table",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ref.watch(primaryColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.group_outlined,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Class",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ref.watch(primaryColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.menu_book_sharp,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Attendance",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ref.watch(primaryColor),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Calender",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
