import 'package:authapp/auth/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ryvmgqllqokywethiqew.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5dm1ncWxscW9reXdldGhpcWV3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM3MTczNDgsImV4cCI6MjA3OTI5MzM0OH0.cgaSWofV3rk92EV1l9UWOX-disyrj_b9GtIG7U-j1P4',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4A154B)),
        useMaterial3: true,
        fontFamily:
            'Roboto', // Default to Roboto, can be changed if user wants specific font
      ),
      home: const AuthGate(),
    );
  }
}
