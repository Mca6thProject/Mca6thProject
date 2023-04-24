import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notice_model.dart';
import '../repository/notice_repository.dart';

final noticeCreateAndUpdateErrorMessage = StateProvider((ref) => '');
final noticeJoinNote = StateProvider((ref) => '');
final miniCategoryLabelController = StateProvider<TextEditingController>(
    ((ref) => TextEditingController(text: 'Select Category')));

late final NoticeRepository noticeRepository;

///
final noticeController =
    StateNotifierProvider<NoticeController, AsyncValue<List<Notice>>>(
        ((ref) => NoticeController(ref)..getnotice()));

class NoticeController extends StateNotifier<AsyncValue<List<Notice>>> {
  NoticeController(this.ref) : super(const AsyncValue.loading());
  final Ref ref;
  //final NoticeRepository noticeRepository;
  getnotice() async {
    state = const AsyncLoading();

    try {
      final getnotice = await ref.watch(noticerepository).getnotice();
      if (mounted) {
        // upcomming(getnotice);
        // ongoing(getnotice);
        // outgoing(getnotice);
        state = AsyncValue.data(getnotice);
      }
    } catch (e) {
      print(e);
    }
  }

  refresh() async {
    try {
      state = const AsyncLoading();
      final getnotice = await noticeRepository.getnotice();
      if (mounted) {
        // upcomming(getnotice);
        // ongoing(getnotice);
        // outgoing(getnotice);
        state = AsyncValue.data(getnotice);
      }
    } catch (e) {
      print(e);
    }
  }

  createnotice(
    Notice notice,
    Uint8List file,
  ) {
    noticeRepository.createnotice(notice, file);
    if (mounted) {
      // List<notice>? temp = state.value;
      state.value!.add(notice);
      List<Notice>? noticeList = [];
      noticeList = state.value;
      // upcomming(noticeList!);
      // ongoing(noticeList);
      // outgoing(noticeList);
      //  reader(currentUserControllerProvider.notifier).createnotice(notice.id);
      state = AsyncValue.data(noticeList!);
      // reader(userControllerProvider.notifier).
    }
  }

  ///
  updatenotice(Notice notice, bool isNewPhoto, Uint8List file) {
    List<Notice> noticeList = [];
    noticeRepository.updatenotice(notice, isNewPhoto, file);
    if (mounted) {
      // List<notice>? temp = state.value;
      state.value!.removeWhere((element) => element.id == notice.id);
      state.value!.add(notice);
      noticeList = state.value!;
      // upcomming(noticeList);
      // ongoing(noticeList);
      // outgoing(noticeList);
      state = AsyncValue.data(noticeList);
    }
  }

  deletenotice(notice) {
    noticeRepository.deletenotice(notice);
  }
}
