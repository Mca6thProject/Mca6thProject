import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomNavBar extends HookConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  final isDarkMode = ref.watch(isLightThemeController.state).state;
    return const SizedBox(
      //   height: 56,
      child: TabBar(
          padding: EdgeInsets.zero,
          indicatorWeight: 0.1,
          indicatorColor:
              Colors.black, //isDarkMode ? darkButtonColor : Colors.black,
          labelPadding: EdgeInsets.all(0),
          //  labelColor: isDarkMode ? darkButtonColor : Colors.black,
          labelStyle: TextStyle(fontSize: 10),
          // unselectedLabelColor:
          //     isDarkMode ? Colors.white : Colors.grey.shade800,
          tabs: [
            Tab(
              icon: Icon(CupertinoIcons.home),
              // text: 'Home',
            ),
            Tab(
              icon: Icon(CupertinoIcons.book),
              // text: 'ONGOING',
            ),
            Tab(
              icon: Icon(CupertinoIcons.person),
              //  text: 'UPCOMMING',
            ),
          ]

          // selectedFontSize: 12,
          // unselectedFontSize: 12,
          // elevation: 10,
          //  tabs [
          //       // BottomNavigationBarItem(
          //       //   icon: Icon(CupertinoIcons.home),
          //       //   label: 'Home',
          //       // ),
          //       BottomNavigationBarItem(
          //         icon: Icon(CupertinoIcons.gamecontroller),
          //         label: 'ONGOING',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(CupertinoIcons.speedometer),
          //         label: 'UPCOMMING',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(CupertinoIcons.doc_plaintext),
          //         label: 'RESULT',
          //       ),
          //     ],
          ),
    );
  }
}
