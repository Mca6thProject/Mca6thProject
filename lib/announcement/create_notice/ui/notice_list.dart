import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller.dart/notice_controller.dart';

class NoticeList extends HookConsumerWidget {
  const NoticeList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(noticeController);
    return state.when(
        data: (state) {
          return const Text("asd");
        },
        error: (a, e) {
          return Text(a.toString());
        },
        loading: () => const Text("Loading"));
  }
}
