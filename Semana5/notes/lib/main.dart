import 'package:flutter/material.dart';
import 'package:notes/note.dart';
import 'package:notes/note_database.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //Consume mi clase donde tengo el CRUD
  final notesDatabase = NoteDatabase();

  //Controlador para el input donde meto texto|
  final noteController = TextEditingController();

  //Funciones que consumiran los metodos CRUD
  void addNewNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Note'),
        content: TextField(controller: noteController),
        actions: [
          TextButton(
            onPressed: () {
              //Declarar el contenido de la nota
              final newNote = Note(content: noteController.text);
              //Ejecutar el metodo create
              notesDatabase.createNote(newNote);
              Navigator.pop(context);
              noteController.clear();
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Supabase Demo Notes'), centerTitle: true),
      body: Center(child: Text('Hello World!')),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewNote,
        child: Icon(Icons.add),
      ),
    );
  }
}
