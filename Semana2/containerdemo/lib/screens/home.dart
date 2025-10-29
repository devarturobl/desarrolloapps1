import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Imagen
              Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRP112dUMujtBWkaiOFf5VdACygCybjq0PvJA&s",
                ),
              ),
              //Texto1
              Padding(
                padding: const EdgeInsets.only(left: 44.0),
                child: Text(
                  "MAN'S SHOES",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  //Texto2
                  Column(
                    children: [
                      Text(
                        "NIKE AIR",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "MAX 270",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  //Texto3
                  Column(
                    children: [
                      Text(
                        "\$2,500.00",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        "\$2,000.00",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
