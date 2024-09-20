import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
class LoadPage extends StatefulWidget {
  final String pdfPath;

  const LoadPage({super.key, required this.pdfPath});

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  late Completer<PDFViewController> _controller = Completer<PDFViewController>();
  int? pages = 0;
  bool isReady = false;
  int? currentPage = 0;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Titulo"),
      ),
      body: Stack(
        children: [
          PDFView(
            filePath: 'lib/assets/documents/document.pdf',
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: false,
            pageSnap: true,
            onPageChanged: (page, total) {
              print('page change: $page/$total');
            },
            onRender: (_pages) {
              setState(() {
                pages = _pages!;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              print('testetetetetete');
              print(page);
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');

            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
          ),
          errorMessage.isEmpty
              ? !isReady
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Container()
              : Center(
            child: Text(errorMessage),
          )
        ]
      ),
    );
  }
}
