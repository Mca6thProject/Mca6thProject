import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/post/post_model.dart';

class AnnouceCard extends HookConsumerWidget {
  final Post post;
  const AnnouceCard(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 220,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: SizedBox(
          width: 220,
          height: 214,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              post.link.toString(),
            ),
            radius: 16,
          ),
        ),
      ),
    );
  }
}

///
///
// class FeatureListUi extends HookConsumerWidget {
//   const FeatureListUi({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(eventController);
//     return state.when(
//       data: (event) {
//         return ListView.builder(
//           // reverse: false,
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: event.length,
//           itemBuilder: (context, index) {
//             final data = event[index];
//             return InkWell(
//                 onTap: () {
//                   ref
//                       .read(eventDetailsController.notifier)
//                       .checkEvent(event[index]);
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => EventDetailsScreen(
//                             event: data,
//                           )));
//                 },
//                 child: ItemBoxRectangle(index, data));
//           },
//         );
//       },
//       loading: () => SizedBox(
//           height: MediaQuery.of(context).size.height,
//           child: const Center(child: CircularProgressIndicator())),
//       error: (e, _) => Center(child: Text(e.toString())),
//     );
//   }
// }
