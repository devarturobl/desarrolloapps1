import 'package:flutter/material.dart';
import 'package:flutter_application_2/clongitud.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Conversor de Unidades',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: const Color(0xFF4B74FF),
            centerTitle: true,
            elevation: 0, // Blues
            bottom: const TabBar(
              indicatorColor: Colors.amber,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.white,
              labelColor: Colors.amber,
              tabs: [
                Tab(text: 'Longitud', icon: Icon(Icons.straighten)),
                Tab(text: 'Peso', icon: Icon(Icons.scale)),
                Tab(text: 'Temperatura', icon: Icon(Icons.thermostat)),
              ],
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF4B74FF), // Blues
                  Color.fromARGB(255, 75, 33, 182), // Green
                ],
              ),
            ),
            child: TabBarView(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Conversor de Longitud',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Expanded(child: Clongitud()),
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    'Conversor de Peso',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Center(
                  child: Text(
                    'Conversor de Temperatura',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
