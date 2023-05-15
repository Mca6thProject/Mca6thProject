import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../exam/ui/create_exam_main_screen.dart';
import '../../home/ui/widget/category_box.dart';
import '../../announcement/post/screens/add_post_screen_main.dart';

class AdminPanelScreen extends HookConsumerWidget {
  const AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 20, bottom: 18),
              child: Text(
                "Admin Panel",
                style: GoogleFonts.sourceSansPro(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const AddPostScreenMain())),
                    child: const CategoryCard(
                      icon: CupertinoIcons.doc_append,
                      text: "Create Announcement",
                    ),
                  ),
                  const CategoryCard(
                    icon: Icons.library_books_outlined,
                    text: "Time Table",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CreateExamScreenMain())),
                    child: const CategoryCard(
                      icon: CupertinoIcons.pencil_outline,
                      text: "Exam",
                    ),
                  ),
                  const CategoryCard(
                    icon: Icons.library_books_outlined,
                    text: "Library",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const AddPostScreenMain())),
                    child: const CategoryCard(
                      icon: CupertinoIcons.doc_append,
                      text: "Create Announcement",
                    ),
                  ),
                  const CategoryCard(
                    icon: Icons.library_books_outlined,
                    text: "Library",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
