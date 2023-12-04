import 'package:auth/features/sign_in/app/src/domain/repository/sign_in_repository.dart';
import 'package:auth/features/sign_in/app/src/domain/use_cases/sign_in_usecase.dart';
import 'package:auth/features/sign_in/app/src/external/datasources/sign_in_datasource_impl.dart';
import 'package:auth/features/sign_in/app/src/infra/datasources/sign_in_datasource.dart';
import 'package:auth/features/sign_in/app/src/infra/repository/sign_in_repository_impl.dart';
import 'package:auth/features/sign_in/app/src/presenter/sign_in_controller.dart';
import 'package:auth/features/sign_in/app/src/presenter/sign_in_page.dart';
import 'package:auth/features/sign_in/app/src/presenter/sign_in_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../src/network/api/dio_client.dart';
import '../../src/network/api/dio_client_interface.dart';

class SignInModule extends Module {
  void binds(i) {
    i.addSingleton<IDioClient>(DioClient.new);
    i.addSingleton<SignInDataSource>(SignInDatasourceImpl.new);
    i.addSingleton<SignInRepository>(SignInRepositoryImpl.new);
    i.addSingleton(SignInUseCase.new);
    i.addSingleton(SignInStore.new);
    i.addSingleton(SignInController.new);
  }

  void routes(r) {
    r.child('/', child: (context) => SignInPage());
  }
}
