import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../responsive/responsive.dart';
import '../controller/post_controller.dart';
import '../utils.dart';

class AddPostScreenMain extends ConsumerStatefulWidget {
  const AddPostScreenMain({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddPostScreenMainState();
}

class _AddPostScreenMainState extends ConsumerState<AddPostScreenMain> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final linkController = TextEditingController();
  File? bannerFile;
  Uint8List? bannerWebFile;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Notice", child: Text("Notice")),
      const DropdownMenuItem(value: "Exam", child: Text("Exam")),
      const DropdownMenuItem(value: "Library", child: Text("Library")),
      const DropdownMenuItem(
          value: "Semester_Registrarion", child: Text("Semester Registration")),
    ];
    return menuItems;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
    linkController.dispose();
  }

  void selectBannerImage() async {
    final res = await pickFileImage();

    if (res != null) {
      if (kIsWeb) {
        setState(() {
          bannerWebFile = res.files.first.bytes;
        });
      }
      setState(() {
        bannerFile = File(res.files.first.path!);
      });
    }
  }

  void sharePost() {
    if ((bannerFile != null || bannerWebFile != null) &&
        titleController.text.isNotEmpty) {
      ref.read(postControllerProvider.notifier).postAnnouncement(
          context: context,
          title: titleController.text.trim(),
          file: bannerFile,
          webFile: bannerWebFile,
          description: descriptionController.text.trim(),
          type: ref.watch(selectedCategory));
    } else {
      showSnackBar(context, 'Please enter all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final currentTheme = ref.watch(themeNotifierProvider);
    // String selectedValue = ref.watch(selectedCategory);
    final isLoading = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'Announcement',
          style: GoogleFonts.sourceSansPro(color: Colors.white, fontSize: 28),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: TextButton(
              onPressed: sharePost,
              child: Text(
                'Post',
                style: GoogleFonts.sourceSansPro(
                    color: Colors.white, fontSize: 26),
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              const Text(
                                "Category",
                                style: TextStyle(fontSize: 20),
                              ),
                              const Spacer(),
                              DropdownButton(
                                  value: ref.watch(selectedCategory),
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  isDense: true,
                                  dropdownColor: Colors.grey,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      ref
                                          .read(selectedCategory.notifier)
                                          .state = newValue!;
                                    });
                                  },
                                  items: dropdownItems),
                            ],
                          ),
                        ),
                        TextField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter Title here',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(18),
                          ),
                          maxLength: 40,
                        ),
                        const SizedBox(height: 10),
                        // if (isTypeImage)
                        GestureDetector(
                          onTap: selectBannerImage,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            //  color: currentTheme.textTheme.bodyText2!.color!,
                            child: Container(
                              width: double.infinity,
                              height: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: bannerWebFile != null
                                  ? Image.memory(bannerWebFile!)
                                  : bannerFile != null
                                      ? Image.file(bannerFile!)
                                      : const Center(
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            size: 40,
                                          ),
                                        ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: const InputDecoration(
                            filled: true,
                            hintText: 'Enter Description here',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(18),
                          ),
                          maxLines: 10,
                        ),
                      ]),
                ),
              ),
            ),
    );
  }
}
