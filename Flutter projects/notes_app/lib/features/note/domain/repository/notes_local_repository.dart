import '../../../notes_list/domain/models/note.dart';

abstract class NotesLocalRepository {

  Future<int> saveNote(Note note, String id);

  Future saveNotesList(List<Note> notesList);

  Future<List<Note>> getNotes();

  Future<Note?> getNoteById(String id);

  Future deleteNote(String noteId);

  Future deleteAllLocalNotes();
}
