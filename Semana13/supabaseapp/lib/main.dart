import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabaseapp/note_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://ddcjhhdntfdjnpbfcjrw.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRkY2poaGRudGZkam5wYmZjanJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM1NjEyOTUsImV4cCI6MjA3OTEzNzI5NX0.Ld0rwYhb0t7XLuGqiDbL2FScBcWb4swNq5MTO1ESTVs',
  );
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase APP',
      theme: ThemeData.dark(),
      home: NotePage(),
    );
  }
}
