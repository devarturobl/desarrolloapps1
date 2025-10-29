import 'package:notes/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NoteDatabase {
  final database = Supabase.instance.client.from('mynotes');

  //Create Method
  Future createNote(Note newNote) async {
    await database.insert(newNote.toMap());
  }

  //Read Method
  final stream = Supabase.instance.client
      .from('mynotes')
      .stream(primaryKey: ['id'])
      .map((data) => data.map((noteMap) => Note.fromMap(noteMap)).toList());

  //Update Method
  Future updateNote(Note oldNote, String newContent) async {
    await database.update({'content': newContent}).eq('id', oldNote.id!);
  }

  //Delete Method
  Future deleteNote(Note note) async {
    await database.delete().eq('id', note.id!);
  }
 
}
