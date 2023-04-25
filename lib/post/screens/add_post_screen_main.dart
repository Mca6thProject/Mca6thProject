import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../responsive/responsive.dart';
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
      ref.read(postControllerProvider.notifier).shareImagePost(
            context: context,
            title: titleController.text.trim(),
            file: bannerFile,
            webFile: bannerWebFile,
          );
    }
    //  else if (widget.type == 'text' && titleController.text.isNotEmpty) {
    //   ref.read(postControllerProvider.notifier).shareTextPost(
    //         context: context,
    //         title: titleController.text.trim(),
    //         selectedCommunity: selectedCommunity ?? communities[0],
    //         description: descriptionController.text.trim(),
    //       );
    // } else if (widget.type == 'link' && titleController.text.isNotEmpty && linkController.text.isNotEmpty) {
    //   ref.read(postControllerProvider.notifier).shareLinkPost(
    //         context: context,
    //         title: titleController.text.trim(),
    //         selectedCommunity: selectedCommunity ?? communities[0],
    //         link: linkController.text.trim(),
    //       );
    // } else {
    //   showSnackBar(context, 'Please enter all the fields');
    // }
  }

  @override
  Widget build(BuildContext context) {
    //  final currentTheme = ref.watch(themeNotifierProvider);
    final isLoading = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Announcement'),
        actions: [
          TextButton(
            onPressed: sharePost,
            child: const Text(
              'Post',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : Responsive(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      filled: true,
                      hintText: 'Enter Title here',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(18),
                    ),
                    maxLength: 30,
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
                        height: 150,
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
                ]),
              ),
            ),
    );
  }
}
