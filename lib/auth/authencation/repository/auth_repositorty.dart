import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:typed_data';

import '../../../tools/storage_methods.dart';
import '../../user_model.dart';
import '../controller/auth_controller.dart';
import '../widget/clean_text.dart';

final authRepository = Provider<Authentication>((_) => Authentication(_));

class Authentication {
  final Ref read;
  Authentication(this.read);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChange => _auth.authStateChanges();
  String fileUrl = '';
  //  SigIn the user using Email and Password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      // Reader ref;
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        userUid = value.user!.uid;

        // }));
        read.watch(userCredentialIdProvider.state).state = value.user!.uid;
        //read.watch(currentUserControllerProvider).;
      });
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: cleanText(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(Uint8List file, String email,
      String password, String name, String bio, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // read(userCredentialIdProvider.state).state = userCredential.user!.uid;
      // read(currentUserControllerProvider);
      // String photoUrl =
      //     await StorageMethods().uploadImageToStorage('user', file, name);

      ///

      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          name: name,
          status: '',
          email: email,
          phno: '',
          userType: '',
          isBlock: false,
          address: '',
          course: '',
          semester: '',
          regNo: '');

//add user to firestore
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      read.read(userCredentialIdProvider.state).state =
          userModel.id; //value.user!.uid;
      // read.read(currentUserControllerProvider);
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occured'),
                  content: Text(e
                      .toString()
                      .replaceAll('[firebase_auth/wrong-password]', '')),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("OK"))
                  ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        //  print('Email already in use.');
      } else {
        // print('Error: $e');
      }
    }
  }

  //  SignIn the user Google
  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Error Occured'),
          content: Text(e.toString()),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("OK"))
          ],
        ),
      );
    }
  }

  // Future uploadFile(String filePath, Uni platformFile) async {
  //   final ref = FirebaseStorage.instance.ref().child(filePath);
  //   uploadTask = ref.putFile(File(platformFile.path!));
  //   final snapshot = await uploadTask!.whenComplete(() {
  //     print('File Uploaded');
  //   });
  //   fileUrl = await snapshot.ref.getDownloadURL();

  //   print('File Uploaded');
  // }

  //  SignOut the current user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
