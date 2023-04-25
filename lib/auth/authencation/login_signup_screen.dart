import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'controller/login_sceen_controller.dart';

class LoginSignUpScreen extends HookConsumerWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(child: ref.watch(loginScreenController)),
    );
  }
}
