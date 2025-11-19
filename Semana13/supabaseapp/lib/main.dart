import 'package:flutter/material.dart';
import 'package:supabaseapp/note_page.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase APP',
      theme: ThemeData.dark(),
      home: NotePage()
    );
  }
}