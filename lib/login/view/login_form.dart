import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curso_adm/login/login.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.username.displayError,
    );

    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      onChanged: (username) {
        context.read<LoginBloc>().add(LoginUsernameChanged(username));
      },
      decoration: InputDecoration(
        labelStyle: const TextStyle(
            color: Colors.black
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        labelText: 'E-mail',
        errorText: displayError != null ? 'E-mail invalido' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.password.displayError,
    );

    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.black
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        labelText: 'Senha',
        errorText: displayError != null ? 'Senha invalida' : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) return const CircularProgressIndicator();

    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          key: const Key('loginForm_continue_raisedButton'),
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFF8F8A7),
            ),
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.black),
            side: MaterialStateBorderSide.resolveWith(
              (states) => const BorderSide(color: Colors.transparent),
            ),
          ),
          onPressed: isValid
              ? () => context.read<LoginBloc>().add(const LoginSubmitted())
              : null,
          child: const Text('Entrar', style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
