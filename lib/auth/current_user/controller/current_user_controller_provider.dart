import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../authencation/controller/auth_controller.dart';
import '../../user_model.dart';
import '../repository/current_user_repository.dart';

final currentUserControllerProvider =
    StateNotifierProvider<CurrentUserController, AsyncValue<UserModel>>((ref) {
  return CurrentUserController(ref)..getUser();
});

class CurrentUserController extends StateNotifier<AsyncValue<UserModel>> {
  final Ref _read;

  CurrentUserController(this._read) : super(const AsyncValue.loading());

  getUser({String uid = ''}) async {
    print(uid);
    String userId = await _read.watch(authStateControllerProvider).value!.uid;
    state = const AsyncLoading();
    try {
      final getUser = await _read.watch(currentUserRepositoryProvider).getUser(
          userId.isNotEmpty
              ? userId
              : _read.watch(userCredentialIdProvider.state).state);

      if (mounted) {
        state = AsyncValue.data(getUser!);
      }
    } catch (e) {
      print(e);
    }
  }

  refresh() async {
    String userId = _read.watch(authStateControllerProvider).value!.uid;
    // String userId = _read(authStateControllerProvider).value!.uid;
    // state = const AsyncLoading();
    try {
      //state = const AsyncValue.loading();
      final getUser =
          await _read.watch(currentUserRepositoryProvider).getUser(userId);

      if (mounted) {
        state = AsyncValue.data(getUser!);
      }
    } catch (e) {
      print(e);
    }
  }

  // createEvent(String eventId) {
  //   _read.watch(currentUserRepositoryProvider).createEvent(eventId);
  //   if (mounted) {
  //     state.value!.createEvent.add(eventId);

  //     state = AsyncValue.data(state.value!);
  //   }
  // }

  logout() {
    _read.read(currentUserRepositoryProvider).logout();
  }

  eiditProfile(UserModel userModel) async {
    _read.read(currentUserRepositoryProvider).editProfile(userModel);
    if (mounted) {
      UserModel? crUser = userModel;
      // state.value!.copyWith(name: name, phno: phoneNo, address: address);
      state = AsyncValue.data(crUser);
    }
  }

  likepost(String postId) async {
    try {
      await _read
          .read(currentUserRepositoryProvider)
          .likePost(_read.read(authStateControllerProvider).value!.uid, postId);
      if (mounted) {
        UserModel user = state.value!.copyWith(
            // likespost: state.value!.likespost..add(postId),
            );
        state = AsyncValue.data(user);
        // _read(specificCategoryControllerProvider.notifier)
        //     .getCategory(postId, isRefresh: true);
      }
    } catch (e) {
      // print(e);
    }
  }

  disklikepost(String postId) async {
    try {
      // final getUser = await _read(currentUserRepositoryProvider)
      //     .diskLikepost(
      //         _read(authStateControllerProvider).value!.uid, postId);
      if (mounted) {
        UserModel user = state.value!.copyWith(
            // likespost: state.value!.likespost..remove(postId),
            );
        state = AsyncValue.data(user);
      }
    } catch (e) {
      //print(e);
    }
  }
}
