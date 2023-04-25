import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../current_user/controller/current_user_controller_provider.dart';
import '../../current_user/ui/widget/edit_current_user_profile.dart';
import '../../current_user/ui/widget/logout_button.dart';

class UserProfileDetails extends HookConsumerWidget {
  final Widget bottom;
  final String heroTag;
  final bool isCurrentUser;
  const UserProfileDetails(
      {Key? key,
      required this.bottom,
      required this.heroTag,
      required this.isCurrentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userProfile = ref.watch(currentUserControllerProvider);

    return SliverAppBar(
        expandedHeight: 200.0,
        pinned: true,
        floating: true,
        centerTitle: false,
        automaticallyImplyLeading: false,
        stretch: true,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.arrow_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          isCurrentUser
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: LogoutButton(),
                )
              : Container()
        ],
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50), child: bottom),
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Container(
              //  height: 20,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Colors.grey.shade200),
                    bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: userProfile.when(
                data: (user) => Padding(
                  padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          SizedBox(
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
//User Name --------------------------------------------------------------
                                Text(
                                  user.name,
                                  style: TextStyle(
                                      // color: textColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  user.email,
                                  style: TextStyle(
                                    // color: textColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  user.phno,
                                  style: TextStyle(
                                    // color: textColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      EditCurrentUserProfileButton(user),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (e, _) => Center(
                  child: Text(e.toString()),
                ),
              ),
            )));
  }

  Widget title() {
    return Text(
      '  user.userName',
      style: TextStyle(
          //color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }

  Widget followers() {
    return Row(
      children: [
        const Text(
          'user.followers.length.toString() followers',
          style: TextStyle(
              // fontWeight: FontWeight.w500,
              fontSize: 14),
        ),
        const SizedBox(
          width: 8,
        ),
        Icon(
          Icons.favorite_border,
          color: Colors.grey.shade600,
          size: 16,
        ),
      ],
    );
  }

  Widget following() {
    return const Text(
      ' user.following.toString()' ' following',
      style: TextStyle(
          // fontWeight: FontWeight.w500,
          fontSize: 14),
    );
  }
}
