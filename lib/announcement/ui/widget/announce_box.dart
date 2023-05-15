import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/announcement/post/post_model.dart';

class AnnounceCard extends HookConsumerWidget {
  final Post post;
  const AnnounceCard(this.post, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.grey.shade800,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
              width: 70,
              height: 70,
              child: ExtendedImage.network(
                post.link.toString(),
                fit: BoxFit.fill,
                cache: true,
                border: Border.all(color: Colors.grey.shade200, width: 1.0),
                borderRadius: BorderRadius.circular(16),
              )
              // Material(
              //   color: index.isNegative ? Colors.white : colorList3[index],
              //   borderRadius: BorderRadius.circular(12),
              // ),
              ),
        ),
      ),
    );
  }
}
