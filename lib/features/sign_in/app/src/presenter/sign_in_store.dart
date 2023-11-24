import 'package:auth/features/sign_in/app/src/domain/entity/user_response.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/use_cases/sign_in_usecase.dart';

class SignInStore extends Store<UserResponse> {
  final SignInUseCase _execute;
  SignInStore(this._execute) : super(UserResponse());

  Future<void> signIn(String? email, String? password) async {
    return execute(() => _execute(email, password));
  }
}
