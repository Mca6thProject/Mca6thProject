import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // adding image to firebase storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, String fileName) async {
    // creating location to our firebase storage

    try {
      Reference ref = _storage.ref().child(childName).child(fileName);
      // if(isPost) {
      //   String id = const Uuid().v1();
      //   ref = ref.child(id);
      // }

      // putting in uint8list format -> Upload task like a future but not future
      UploadTask uploadTask = ref.putData(file);

      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      // print(e);
      return '';
    }
  }
}
