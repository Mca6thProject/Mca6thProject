import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/tools/storage_methods.dart';
import '../../model/announcement_model.dart';

final annoucementrepository = Provider((ref) => AnnoucementRepository());

class AnnoucementRepository {
  Future createAnnoucement(Annoucement annoucement, Uint8List file) async {
    // final userData=reader()
    final firebase = FirebaseFirestore.instance;
    try {
      String photoUrl = await StorageMethods()
          .uploadImageToStorage('Annoucement', file, annoucement.title);
      annoucement.copyWith(img: photoUrl);
      firebase.collection('Annoucement').doc(annoucement.id).set(Annoucement(
            id: annoucement.id,
            img: photoUrl,
            link: annoucement.link,
            body: '',
            date: '',
            others: '',
            subtitle: '',
            title: '',
            type: '',
          ).toMap());
      // .then((value) => reader(currentUserControllerProvider.notifier)
      // );
      getAnnoucement();
    } catch (e) {
      print(e);
    }
  }

  ///
  Future updateAnnoucement(
      Annoucement annoucement, bool isNewPhoto, Uint8List file) async {
    final firebase = FirebaseFirestore.instance;
    try {
      String imgUrl = '';
      if (isNewPhoto) {
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('Annoucement', file, annoucement.title);

        imgUrl = photoUrl;
      }
      firebase
          .collection('Annoucement')
          .doc(annoucement.id)
          .update(Annoucement(
            id: annoucement.id,
            img: isNewPhoto ? imgUrl : annoucement.img,
            link: annoucement.link,
            body: '',
            date: '',
            others: '',
            subtitle: '',
            title: '',
            type: '',
          ).toMap())
          .then((value) => print('done'));
    } catch (e) {
      //print(e);
    }
  }

  Future deleteAnnoucement(Annoucement annoucement) async {
    final firebase = FirebaseFirestore.instance;
    try {
      firebase
          .collection('Annoucement')
          .doc(annoucement.id)
          .delete()
          .then((value) => print('done'));
    } catch (e) {
      //print(e);
    }
  }

  Future<List<Annoucement>> getAnnoucement() async {
    final firebase = FirebaseFirestore.instance;
    try {
      List<Annoucement> annoucementList = [];
      final snapshot = await firebase
          .collection('Annoucement')
          .orderBy('startDate', descending: true)
          .get();

      for (var element in snapshot.docs) {
        annoucementList.add(Annoucement.fromMap(element.data()));
      }

      return annoucementList;
    } catch (e) {
      return [];
    }
  }
}
