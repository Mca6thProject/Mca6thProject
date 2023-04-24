// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/page_nav/widgets/bottom_nav_bar.dart';

import '../home/ui/home_screen.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController? controller = ScrollController();
    final isVisible = useState(true);
    useEffect(() {
      controller.addListener(() {
        // final position = _controller.position.pixels;
        // bottomBarPosition.value = position;
        final direction = controller.position.userScrollDirection;
        if (direction == ScrollDirection.forward) {
          if (!isVisible.value) {
            isVisible.value = true;
          }
        } else if (direction == ScrollDirection.reverse) {
          if (isVisible.value) {
            isVisible.value = false;
          }
        }
      });
      return () {
        controller.dispose();
      };
    }, [controller]);

    //
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Colors.black,
          height: isVisible.value ? kBottomNavigationBarHeight : 0,
          child: const BottomNavBar()),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                TabBarView(
                    // physics: ,
                    children: [
                      HomeScreen(),
                      Container(),
                      Container(),
                    ]),
                Positioned(
                  top: 15,
                  left: 8,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: isVisible.value ? 36 : 0,
                    child: const Text(
                      "Nielit Aizawl",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 8,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: isVisible.value ? 38 : 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(
                        Icons.menu,
                        size: isVisible.value ? 24 : 0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
