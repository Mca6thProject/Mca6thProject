import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/announcement/ui/announce_screen.dart';
import 'package:instinfo/auth/current_user/ui/current_user_screen.dart';
import 'package:instinfo/exam/ui/exam_screen.dart';
import 'package:instinfo/home/ui/widget/category_box.dart';
import 'package:instinfo/post/screens/add_post_screen.dart';

import '../../announcement/ui/widget/announce_box.dart';
import '../../announcement/ui/widget/announce_text.dart';
import '../../post/screens/add_post_screen_main.dart';
import 'widget/mini_cate_box.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                child: Text(
                  "Nielit Aizawl",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const AnnounceText(),
              const AnnouceScreen(),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [MiniCard(), PicOfTheDayCard()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => ExamScreen()));
                      },
                      child: const CategoryCard(
                        icon: Icons.edit_document,
                        text: "Exam",
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const AddPostScreenMain())),
                      child: const CategoryCard(
                        icon: Icons.app_registration,
                        text: "Semester Registration",
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CategoryCard(
                      icon: Icons.person_4,
                      text: "Faculty",
                    ),
                    CategoryCard(
                      icon: Icons.library_books_outlined,
                      text: "Library",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (_) =>
                          const CurrentUserProfileScreen("heroTag")));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, right: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
