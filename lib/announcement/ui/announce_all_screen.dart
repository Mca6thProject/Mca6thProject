import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instinfo/announcement/ui/widget/announce_box.dart';

import '../post/controller/post_controller.dart';
import 'widget/announce_card.dart';

class AnnouceAllScreen extends ConsumerWidget {
  const AnnouceAllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final user = ref.watch(userProvider)!;
    // final isGuest = !user.isAuthenticated;

    return ref.watch(postsProvider).when(
          data: (data) {
            return Material(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              //  height: 230,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      // viewportFraction: 0.9,
                      //scale: 0.93,
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final post = data[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 30, right: 16, left: 16),
                          child: AnnouceCard(post),
                        );
                      },
                    ),
                    Positioned(
                      top: 2,
                      // left: 4,
                      child: Container(
                        height: 25,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              height: 4,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            return Text(
              error.toString(),
            );
          },
          loading: () => const SizedBox(
              height: 250, child: Center(child: CircularProgressIndicator())),
        );
  }
}
