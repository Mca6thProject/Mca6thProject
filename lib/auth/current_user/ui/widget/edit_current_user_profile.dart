import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../user_model.dart';
import '../edit_current_user_profile_screen.dart';

class EditCurrentUserProfileButton extends HookConsumerWidget {
  final UserModel userModel;
  const EditCurrentUserProfileButton(this.userModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        height: 32,
        child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            minWidth: MediaQuery.of(context).size.width,
            color: Colors.blue,
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) =>
                      EditCurrentUserProfileScreen(userModel)));
            },
            child: Text(
              'Edit my profile',
              style: TextStyle(color: Colors.grey.shade200),
            )));
  }
}
