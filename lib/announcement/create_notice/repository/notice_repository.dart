import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../tools/storage_methods.dart';
import '../notice_model.dart';

final noticerepository = Provider((ref) => NoticeRepository());

class NoticeRepository {
  Future createnotice(Notice notice, Uint8List file) async {
    // final userData=reader()
    final firebase = FirebaseFirestore.instance;
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('notice', file, notice.title);
      notice.copyWith(img: photoUrl);
      firebase.collection('notice').doc(notice.id).set(Notice(
            id: notice.id,
            img: photoUrl,
            link: notice.link,
            body: '',
            date: '',
            others: '',
            subtitle: '',
            title: '',
          ).toMap());
      // .then((value) => reader(currentUserControllerProvider.notifier)
      // );
      getnotice();
    } catch (e) {
      print(e);
    }
  }

  ///
  Future updatenotice(Notice notice, bool isNewPhoto, Uint8List file) async {
    final firebase = FirebaseFirestore.instance;
    try {
      String imgUrl = '';
      if (isNewPhoto) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('notice', file, notice.title);

        imgUrl = photoUrl;
      }
      firebase
          .collection('notice')
          .doc(notice.id)
          .update(Notice(
            id: notice.id,
            img: isNewPhoto ? imgUrl : notice.img,
            link: notice.link,
            body: '',
            date: '',
            others: '',
            subtitle: '',
            title: '',
          ).toMap())
          .then((value) => print('done'));
    } catch (e) {
      //print(e);
    }
  }

  Future deletenotice(Notice notice) async {
    final firebase = FirebaseFirestore.instance;
    try {
      firebase
          .collection('notice')
          .doc(notice.id)
          .delete()
          .then((value) => print('done'));
    } catch (e) {
      //print(e);
    }
  }

  Future<List<Notice>> getnotice() async {
    final firebase = FirebaseFirestore.instance;
    try {
      List<Notice> noticeList = [];
      final snapshot = await firebase
          .collection('notice')
          .orderBy('startDate', descending: true)
          .get();

      for (var element in snapshot.docs) {
        noticeList.add(Notice.fromMap(element.data()));
      }

      return noticeList;
    } catch (e) {
      return [];
    }
  }
}
