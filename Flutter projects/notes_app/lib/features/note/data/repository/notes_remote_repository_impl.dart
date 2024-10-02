import 'package:notes_app/features/note/data/mappers/notes_data_mapper.dart';
import 'package:notes_app/features/note/data/service/notes_firebase_service.dart';
import '../../../notes_list/domain/models/note.dart';
import '../../domain/repository/notes_remote_repository.dart';
import '../db/models/note_entity.dart';

class NotesRemoteRepositoryImpl implements NotesRemoteRepository {
  final NotesFirebaseService _notesFirebaseService;
final NotesDataMapper _notesDataMapper;

  NotesRemoteRepositoryImpl({
    required NotesFirebaseService notesFirebaseService,
    required NotesDataMapper notesDataMapper,
  }) : _notesFirebaseService = notesFirebaseService,
        _notesDataMapper = notesDataMapper;

  @override
  Future saveNote(Note note, String userId) {
    NoteEntity entity = _notesDataMapper.mapToEntity(note);
    // NoteEntity(id: note.id, title: note.title, content: note.content);
    return _notesFirebaseService.insertNote(userId, entity);
    // debugPrint('saveNote > id: $remoteId');
  }

  @override
  Future<List<Note>> getNotes(String userId) async {
    return _notesFirebaseService.getNotes(userId).then((list) => list.map(_notesDataMapper.map).toList());
  }

  @override
  Future deleteNote(String userId, String noteId) {
    return _notesFirebaseService.deleteNote(userId, noteId);
  }
}