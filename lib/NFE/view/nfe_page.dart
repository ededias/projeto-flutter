import 'package:curso_adm/home/home.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';


class NFEPage extends StatefulWidget {
  NFEPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => NFEPage());
  }

  @override
  State<NFEPage> createState() => _NFEPageState();
}

class _NFEPageState extends State<NFEPage> {

  String pathPDF = "";
  String page = "";
  final pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openAsset('lib/assets/documents/document.pdf'),
  );
  final pdfController = PdfController(
    document: PdfDocument.openAsset('lib/assets/documents/document.pdf'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        fixedColor: const Color(0xFFF8F8A7),
        unselectedItemColor: const Color(0xFFF8F8A7),
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(HomePage.route(), (route) => false);
                },
                child: const Icon(Icons.home, color: Color(0xFFF8F8A7),),
              ),
              label: 'Início'
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.menu_book_outlined, color: Color(0xFFF8F8A7),), label: 'Instruções',)
        ],
      ),

      appBar: AppBar(
        title: const Text('Instruções'),
        backgroundColor: Colors.black,
      ),
      body: PdfViewPinch(
            controller: pdfPinchController,
          ),


    );
  }
}
