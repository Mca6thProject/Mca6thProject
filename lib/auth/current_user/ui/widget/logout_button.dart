import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../authencation/controller/auth_controller.dart';
import '../../../authencation/login_signup_screen.dart';

class LogoutButton extends HookConsumerWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          ref
              .read(authenticationProvider)
              .signOut()
              .whenComplete(() => ref.watch(authStateControllerProvider));
          userUid = '';
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const LoginSignUpScreen()));
        },
        child: Text(
          'Logout',
          style: TextStyle(color: Colors.blue),
        ));
  }
}
