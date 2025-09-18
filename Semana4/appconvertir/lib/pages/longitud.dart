import 'package:flutter/material.dart';

// --- Colores y Estilos ---
final Color miColorPrincipal = Color.fromARGB(
  255,
  0,
  0,
  0,
); // Verde azulado oscuro para AppBar
final Color miColorAcento = Color.fromARGB(
  255,
  25,
  243,
  18,
); // Naranja suave para la pestaña activa y botón de intercambio
final Color miColorTextoInactivo = Color(
  0xFF616161,
); // Gris oscuro para íconos/texto inactivos
final Color miColorFondoTabBar = Color(
  0xFFFFFFFF,
); // Blanco puro para el fondo del TabBar
final Color miColorFondoCards = Color(
  0xFFFFFFFF,
); // Blanco puro para el fondo de las tarjetas
final Color miColorFondoApp = Color(
  0xFFECF0F1,
); // Gris muy claro para el fondo general del Scaffold

final TextStyle estiloTituloAppBar = TextStyle(
  color: const Color.fromARGB(255, 77, 223, 40),
  fontWeight: FontWeight.bold,
  fontSize: 24,
);

final TextStyle estiloEtiquetaInputOutput = TextStyle(
  color: Colors.grey[600],
  fontSize: 12,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.8,
);

final TextStyle estiloNumeroGrande = TextStyle(
  color: Colors.grey[800],
  fontSize: 32,
  fontWeight: FontWeight.bold,
);

final TextStyle estiloTextoDropdown = TextStyle(
  color: Colors.grey[800],
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class Longitud extends StatefulWidget {
  const Longitud({super.key});

  @override
  State<Longitud> createState() => _LongitudState();
}

class _LongitudState extends State<Longitud> {
  // Variables de estado para los valores de entrada y salida, y unidades seleccionadas
  String _inputValue = '100';
  String _outputValue = '328.08';
  String _inputUnit = 'Metros';
  String _outputUnit = 'Pies';

  final List<String> _lengthUnits = [
    'Metros',
    'Pies',
    'Kilómetros',
    'Millas',
    'Pulgadas',
    'Milimetros',
    'Centimetros',
  ];

  //pARA USAR UN TEXTFIELD DEBEMOS CREAR UN CONTROLADOR
  TextEditingController distanciaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        top: 150.0,
        bottom: 16.0,
      ),
      child: Column(
        children: [
          // Tarjeta de INPUT
          _buildConversionCard(
            label: 'Unidad de entrada',
            value: _inputValue,
            unit: _inputUnit,
            units: _lengthUnits,
            isInput: true,
            onValueChanged: (newValue) {
              setState(() {
                _inputValue = newValue;
                // Aquí iría la lógica de conversión
              });
            },
            onUnitChanged: (newUnit) {
              setState(() {
                _inputUnit = newUnit!;
                // Aquí iría la lógica de conversión
              });
            },
          ),
          const SizedBox(height: 16),
          // Botón de Intercambio
          FloatingActionButton(
            onPressed: () {
              setState(() {
                // Lógica para intercambiar unidades y valores
                String tempValue = _inputValue;
                String tempUnit = _inputUnit;
                _inputValue = _outputValue;
                _inputUnit = _outputUnit;
                _outputValue = tempValue;
                _outputUnit = tempUnit;
              });
            },
            backgroundColor: miColorAcento,
            mini: true, // Para un tamaño más pequeño
            elevation: 4,
            child: const Icon(Icons.swap_vert, color: Colors.white),
          ),
          const SizedBox(height: 16),
          // Tarjeta de OUTPUT
          _buildConversionCard(
            label: 'OUTPUT',
            value: _outputValue,
            unit: _outputUnit,
            units: _lengthUnits,
            isInput: false, // No es un campo de entrada editable
            onValueChanged: (newValue) {}, // No hace nada si no es input
            onUnitChanged: (newUnit) {
              setState(() {
                _outputUnit = newUnit!;
                // Aquí iría la lógica de conversión
              });
            },
          ),
          const Spacer(), // Empuja el botón "Limpiar" hacia abajo
          // Botón "Limpiar"
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                setState(() {
                  _inputValue = '0';
                  _outputValue = '0';
                  _inputUnit = _lengthUnits.first;
                  _outputUnit =
                      _lengthUnits[1]; // O la segunda unidad por defecto
                });
              },
              child: Text(
                'Limpiar',
                style: TextStyle(color: miColorTextoInactivo, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- Widget para las Tarjetas de Conversión (INPUT/OUTPUT) ---
Widget _buildConversionCard({
  required String label,
  required String value,
  required String unit,
  required List<String> units,
  required bool isInput,
  required ValueChanged<String> onValueChanged,
  required ValueChanged<String?> onUnitChanged,
}) {
  return Card(
    margin: EdgeInsets.zero, // Eliminar margen por defecto de Card
    color: miColorFondoCards, // Fondo blanco para las tarjetas
    elevation: 2, // Sombra sutil
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Esquinas redondeadas
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: estiloEtiquetaInputOutput),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: isInput
                    ? TextField(
                        controller: TextEditingController(text: value),
                        onChanged: onValueChanged,
                        keyboardType: TextInputType.number,
                        style: estiloNumeroGrande,
                        decoration: InputDecoration(
                          border: InputBorder.none, // Sin borde por defecto
                          hintText: '0',
                          hintStyle: estiloNumeroGrande.copyWith(
                            color: Colors.grey[400],
                          ),
                          isDense: true, // Reducir el espacio vertical
                          contentPadding:
                              EdgeInsets.zero, // Eliminar padding interno
                        ),
                        textAlign:
                            TextAlign.start, // Alinear texto a la izquierda
                      )
                    : Text(value, style: estiloNumeroGrande),
              ),
              const SizedBox(width: 10),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: unit,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                  ),
                  style: estiloTextoDropdown,
                  onChanged: onUnitChanged,
                  items: units.map<DropdownMenuItem<String>>((
                    String unitValue,
                  ) {
                    return DropdownMenuItem<String>(
                      value: unitValue,
                      child: Text(unitValue),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
