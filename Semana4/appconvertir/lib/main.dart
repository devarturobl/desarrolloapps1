import 'package:appconvertir/pages/longitud.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConvertiProApp());
}

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

class ConvertiProApp extends StatelessWidget {
  const ConvertiProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ConvertiPro',
      theme: ThemeData(
        primaryColor: miColorPrincipal,
        hintColor: miColorAcento,
        scaffoldBackgroundColor: miColorFondoApp, // Fondo general de la app
        // Ajuste para el splash factory si no quieres el efecto de tinta por defecto
        splashFactory: InkRipple.splashFactory,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variables de estado para los valores de entrada y salida, y unidades seleccionadas

  // Opciones de unidades para fines de demostración
 

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ConvertiPro', style: estiloTituloAppBar),
          centerTitle: true,
          backgroundColor: miColorPrincipal,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              color: miColorFondoTabBar, // Fondo BLANCO para la zona del TabBar
              child: TabBar(
                indicator: BoxDecoration(
                  color: miColorAcento, // Naranja para la pestaña seleccionada
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: EdgeInsets.zero,
                labelColor:
                    Colors.white, // Texto de la pestaña seleccionada en BLANCO
                unselectedLabelColor:
                    miColorTextoInactivo, // Texto de las inactivas en GRIS OSCURO
                tabs: const [
                  Tab(text: 'Longitud', icon: Icon(Icons.straighten)),
                  Tab(text: 'Peso', icon: Icon(Icons.scale)),
                  Tab(text: 'Moneda', icon: Icon(Icons.currency_exchange)),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // --- Pestaña de Longitud (Implementación de la interfaz de la imagen) ---
            Longitud(),
            // --- Otras Pestañas (Contenido de marcador de posición) ---
            Center(
              child: Text(
                'Contenido de la Pestaña de Peso',
                style: TextStyle(fontSize: 20, color: miColorPrincipal),
              ),
            ),
            Center(
              child: Text(
                'Contenido de la Pestaña de Moneda',
                style: TextStyle(fontSize: 20, color: miColorPrincipal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
