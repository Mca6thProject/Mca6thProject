import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import '../home/ui/home_screen.dart';
import 'root_page.dart';

final CupertinoTabController _tabController = CupertinoTabController();

class RootPage extends HookConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.watch(currentUserControllerProvider.notifier).refresh();
    final GlobalKey<NavigatorState> firstTabNavKey =
        GlobalKey<NavigatorState>();
    final GlobalKey<NavigatorState> secondTabNavKey =
        GlobalKey<NavigatorState>();
    final GlobalKey<NavigatorState> thirdTabNavKey =
        GlobalKey<NavigatorState>();
    final GlobalKey<NavigatorState> fourthTabNavKey =
        GlobalKey<NavigatorState>();

    GlobalKey<NavigatorState> currentNavigatorKey() {
      switch (_tabController.index) {
        case 0:
          return firstTabNavKey;
        case 1:
          return secondTabNavKey;

        case 2:
          return thirdTabNavKey;

        case 3:
          return fourthTabNavKey;
      }
      return fourthTabNavKey;
    }

//
    return WillPopScope(
      onWillPop: () async {
        return !await currentNavigatorKey().currentState!.maybePop();
      },
      child: CupertinoTabScaffold(
        controller: _tabController,
        tabBar: _createTabBar(),
        tabBuilder: (BuildContext context, int index) {
          Widget tabPage;
          switch (index) {
            case 0:
              tabPage = MyPageController(
                page: const HomeScreen(),
                navKey: firstTabNavKey,
                number: index + 1,
              );
              break;
            case 1:
              tabPage = MyPageController(
                page: Container(
                  child: Center(child: Text('Explore Screen')),
                ),
                navKey: secondTabNavKey,
                number: index + 1,
              );
              break;
            case 2:
              tabPage = MyPageController(
                page: Container(
                  child: Center(child: Text('Profile Screen')),
                ),
                navKey: thirdTabNavKey,
                number: index + 1,
              );
              break;

            default:
              tabPage = const Center(
                child: Text('Invalid page.'),
              );
              break;
          }
          return Material(
            type: MaterialType.transparency,
            child: tabPage,
          );
        },
      ),
    );
  }

  CupertinoTabBar _createTabBar() {
    return CupertinoTabBar(
      backgroundColor: Colors.white,
      activeColor: Colors.blueAccent,
      border: const Border(top: BorderSide(color: Colors.white, width: 0.0)),
      height: 50,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Iconsax.home_2,
            color: Colors.grey.shade700,
            size: 24,
          ),
          activeIcon: const Icon(
            Iconsax.home_2,
            color: Colors.blueAccent,
            size: 26,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Iconsax.save_2,
            color: Colors.grey.shade700,
            size: 24,
          ),
          activeIcon: const Icon(
            Iconsax.save_2,
            color: Colors.blueAccent,
            size: 26,
          ),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Iconsax.user,
            color: Colors.grey.shade700,
            size: 24,
          ),
          activeIcon: const Icon(
            Iconsax.user4,
            color: Colors.blueAccent,
            size: 26,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
