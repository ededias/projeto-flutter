import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curso_adm/login/login.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  _checkBoardOpened(context) {
    return  MediaQuery.of(context).viewInsets.bottom > 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Visibility(
                visible: _checkBoardOpened(context),
                child: SizedBox(
                  child: Image.asset('lib/assets/images/logo_gr.png'),
                ),
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
