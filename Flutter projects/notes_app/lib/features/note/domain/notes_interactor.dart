import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:notes_app/core/models/event.dart';
import 'package:notes_app/features/auth/domain/repository/auth_local_repository.dart';
import 'package:notes_app/features/auth/domain/repository/auth_remote_repository.dart';
import 'package:notes_app/features/note/domain/repository/notes_local_repository.dart';
import 'package:notes_app/features/note/domain/repository/notes_remote_repository.dart';

import '../../notes_list/domain/models/note.dart';

class NotesInteractor {
  NotesInteractor({
    required NotesLocalRepository notesLocalRepository,
    required NotesRemoteRepository notesRemoteRepository,
    required AuthLocalRepository authLocalRepository,
    required AuthRemoteRepository authRemoteRepository,
  })  : _notesLocalRepository = notesLocalRepository,
        _notesRemoteRepository = notesRemoteRepository,
        _authLocalRepository = authLocalRepository,
        _authRemoteRepository = authRemoteRepository;

  final NotesLocalRepository _notesLocalRepository;
  final NotesRemoteRepository _notesRemoteRepository;
  final AuthLocalRepository _authLocalRepository;
  final AuthRemoteRepository _authRemoteRepository;

  final _controller = StreamController<Event>.broadcast();

  Stream<Event> get notesTriggerStream => _controller.stream;

  Future saveNote(Note note) async {
    final id = await _notesLocalRepository.saveNote(note);
    debugPrint('notes_interactor => saveNote -> id: $id');
    final user = _authLocalRepository.getUser();
    if (user == null) return;
    return _notesRemoteRepository.saveNote(note, user.uid);
  }

  Future<List<Note>> getNotes() async {
    final user = _authLocalRepository.getUser();
    if (user != null) {
      debugPrint('NOTES iNTERACTOR -> user: $user');
      final notes = await _notesRemoteRepository.getNotes(user.uid);
      await _notesLocalRepository.deleteAllLocalNotes();
      _notesLocalRepository.saveNotesList(notes);
      return notes;
    }
    return _notesLocalRepository.getNotes();
  }

  Future<List<Note>> getLocalNotes() async {
    return _notesLocalRepository.getNotes();
  }

  Future<Note?> getNoteById(String id) {
    return _notesLocalRepository.getNoteById(id);
  }

  Future deleteNote(String id) async {
    await _notesLocalRepository.deleteNote(id);
    final user = _authLocalRepository.getUser();
    if (user != null) {
      return _notesRemoteRepository.deleteNote(user.uid, id);
    }
  }

  Future saveLocalNotesToRemote(List<Note> notes) async {
    final user = _authLocalRepository.getUser();
    if (user != null) {
      for (var note in notes) {
        await _notesRemoteRepository.saveNote(note, user.uid);
      }
    }
  }

  Future deleteAllLocalNotes() {
    return _notesLocalRepository.deleteAllLocalNotes();
  }

  Future triggerNotesUpdate() async {
    final lastItem = await notesTriggerStream.last;
    _controller.sink.add(lastItem);
  }
}
