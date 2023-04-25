import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instinfo/announcement/ui/widget/announce_box.dart';

import '../../../post/controller/post_controller.dart';
import 'announce_card.dart';

class AnnouceScreen extends ConsumerWidget {
  const AnnouceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider)!;
    // final isGuest = !user.isAuthenticated;

    return ref.watch(postsProvider).when(
          data: (data) {
            return SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  final post = data[index];
                  return AnnouceCard(post);
                },
              ),
            );
          },
          error: (error, stackTrace) {
            return Text(
              error.toString(),
            );
          },
          loading: () => const CircularProgressIndicator(),
        );
  }
}
