import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:prototype_integration_doc_generator/screens/result_document.dart';
import 'package:file_picker/file_picker.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  bool loading = false;
  String fileSelected = "Upload file";
  String folderSelected = "Upload file";

  uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        fileSelected = file.name;
      });
    } else {}
  }

  uploadFolder() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        folderSelected = file.name;
      });
    } else {}
  }

  runLoader() {
    if (fileSelected == "Upload file") {
      return;
    }
    setState(() {
      loading = true;
    });
    Timer(
      const Duration(seconds: 3),
      () async {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const DocumentScreen()));
        setState(() {
          loading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 125, 185, 209),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('think_logo.jpg'),
                const Text(
                  "Want to\n understand\n the nature\n of your system?",
                  style: TextStyle(
                    fontSize: 39,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 450,
                  child: DottedLine(
                    dashLength: 8,
                    lineThickness: 3,
                    dashColor: Colors.white,
                    direction: Axis.vertical,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                loading
                    ? const SizedBox(
                        width: 270,
                        height: 60,
                        child: Center(child: CircularProgressIndicator()))
                    : TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.white),
                        ),
                        onPressed: () => runLoader(),
                        child: SizedBox(
                            width: 250,
                            height: 60,
                            child: Center(
                              child: Text(
                                "Generate Document",
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                            )),
                      ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CodeBase",
                  style: TextStyle(color: Colors.blue[900], fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: uploadFile,
                  child: SizedBox(
                      width: 250,
                      height: 60,
                      child: Center(
                        child: Text(
                          fileSelected,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 150,
                ),
                Text(
                  "Configuration",
                  style: TextStyle(color: Colors.blue[900], fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                  onPressed: uploadFolder,
                  child: SizedBox(
                    width: 250,
                    height: 60,
                    child: Center(
                      child: Text(
                        folderSelected,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
