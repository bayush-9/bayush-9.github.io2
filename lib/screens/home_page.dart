import 'package:flutter/material.dart';
import 'package:prototype_integration_doc_generator/screens/upload_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.darken),
            fit: BoxFit.fill,
            image: const AssetImage('assets/home_screen.jpg'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Integration Architecture",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontFamily: 'Alice',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Document Generator",
                style: TextStyle(
                    color: Colors.white, fontSize: 46, fontFamily: 'Alice'),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Get to know everything about Integration",
                style: TextStyle(
                    color: Colors.white60, fontSize: 23, fontFamily: 'Inter'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "architecture of your system.",
                style: TextStyle(
                    color: Colors.white60, fontSize: 23, fontFamily: 'Inter'),
              ),
              const SizedBox(
                height: 80,
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const UploadScreen()),
                  ),
                ),
                child: Container(
                    width: 250,
                    height: 60,
                    child: Center(
                      child: Text(
                        "GET STARTED",
                        style: TextStyle(color: Colors.blue[900]),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
