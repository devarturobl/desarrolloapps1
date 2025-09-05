import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //Estructura de la pantalla
            //imagen local
            Image.asset('assets/fondo.jpg'),
            SizedBox(height: 40),
            //Fila1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //Columna con textos
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Oeschinen Lake Campground',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Kandersteg, Switzerland'),
                  ],
                ),
                //Fila con un icono y un texto
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Icon(Icons.star, color: Colors.red),
                    Text('41'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            //Fila2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 20),
                Column(
                  children: [
                    Icon(
                      Icons.call,
                      color: const Color.fromARGB(255, 118, 2, 138),
                    ),
                    Text(
                      'CALL',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 118, 2, 138),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.route,
                      color: const Color.fromARGB(255, 118, 2, 138),
                    ),
                    Text(
                      'ROUTE',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 118, 2, 138),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.share,
                      color: const Color.fromARGB(255, 118, 2, 138),
                    ),
                    Text(
                      'SHARE',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 118, 2, 138),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
              ],
            ),
            //Texto
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Text(
                "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
