import 'package:curso_adm/NFE/view/nfe_page.dart';
import 'package:curso_adm/construct/view/construct_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curso_adm/authentication/authentication.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const InstructionPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual'),
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar:  BottomNavigationBar(
        fixedColor: const Color(0xFFF8F8A7),
        unselectedItemColor: const Color(0xFFF8F8A7),
        backgroundColor: Colors.black,
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFF8F8A7),),
            label: 'Início'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined, color: Color(0xFFF8F8A7),), label: 'Instruções',)
        ],
      ),
      backgroundColor: const Color(0xFFFCF3F3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          child: GridView(
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.0,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 10,
              mainAxisExtent: 100,
            ),
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(NFEPage.route());
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFFF8F8A7),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.folder_copy, color: Colors.black),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Emissão nota fiscal",
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            )    
                          ],
                        ),

                      ],
                    )),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(ConstructPage.route());
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFFF8F8A7),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.folder_copy, color: Colors.black),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Cancelamento nota fiscal",
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            )
                          ],
                        ),

                      ],
                    )),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(ConstructPage.route());
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateColor.resolveWith(
                            (states) => const Color(0xFFF8F8A7),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
                      side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(color: Colors.transparent),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.folder_copy, color: Colors.black),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Carta de correção nota fiscal",
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            )
                          ],
                        ),

                      ],
                    )),
              ),
            ],
          ),
        ),
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
