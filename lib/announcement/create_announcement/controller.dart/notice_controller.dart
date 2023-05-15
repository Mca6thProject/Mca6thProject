import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instinfo/announcement/model/announcement_model.dart';

import '../../model/announcement_model.dart';
import '../repository/notice_repository.dart';

final annoucementCreateAndUpdateErrorMessage = StateProvider((ref) => '');
final annoucementJoinNote = StateProvider((ref) => '');
final miniCategoryLabelController = StateProvider<TextEditingController>(
    ((ref) => TextEditingController(text: 'Select Category')));

late final AnnoucementRepository annoucementRepository;

///
final annoucementController =
    StateNotifierProvider<AnnoucementController, AsyncValue<List<Annoucement>>>(
        ((ref) => AnnoucementController(ref)..getAnnoucement()));

class AnnoucementController
    extends StateNotifier<AsyncValue<List<Annoucement>>> {
  AnnoucementController(this.ref) : super(const AsyncValue.loading());
  final Ref ref;
  //final AnnoucementRepository AnnoucementRepository;
  getAnnoucement() async {
    state = const AsyncLoading();

    try {
      final getAnnoucement =
          await ref.watch(annoucementrepository).getAnnoucement();
      if (mounted) {
        // upcomming(getAnnoucement);
        // ongoing(getAnnoucement);
        // outgoing(getAnnoucement);
        state = AsyncValue.data(getAnnoucement);
      }
    } catch (e) {
      print(e);
    }
  }

  refresh() async {
    try {
      state = const AsyncLoading();
      final getAnnoucement = await annoucementRepository.getAnnoucement();
      if (mounted) {
        // upcomming(getAnnoucement);
        // ongoing(getAnnoucement);
        // outgoing(getAnnoucement);
        state = AsyncValue.data(getAnnoucement);
      }
    } catch (e) {
      print(e);
    }
  }

  createAnnoucement(
    Annoucement annoucement,
    Uint8List file,
  ) {
    annoucementRepository.createAnnoucement(annoucement, file);
    if (mounted) {
      // List<Annoucement>? temp = state.value;
      state.value!.add(annoucement);
      List<Annoucement>? annoucementList = [];
      annoucementList = state.value;
      // upcomming(AnnoucementList!);
      // ongoing(AnnoucementList);
      // outgoing(AnnoucementList);
      //  reader(currentUserControllerProvider.notifier).createAnnoucement(Annoucement.id);
      state = AsyncValue.data(annoucementList!);
      // reader(userControllerProvider.notifier).
    }
  }

  ///
  updateAnnoucement(Annoucement annoucement, bool isNewPhoto, Uint8List file) {
    List<Annoucement> annoucementList = [];
    annoucementRepository.updateAnnoucement(annoucement, isNewPhoto, file);
    if (mounted) {
      // List<Annoucement>? temp = state.value;
      state.value!.removeWhere((element) => element.id == annoucement.id);
      state.value!.add(annoucement);
      annoucementList = state.value!;
      // upcomming(AnnoucementList);
      // ongoing(AnnoucementList);
      // outgoing(AnnoucementList);
      state = AsyncValue.data(annoucementList);
    }
  }

  deleteAnnoucement(annoucement) {
    annoucementRepository.deleteAnnoucement(annoucement);
  }
}
