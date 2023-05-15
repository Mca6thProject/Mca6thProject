import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../authencation/controller/auth_controller.dart';
import '../../user_model.dart';

final currentUserRepositoryProvider =
    Provider<UserRepository>((_) => UserRepository(_));

class UserRepository {
  final Ref read;
  UserRepository(this.read);

  Future<UserModel?> getUser(String userId) async {
    final firebase = FirebaseFirestore.instance;

    try {
      final result = await firebase.collection('user').doc(userId).get();
      print(result.data());
      UserModel user = UserModel.fromMap(result.data()!);
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  createEvent(String eventid) {
    final firebase = FirebaseFirestore.instance;
    try {
      firebase
          .collection('user')
          .doc(read.read(authStateControllerProvider).value!.uid)
          .update({
        'createEvent': FieldValue.arrayUnion([eventid])
      });
    } catch (e) {
      //print(e);
    }
  }

  followUser(String currentUserId, String specificUser) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('user').doc(specificUser).update({
        'followers': FieldValue.arrayUnion([currentUserId])
      }).whenComplete(
          () => firebase.collection('user').doc(currentUserId).update({
                'following': FieldValue.arrayUnion([specificUser])
              }));
    } catch (e) {
      // print(e);
      return null;
    }
  }

  unfollowUser(
    String currentUserId,
    String specificUserId,
  ) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('user').doc(specificUserId).update({
        'followers': FieldValue.arrayRemove([currentUserId])
      }).whenComplete(
          () => firebase.collection('user').doc(currentUserId).update({
                'following': FieldValue.arrayRemove([specificUserId])
              }));
    } catch (e) {
      // print(e);
      return null;
    }
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  editProfile(UserModel user) async {
    await FirebaseFirestore.instance.collection('user').doc(user.id).update({
      'userName': user.name,
      'address': user.address,
      'phno': user.phno,
      'course': user.course,
      'semester': user.semester,
      'regNo': user.regNo
    });
  }

  likePost(
    String currentUserId,
    String postId,
  ) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('user').doc(currentUserId).update({
        'likesPost': FieldValue.arrayUnion([postId])
      }).whenComplete(() => firebase.collection('post').doc(postId).update({
            'like': FieldValue.arrayUnion([currentUserId])
          }));
    } catch (e) {
      // print(e);
    }
  }

  diskLikepost(
    String currentUserId,
    String categoryId,
  ) async {
    final firebase = FirebaseFirestore.instance;
    try {
      await firebase.collection('user').doc(currentUserId).update({
        'likespost': FieldValue.arrayRemove([categoryId])
      }).whenComplete(() => firebase.collection('post').doc(categoryId).update({
            'like': FieldValue.arrayRemove([currentUserId])
          }));
    } catch (e) {
      //  print(e);
    }
  }
}
