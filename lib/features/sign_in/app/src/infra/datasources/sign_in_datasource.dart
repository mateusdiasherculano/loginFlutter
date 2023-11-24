import '../../domain/entity/user_response.dart';

abstract class SignInDataSource {
  Future<UserResponse> SignIn(String? email, String? password);
}
