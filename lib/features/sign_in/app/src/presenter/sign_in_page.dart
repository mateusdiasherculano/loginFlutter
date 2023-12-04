import 'package:auth/features/sign_in/app/src/presenter/sign_in_controller.dart';
import 'package:auth/features/sign_in/app/src/presenter/sign_in_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../domain/entity/user_response.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final SignInController controller = Modular.get<SignInController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    controller.store.observer(onState: (state) {
      Modular.to.navigate('/');
    }, onError: (error) {
      const Center(child: Text('error'));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: ScopedBuilder<SignInStore, UserResponse>(
              store: controller.store,
              onLoading: (_) => SizedBox(
                    height: height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              onError: (_, error) => SizedBox(
                    height: height,
                    child: const Center(
                      child: Text('erro'),
                    ),
                  ),
              onState: (_, state) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () {
                          controller.sign(
                              emailController.text, passwordController.text);
                        },
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
