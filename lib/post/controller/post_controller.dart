import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instinfo/auth/current_user/controller/current_user_controller_provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uuid/uuid.dart';

import '../../tools/utils.dart';
import '../post_model.dart';
import '../repository/post_repository.dart';
import '../repository/storage_repository_provider.dart';

final postControllerProvider =
    StateNotifierProvider<PostController, bool>((ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return PostController(
    postRepository: postRepository,
    storageRepository: storageRepository,
    ref: ref,
  );
});

final postsProvider = StreamProvider((ref) {
  final postController = ref.watch(postControllerProvider.notifier);
  return postController.fetchtPosts();
});

class PostController extends StateNotifier<bool> {
  final PostRepository _postRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  PostController({
    required PostRepository postRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _postRepository = postRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);

  void shareImagePost({
    required BuildContext context,
    required String title,
    required File? file,
    required String description,
    required Uint8List? webFile,
  }) async {
    state = true;
    String postId = const Uuid().v1();
    //  final user = _ref.read(currentUserControllerProvider);
    final imageRes = await _storageRepository.storeFile(
      path: 'posts',
      id: postId,
      file: file,
      webFile: webFile,
    );

    imageRes?.fold((l) => showSnackBar(context, l.message), (r) async {
      final Post post = Post(
          id: postId,
          title: title,
          type: 'image',
          createdAt: DateTime.now(),
          link: r,
          description: description);

      final res = await _postRepository.addPost(post);
      // _ref.read(userProfileControllerProvider.notifier).updateUserKarma(UserKarma.imagePost);
      state = false;
      res.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(context, 'Posted successfully!');
        //Routemaster.of(context).pop();
        Navigator.of(context).pop();
      });
    });
  }

  Stream<List<Post>> fetchtPosts() {
    return _postRepository.fetchPosts();
  }

  void deletePost(Post post, BuildContext context) async {
    final res = await _postRepository.deletePost(post);
    res.fold((l) => null,
        (r) => showSnackBar(context, 'Post Deleted successfully!'));
  }
}
