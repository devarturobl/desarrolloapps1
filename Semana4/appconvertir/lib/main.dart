import 'package:appconvertir/pages/longitud.dart';
import 'package:flutter/material.dart';

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
            title: Text(
              'ConvertiPro',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF1ABC9C), // Color principal del AppBar
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                color:
                    Colors.white, // Fondo BLANCO para toda la zona del TabBar
                child: TabBar(
                  // *** ESTE ES EL CAMBIO CLAVE PARA EL FONDO DE LA PESTAÑA SELECCIONADA ***
                  indicator: BoxDecoration(
                    color:
                        Colors.red, // Fondo ROJO para la pestaña seleccionada
                  ),
                  indicatorSize: TabBarIndicatorSize
                      .tab, // Hace que el indicador ocupe todo el espacio de la pestaña
                  //indicatorPadding: EdgeInsets.zero, // Elimina cualquier padding del indicador para que ocupe todo

                  // *** COLORES DE TEXTO/ÍCONOS ***
                  labelColor: Colors
                      .white, // Texto/Ícono de la pestaña seleccionada en BLANCO (sobre fondo rojo)
                  unselectedLabelColor: Colors
                      .red, // Texto/Ícono de las pestañas inactivas en ROJO (sobre fondo blanco)
                  // Estas propiedades ya no son necesarias con el indicador personalizado que rellena la pestaña:
                  // indicatorColor: Colors.white, // Esto es para una línea indicadora, no un fondo
                  // dividerColor: Colors.red, // Esto es para una línea divisoria
                  tabs: [
                    Tab(child: Text('Longitud')),
                    Tab(child: Text('Peso')),
                    Tab(child: Text('Divisa')),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            // Aquí puedes poner el contenido de cada pestaña
            children: [
              Longitud(),
              Center(child: Text('Contenido de Peso')),
              Center(child: Text('Contenido de Divisa')),
            ],
          ),
        ),
      ),
    );
  }
}
