import '../entity/user_response.dart';
import '../repository/sign_in_repository.dart';

abstract class IExecute {
  Future<UserResponse> call(String? email, String? password);
}

class SignInUseCase extends IExecute {
  final SignInRepository _repository;

  SignInUseCase(this._repository);
  @override
  Future<UserResponse> call(String? email, String? password) async {
    return await _repository.signIn(email, password);
  }
}
