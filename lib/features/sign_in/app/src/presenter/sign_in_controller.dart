import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sign_in_store.dart';

class SignInController extends Disposable {
  final SignInStore store;

  SignInController(this.store);

  ValueNotifier<String?> emailError = ValueNotifier(null);
  ValueNotifier<String?> passwordError = ValueNotifier(null);

  Future<void> sign(String email, String password) async {
    if (email.isEmpty) {
      emailError.value = 'Can not be empty';
      return;
    }
    if (password.isEmpty) {
      passwordError.value = 'Can not be empty';
      return;
    }

    store.signIn(email, password);
  }

  @override
  void dispose() {
    emailError.dispose();
    passwordError.dispose();
  }
}
