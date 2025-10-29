import 'package:flutter/material.dart';

class LongitudTab extends StatefulWidget {
  const LongitudTab({super.key});

  @override
  State<LongitudTab> createState() => _LongitudTabState();
}

class _LongitudTabState extends State<LongitudTab> {
  final TextEditingController _userInput = TextEditingController();
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

  String unidadOrigen = 'Metros';
  String unidadDestino = 'Kilómetros';
  String resultado = '';

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

  void convertir() {
    final double? valor = double.tryParse(_userInput.text);
    if (valor == null) {
      setState(() {
        resultado = 'Por favor ingrese un número válido.';
      });
      return;
    }

    double valorEnMetros = valor * factores[unidadOrigen]!;
    double valorConvertido = valorEnMetros / factores[unidadDestino]!;

    setState(() {
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
          const Text(
            'Cantidad:',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _userInput,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white24,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              hintText: 'Ingrese valor',
              hintStyle: const TextStyle(color: Colors.white70),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Unidad origen:', style: TextStyle(color: Colors.white)),
                    DropdownButton<String>(
                      value: unidadOrigen,
                      dropdownColor: Colors.blue[800],
                      onChanged: (value) {
                        setState(() {
                          unidadOrigen = value!;
                          if (unidadDestino == unidadOrigen) {
                            unidadDestino = unidades.firstWhere((u) => u != unidadOrigen);
                          }
                        });
                      },
                      items: unidades.map((unidad) {
                        return DropdownMenuItem(
                          value: unidad,
                          child: Text(unidad, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Unidad destino:', style: TextStyle(color: Colors.white)),
                    DropdownButton<String>(
                      value: unidadDestino,
                      dropdownColor: Colors.blue[800],
                      onChanged: (value) {
                        setState(() {
                          unidadDestino = value!;
                        });
                      },
                      items: unidades
                          .where((unidad) => unidad != unidadOrigen)
                          .map((unidad) {
                        return DropdownMenuItem(
                          value: unidad,
                          child: Text(unidad, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: convertir,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Convertir'),
          ),
          const SizedBox(height: 24),
          Text(
            resultado,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
