import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageController extends HookConsumerWidget {
  const MyPageController({
    Key? key,
    required this.page,
    required this.number,
    required this.navKey,
  }) : super(key: key);

  final int number;
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
        child: CupertinoTabView(
          navigatorKey: navKey,
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              child: page,
            );
          },
        ),
      ),
    );
  }
}
