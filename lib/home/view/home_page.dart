import 'package:curso_adm/construct/view/construct_page.dart';
import 'package:curso_adm/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:curso_adm/authentication/authentication.dart';

import '../../instruction_manual/view/instruction_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio'),
          backgroundColor: Colors.black,
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: const Color(0xFFF8F8A7),
          unselectedItemColor: const Color(0xFFF8F8A7),
          backgroundColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      HomePage.route(),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Color(0xFFF8F8A7),
                  ),
                ),
                label: 'Início'),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      HomePage.route(),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.menu_book_outlined,
                    color: Color(0xFFF8F8A7),
                  )),
              label: 'Instruções',
            )
          ],
        ),
        backgroundColor: const Color(0xFFFCF3F3),
        body: BlocProvider(
          lazy: false,
          create: (_) => HomeBloc(),
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {},
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            label: Icon(Icons.search),

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black
                              )
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    GridView(
                      shrinkWrap: true,
                      primary: false,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        crossAxisSpacing: 0.0,
                        mainAxisSpacing: 0.0,
                        mainAxisExtent: 170,
                      ),
                      children: [
                        SizedBox(
                          width: 100,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(InstructionPage.route());
                              },
                              style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => const Color(0xFFF8F8A7)),
                                  side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          color: Colors.transparent))),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    color: Colors.black,
                                    size: 70,
                                    Icons.note_add,
                                  ),
                                  Text(
                                    "NFe",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(ConstructPage.route());
                              },
                              style: ButtonStyle(
                                  overlayColor: MaterialStateColor.resolveWith(
                                      (states) => const Color(0xFFF8F8A7)),
                                  side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          color: Colors.transparent))),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    color: Colors.black,
                                    size: 70,
                                    Icons.calculate,
                                  ),
                                  Text(
                                    "Boletos",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(ConstructPage.route());
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFFF8F8A7),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    color: Colors.black,
                                    size: 70,
                                    Icons.payments,
                                  ),
                                  Text(
                                    "Contas a receber",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(ConstructPage.route());
                              },
                              style: ButtonStyle(
                                overlayColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFFF8F8A7),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                      color: Colors.transparent),
                                ),
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    color: Colors.black,
                                    size: 70,
                                    Icons.receipt_long,
                                  ),
                                  Text(
                                    "Contas a pagar",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
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
