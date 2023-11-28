import 'package:auth/features/sign_in/app/src/domain/repository/sign_in_repository.dart';
import 'package:auth/features/sign_in/app/src/domain/use_cases/sign_in_usecase.dart';
import 'package:auth/features/sign_in/app/src/infra/datasources/sign_in_datasource.dart';
import 'package:auth/features/sign_in/app/src/infra/repository/sign_in_repository_impl.dart';
import 'package:auth/features/sign_in/app/src/presenter/sign_in_controller.dart';
import 'package:auth/features/sign_in/app/src/presenter/sign_in_page.dart';
import 'package:auth/features/sign_in/app/src/presenter/sign_in_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SignInModule extends Module {
  void binds(i) {
    i.addSingleton<SignInDataSource>(SignInRepositoryImpl.new);
    i.addSingleton<SignInRepository>(SignInRepositoryImpl.new);
    i.addSingleton(SignInUseCase.new);
    i.addSingleton(SignInStore.new);
    i.addSingleton(SignInController.new);
  }

  void routes(r) {
    r.child('/', child: (context) => SignInPage());
  }
}
