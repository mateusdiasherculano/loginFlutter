import 'package:auth/features/sign_in/app/src/domain/entity/user_response.dart';
import 'package:auth/features/sign_in/app/src/domain/repository/sign_in_repository.dart';

import '../datasources/sign_in_datasource.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSource _datasource;

  SignInRepositoryImpl(this._datasource);

  @override
  Future<UserResponse> signIn(String? email, String? password) async {
    return await _datasource.SignIn(email, password);
  }
}
