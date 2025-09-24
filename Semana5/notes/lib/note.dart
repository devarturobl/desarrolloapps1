class Note{
  int? id;
  String content;

  Note({
    this.id, 
    required this.content
    });

    //map -> note

    factory Note.fromMap(Map<String, dynamic> map){
      return Note(
        id: map['id'],
        content: map['content']
      );
    }

    Map<String, dynamic> toMap(){
      final map = <String, dynamic>{
        'content': content
      };
      if (id != null) {
        map['id'] = id;
      }
      return map;
    }
}



