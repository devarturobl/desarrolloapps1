import 'package:flutter/material.dart';

class Longitud extends StatefulWidget {
  const Longitud({super.key});

  @override
  State<Longitud> createState() => _LongitudState();
}

class _LongitudState extends State<Longitud> {
  //pARA USAR UN TEXTFIELD DEBEMOS CREAR UN CONTROLADOR
  TextEditingController distanciaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(5, 5), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: distanciaController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Distancia',
                  ),
                ),
                Text(
                  "INPUT",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Text("dasda")],
                ),
              ],
            ),
          ),
          Text('Area 2'),
          Text('Area 3'),
        ],
      ),
    );
  }
}
