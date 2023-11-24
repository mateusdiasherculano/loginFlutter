import 'package:auth/features/sign_in/app/src/domain/entity/user_response.dart';
import 'package:auth/src/network/api/dio_client_interface.dart';

import '../../infra/datasources/sign_in_datasource.dart';

class SignInDatasourceImpl implements SignInDataSource {
  final IDioClient _client;

  SignInDatasourceImpl(this._client);

  @override
  Future<UserResponse> SignIn(String? email, String? password) async {
    final response =
        await _client.get('http://51.15.250.187:8006/api/method/login');

    UserResponse model = UserResponse.fromJson(response);
    return model;
  }
}
