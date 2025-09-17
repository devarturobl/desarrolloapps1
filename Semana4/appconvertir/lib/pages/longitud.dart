import 'package:flutter/material.dart';

class Longitud extends StatefulWidget {
  const Longitud({super.key});

  @override
  State<Longitud> createState() => _LongitudState();
}

class _LongitudState extends State<Longitud> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.amber, child: Text('Contenido de Longitud'));
  }
}
