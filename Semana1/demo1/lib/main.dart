import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to Flutter!'),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.phone, color: Colors.blue),
                      const Text("CALL"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.route, color: Colors.blue),
                      const Text("ROUTE"),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.share, color: Colors.blue),
                      const Text("SHARE"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
