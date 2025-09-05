//Importante definir la librería de diseño puede ser material o cupertino
import 'package:flutter/material.dart';

//Función principal que ejecuta la aplicación
void main() {
  runApp(MyAppBar());
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("App Bar Demo", style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              onPressed: () {
                 ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
              },
              icon: Icon(Icons.add_alert, color: Colors.white),
            ),
          ],
          backgroundColor: Colors.purple,
        ),
        body: Text("Empezando con Flutter"),
      ),
    );
  }
}

class ImRich extends StatelessWidget {
  const ImRich({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "I´m Rich",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "I´m Rich",
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
              Image.network(
                'https://play-lh.googleusercontent.com/i1-feoAKuLOC19HxRaTmGBwC6WzUl6ResQt8amVnjZbC7ZRV-pIJzpIWopaGup3fCA',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
