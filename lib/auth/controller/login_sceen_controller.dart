import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../login/login_screen.dart';

final loginScreenController =
    StateProvider<Widget>((ref) => const LoginScreen());
