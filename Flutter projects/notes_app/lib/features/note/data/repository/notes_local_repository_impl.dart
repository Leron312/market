import 'package:flutter/cupertino.dart';
import 'package:notes_app/features/note/data/mappers/notes_data_mapper.dart';

import '../../../notes_list/domain/models/note.dart';
import '../../domain/repository/notes_local_repository.dart';
import '../db/models/note_entity.dart';
import '../db/notes_db_service.dart';

class NotesLocalRepositoryImpl implements NotesLocalRepository {
  final NotesDbService _notesDbService;
  final NotesDataMapper _notesDataMapper;

  NotesLocalRepositoryImpl({
    required NotesDbService notesDbService,
    required NotesDataMapper notesDataMapper,
  })  : _notesDbService = notesDbService,
        _notesDataMapper = notesDataMapper;

  @override
  Future<int> saveNote(Note note) {
    NoteEntity entity = NoteEntity(id: note.id, title: note.title, content: note.content);
    final noteId = _notesDbService.insertNote(entity);
    debugPrint('saveNote > id: $noteId');
    return noteId;
  }

  @override
  Future<List<Note>> getNotes() {
    final entities = _notesDbService.getNotes();
    return entities.then((list) => list.map((e) => _notesDataMapper.map(e)).toList());
  }

  @override
  Future<Note?> getNoteById(String id) {
    final entity = _notesDbService.getNoteById(id);
    return entity.then((e) => e == null ? null : _notesDataMapper.map(e));
  }

  @override
  Future deleteNote(String noteId) {
    return _notesDbService.deleteNote(noteId);
  }

  @override
  Future saveNotesList(List<Note> notesList) {
    final entities = notesList.map(_notesDataMapper.mapToEntity).toList();
    return _notesDbService.insertNotesList(entities);
  }

  @override
  Future deleteAllLocalNotes() {
    return _notesDbService.deleteAllNotes();
  }
}
