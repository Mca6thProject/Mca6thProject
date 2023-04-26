import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/announcement/ui/announce_details_screen.dart';
import 'package:instinfo/post/post_model.dart';
import 'package:instinfo/tools/date_time_format.dart';

class AnnouceCard extends HookConsumerWidget {
  final Post post;
  const AnnouceCard(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) {
            return AnnounceDetailsScreen(
              post: post,
            );
          }),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ExtendedImage.network(
                    post.link.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                color: Colors.transparent.withAlpha(70),
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                post.title.toString(),
                                style: TextStyle(
                                    color: Colors.grey.shade100,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                            Text(
                              dateTimeFormat(post.createdAt.toString()),
                              style: TextStyle(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        post.description.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(color: Colors.grey.shade200),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
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
