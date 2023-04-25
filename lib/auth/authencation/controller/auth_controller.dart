import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth_model.dart';
import '../repository/auth_repositorty.dart';

final authStateControllerProvider = StreamProvider<User?>((ref) {
  return ref.read(authenticationProvider).authStateChange;
});
final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication(ref);
});
final userCredentialIdProvider = StateProvider<String>((ref) => "");
final checkAuthController = StateProvider((ref) => true);
String userUid = '';

///
///
final authLoginCheckerController =
    StateNotifierProvider<AuthCheckerController, AsyncValue<AuthModel>>(
        ((ref) => AuthCheckerController(ref)..checkLogin()));

class AuthCheckerController extends StateNotifier<AsyncValue<AuthModel>> {
  Ref reader;
  AuthCheckerController(this.reader) : super(const AsyncValue.loading());

  checkLogin() async {
    state = const AsyncLoading();

    try {
      var getUser = reader.watch(authStateControllerProvider);
      if (mounted) {
        state = getUser.value == null
            ? AsyncValue.data(AuthModel(id: '', isLogin: false))
            : AsyncValue.data(AuthModel(id: getUser.value!.uid, isLogin: true));
      }
    } catch (e) {
      print(e);
    }
  }

  refresh() async {
    try {
      state = const AsyncLoading();
      final getUser = reader.watch(authStateControllerProvider);
      if (mounted) {
        // upcomming(getEvent);
        // ongoing(getEvent);
        // outgoing(getEvent);
        state = getUser.value == null
            ? AsyncValue.data(AuthModel(id: '', isLogin: false))
            : AsyncValue.data(AuthModel(id: getUser.value!.uid, isLogin: true));
      }
    } catch (e) {
      print(e);
    }
  }
}

final authLoginController =
    StateNotifierProvider<UserLoginController, AuthModel>((ref) {
  return UserLoginController();
});

class UserLoginController extends StateNotifier<AuthModel> {
  UserLoginController()
      : super(
          AuthModel(id: '', isLogin: false),
        );
  check() {}
  bool set() {
    if (state.id.isEmpty) {
      return false;
    }

    state = AuthModel(id: '', isLogin: false);
    return true;
  }

  reset() {
    state = AuthModel(id: '', isLogin: false);
  }
}
