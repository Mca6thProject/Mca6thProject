import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../announcement/post/controller/post_controller.dart';
import '../../announcement/post/utils.dart';
import '../../responsive/responsive.dart';

class CreateExamScreenMain extends ConsumerStatefulWidget {
  const CreateExamScreenMain({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateExamScreenMainState();
}

class _CreateExamScreenMainState extends ConsumerState<CreateExamScreenMain> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final linkController = TextEditingController();
  File? bannerFile;
  Uint8List? bannerWebFile;

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
          type: '');
    } else {
      showSnackBar(context, 'Please enter all the fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final currentTheme = ref.watch(themeNotifierProvider);
    final isLoading = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'Exam',
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
          : Responsive(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  SizedBox(
                    height: 8,
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
                  //   if (isTypeText)
                  //     TextField(
                  //       controller: descriptionController,
                  //       decoration: const InputDecoration(
                  //         filled: true,
                  //         hintText: 'Enter Description here',
                  //         border: InputBorder.none,
                  //         contentPadding: EdgeInsets.all(18),
                  //       ),
                  //       maxLines: 5,
                  //     ),
                  //   if (isTypeLink)
                  //     TextField(
                  //       controller: linkController,
                  //       decoration: const InputDecoration(
                  //         filled: true,
                  //         hintText: 'Enter link here',
                  //         border: InputBorder.none,
                  //         contentPadding: EdgeInsets.all(18),
                  //       ),
                  //     ),
                  //   const SizedBox(height: 20),
                  //   const Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Text(
                  //       'Select Community',
                  //     ),
                  //   ),
                  //   ref.watch(userCommunitiesProvider).when(
                  //         data: (data) {
                  //           communities = data;

                  //           if (data.isEmpty) {
                  //             return const SizedBox();
                  //           }

                  //           return DropdownButton(
                  //             value: selectedCommunity ?? data[0],
                  //             items: data
                  //                 .map(
                  //                   (e) => DropdownMenuItem(
                  //                     value: e,
                  //                     child: Text(e.name),
                  //                   ),
                  //                 )
                  //                 .toList(),
                  //             onChanged: (val) {
                  //               setState(() {
                  //                 selectedCommunity = val;
                  //               });
                  //             },
                  //           );
                  //         },
                  //         error: (error, stackTrace) => ErrorText(
                  //           error: error.toString(),
                  //         ),
                  //         loading: () => const Loader(),
                  //       ),

                  // ],

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
    );
  }
}
