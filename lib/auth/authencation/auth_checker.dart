import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/home/ui/home_screen.dart';
import '../../page_nav/bottom_tab.dart';
import 'controller/auth_controller.dart';
import 'login_signup_screen.dart';

class AuthChecker extends HookConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateControllerProvider);

    return authState.when(
        data: (data) {
          if (data != null) {
            userUid = data.uid;

            print(data.uid);
          }
          return data != null ? const HomeScreen() : const LoginSignUpScreen();
        },
        loading: () => const Scaffold(
              body: Center(child: CupertinoActivityIndicator()),
            ),
        error: (e, trace) => Text(e.toString()));
  }
}
