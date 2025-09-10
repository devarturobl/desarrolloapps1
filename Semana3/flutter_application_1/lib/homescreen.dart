import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ...List.generate(
              100,
              (i) => Container(
                color: i % 2 == 0 ? Colors.amber : Colors.cyan,
                child: Text("Hola $i", style: TextStyle(fontSize: 30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
