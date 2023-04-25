import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../current_user_screen.dart';
import 'appbar_icon.dart';

Widget currentUserButton(BuildContext context) {
  return Builder(
    builder: (context) => GestureDetector(
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute(
          builder: (context) => const CurrentUserProfileScreen(''),
        ),
      ),
      child: appBarIcon(Icons.person_outline_outlined),
    ),
  );
}
