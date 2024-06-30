import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/features/repos/authentication_repo.dart';

class SignupViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _authRepo;
  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp() async {
    state = AsyncValue.loading();
    final form = ref.read(signUpForm);
    await _authRepo.signUp(form["email"], form["password"]);
    state = AsyncValue.data(null);
  }
}

final signUpForm = StateProvider((ref) => {});

final signUpProvider =
    AsyncNotifierProvider<SignupViewModel, void>(() => SignupViewModel());
