import 'package:flutter/material.dart';
import 'package:notes/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://vpsfndnjxuccxmisoiyl.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZwc2ZuZG5qeHVjY3htaXNvaXlsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTg3MjM5NTMsImV4cCI6MjA3NDI5OTk1M30.MfRJfbezZfAzFaQ5aVpXE-tmkhSlLdtm2KWdnYKJ6yM',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthGate());
  }
}

