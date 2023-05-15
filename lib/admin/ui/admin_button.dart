import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/admin/ui/admin_panel_screen.dart';
import 'package:instinfo/auth/current_user/controller/current_user_controller_provider.dart';

class AdminButton extends HookConsumerWidget {
  const AdminButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserControllerProvider);
    return user.when(data: (state) {
      return state.userType == 'Admin'
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (_) => const AdminPanelScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0, right: 8),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(
                    Icons.admin_panel_settings,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          : const Padding(
              padding: EdgeInsets.only(top: 18.0, right: 8),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.admin_panel_settings,
                  color: Colors.transparent,
                ),
              ),
            );
    }, error: (e, a) {
      return Container();
    }, loading: () {
      return const Padding(
        padding: EdgeInsets.only(top: 18.0, right: 8),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.admin_panel_settings,
            color: Colors.transparent,
          ),
        ),
      );
    });
  }
}
