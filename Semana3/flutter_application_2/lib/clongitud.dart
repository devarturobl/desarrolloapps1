import 'package:flutter/material.dart';

class Clongitud extends StatefulWidget {
  const Clongitud({super.key});

  @override
  State<Clongitud> createState() => _ClongitudState();
}

class _ClongitudState extends State<Clongitud> {
  //esto es para asignar el valor que el usuario ingresa en una caja de texto
  final TextEditingController _userInput = TextEditingController();
  //lista de unidades de longitud disponibles
  final List<String> unidades = [
    'Metros',
    'Kilómetros',
    'Centímetros',
    'Milímetros',
    'Pulgadas',
    'Pies',
    'Yardas',
    'Millas',
  ];

  //Es valor que ingresa el usuario le damos un valor por defecto
  String unidadOrigen = 'Metros';
  //El valor al que se va a convertir le damos un valor por defecto
  String unidadDestino = 'Centímetros';
  String resultado = '';

  //factores de conversión relativos a metros estructura de datos tipo mapa
  final Map<String, double> factores = {
    'Metros': 1.0,
    'Kilómetros': 1000.0,
    'Centímetros': 0.01,
    'Milímetros': 0.001,
    'Pulgadas': 0.0254,
    'Pies': 0.3048,
    'Yardas': 0.9144,
    'Millas': 1609.34,
  };

  //Funcion para realizar la conversión formula resultado = (cantidad * factorOrigen) / factorDestino
  void convertir() {
    //Intentamos convertir el valor ingresado a un número de tipo double
    final double? valor = double.tryParse(_userInput.text);
    //Validamos si el valor es nulo (no es un número válido)
    if (valor == null) {
      setState(() {
        resultado = 'Por favor ingrese un número válido.';
      });
      return;
    }

    //declaramos las variables para hacer la conversión primero el valor
    double valorEnFactor = valor * factores[unidadOrigen]!;
    //Realizamos la conversión
    double valorConvertido = valorEnFactor / factores[unidadDestino]!;

    setState(() {
      //concatenamos la salida en un texto con el valor, unidad de origen, valor convertido y unidad destino
      resultado =
          '$valor $unidadOrigen = ${valorConvertido.toStringAsFixed(4)} $unidadDestino';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Cantidad a convertir:",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          //Widget para caja de texto se necesita de un controlador TextEditingController esta declarado arriba
          TextField(
            controller: _userInput,
            //grantiza que el teclado que aparezca sea numérico
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white10,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: 'Ingrese la cantidad',
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
          SizedBox(height: 20),
          //Fila para los dos menús desplegables
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unidad origen:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    //Menú desplegable para seleccionar la unidad de origen
                    DropdownButton<String>(
                      value: unidadOrigen,
                      borderRadius: BorderRadius.circular(20),
                      dropdownColor: const Color.fromARGB(255, 2, 17, 34),
                      //Evita que ambas unidades sean iguales
                      onChanged: (value) {
                        setState(() {
                          unidadOrigen = value!;
                          if (unidadDestino == unidadOrigen) {
                            unidadDestino = unidades.firstWhere(
                              (u) => u != unidadOrigen,
                            );
                          }
                        });
                      },
                      items: unidades.map<DropdownMenuItem<String>>((
                        String value,
                      ) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Unidad destino:",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    //Menú desplegable para seleccionar la unidad de origen
                    DropdownButton<String>(
                      value: unidadDestino,
                      borderRadius: BorderRadius.circular(20),
                      dropdownColor: const Color.fromARGB(255, 2, 17, 34),
                      onChanged: (value) {
                        setState(() {
                          unidadDestino = value!;
                        });
                      },
                      items: unidades
                          .where((unidad) => unidades != unidadOrigen)
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            );
                          })
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
