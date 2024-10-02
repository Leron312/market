import '../../../notes_list/domain/models/note.dart';
import '../db/models/note_entity.dart';

class NotesDataMapper {
  Note map(NoteEntity entity){
    return Note(
      id: entity.id,
      title: entity.title,
      content: entity.content,
    );
  }

  NoteEntity mapToEntity(Note entity){
    return NoteEntity(
      id: entity.id,
      title: entity.title,
      content: entity.content,
    );
  }
}