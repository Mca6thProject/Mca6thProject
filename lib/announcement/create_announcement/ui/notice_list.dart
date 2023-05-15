import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller.dart/notice_controller.dart';

class AnnoucementList extends HookConsumerWidget {
  const AnnoucementList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(annoucementController);
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
