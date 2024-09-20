import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curso_adm/authentication/authentication.dart';

class ConstructPage extends StatelessWidget {
  const ConstructPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ConstructPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Construção'),
        backgroundColor: Colors.black,

      ),
      backgroundColor: const Color(0xFFFCF3F3),
      body: const Align(
        child: Text('Em construção', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600
        )),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Logout'),
      onPressed: () {
        context.read<AuthenticationBloc>().add(AuthenticationLogoutPressed());
      },
    );
  }
}

class _UserId extends StatelessWidget {
  const _UserId();

  @override
  Widget build(BuildContext context) {
    final userId = context.select(
      (AuthenticationBloc bloc) => bloc.state.user.id,
    );

    return Text('UserID: $userId');
  }
}
