class Note {
  int? id;
  DateTime? created_at;
  String content;

  Note({this.id, this.created_at, required this.content});

  //map -> note

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      created_at: DateTime.parse(map['created_at']),
      content: map['content'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{'content': content};
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
