import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import 'package:prototype_integration_doc_generator/screens/home_page.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:html' as html;

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
            fit: BoxFit.fill,
            image: const AssetImage('assets/gears.jpg'),
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 900,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 125, 185, 209),
                    ),
                    height: 60,
                    width: 150,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: Icon(Icons.download),
                            onTap: () => html.window.open(
                                'https://drive.google.com/file/d/1_dNgjAgf6-KGJ7iGzSxfWYp-r6eTC3xJ/view',
                                "_blank"),
                          ),
                          InkWell(
                            child: Icon(Icons.tab_unselected_rounded),
                            onTap: () => html.window.open(
                                'https://drive.google.com/file/d/1_dNgjAgf6-KGJ7iGzSxfWYp-r6eTC3xJ/view',
                                "_blank"),
                          ),
                          InkWell(
                            child: Icon(
                              Icons.print,
                            ),
                            onTap: () async {
                              final pdf = await rootBundle
                                  .load('assets/result_doc.pdf');
                              await Printing.layoutPdf(
                                  onLayout: (_) => pdf.buffer.asUint8List());
                            },
                          ),
                        ]),
                  )
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(255, 125, 185, 209),
              child: SfPdfViewer.asset(
                'assets/result_doc.pdf',
              ),
              height: 400,
              width: 900,
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => HomeScreen()),
                ),
              ),
              child: Container(
                  width: 250,
                  height: 60,
                  child: Center(
                    child: Text(
                      "Generate Another",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
