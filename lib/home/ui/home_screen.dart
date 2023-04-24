import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:instinfo/exam/ui/exam_screen.dart';
import 'package:instinfo/home/ui/widget/category_box.dart';

import '../../announcement/ui/widget/announce_box.dart';
import '../../announcement/ui/widget/announce_text.dart';
import 'widget/mini_cate_box.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Stack(children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
                child: Text(
                  "Nielit Aizawl",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const AnnounceText(),
              const AnnouceCard(),
              const Padding(
                padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                child: Text(
                  "Category",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Row(
                children: const [MiniCard(), PicOfTheDayCard()],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => ExamScreen()));
                    },
                    child: CategoryCard(
                      icon: Icons.edit_document,
                      text: "Exam",
                    ),
                  ),
                  CategoryCard(
                    icon: Icons.app_registration,
                    text: "Semester Registration",
                  ),
                ],
              ),
              Row(
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(
                    Icons.menu,
                    color: Colors.black,
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
