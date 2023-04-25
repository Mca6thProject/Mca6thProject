import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/ui/user_profile_details.dart';
import '../controller/current_user_controller_provider.dart';

class CurrentUserProfileScreen extends HookConsumerWidget {
//final String userId;
  final String heroTag;
  const CurrentUserProfileScreen(this.heroTag, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(currentUserControllerProvider);

    return Scaffold(
        body: SafeArea(
      child: userProfile.when(
        data: (user) {
          return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  UserProfileDetails(
                    bottom: Row(
                      children: const [
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    heroTag: heroTag,
                    isCurrentUser: true,
                  )
                ];
              },
              body: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.pin_drop),
                    title: Text(user.address),
                    subtitle: Text('Address'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.auto_graph_rounded),
                    title: Text(user.course),
                    subtitle: Text('Course'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.badge_rounded),
                    title: Text(user.semester),
                    subtitle: Text('Semester'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.app_registration),
                    title: Text(user.regNo),
                    subtitle: Text('Registration No.'),
                  ),
                ],
              ));
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (context, error) {
          return Center(
            child: Text(error.toString()),
          );
        },
      ),
    ));
  }

  // Widget bio(String bio) {
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 14, right: 14, top: 20),
  //     child: Text(
  //       bio,
  //       style: const TextStyle(fontSize: 12),
  //     ),
  //   );
  // }
}
