import '../entity/user_response.dart';

abstract class SignInRepository {
  Future<UserResponse> signIn(String? email, String? password);
}
