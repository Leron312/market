import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/features/auth/domain/auth_interactor.dart';
import 'package:notes_app/features/note/domain/notes_interactor.dart';

import 'notes_list_event.dart';
import 'notes_list_state.dart';

class NotesListBloc extends Bloc<NotesListEvent, NotesListState> {
  NotesListBloc({
    required NotesInteractor notesInteractor,
    required AuthInteractor authInteractor,
  })  : _notesInteractor = notesInteractor,
        _authInteractor = authInteractor,
        super(const NotesListState(notes: [])) {
    _observeUser();
    // _observeNotesTrigger();
    on<NotesDataLoaded>(_onNotesDataLoaded);
    on<NoteDeleted>(_onNoteDeleted);
    on<NotesListActionChanged>(_onNotesListActionChanged);
  }

  final NotesInteractor _notesInteractor;
  final AuthInteractor _authInteractor;

  void _onNotesDataLoaded(
    NotesDataLoaded event,
    Emitter<NotesListState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final notes = await _notesInteractor.getNotes();
      emit(state.copyWith(notes: notes, isLoading: false));
    }catch(e){
      emit(state.copyWith(isLoading: false));
    }
  }

  void _onNoteDeleted(
    NoteDeleted event,
    Emitter<NotesListState> emit,
  ) {
    final note = event.note;
    final notes = state.notes.toList();
    notes.remove(event.note);
    _notesInteractor.deleteNote(note.id);
    emit(state.copyWith(notes: notes));
  }

  void _observeUser() {
    _authInteractor.observeLocalUser().listen((user) {
      add(NotesDataLoaded());
    });
  }

  // void _observeNotesTrigger() {
  //   _notesInteractor.notesTriggerStream.listen((needUpdate) {
  //     debugPrint('needUpdate: $needUpdate');
  //     add(NotesDataLoaded());
  //   },
  //   onError: (error){
  //     debugPrint('observeNotesTriger: onERROR $error');
  //   },
  //     onDone: (){
  //     debugPrint('observeNotesTrigger: onDONE');
  //     },
  //     cancelOnError: false,
  //   );
  // }

  void _onNotesListActionChanged(
    NotesListActionChanged event,
    Emitter<NotesListState> emit,
  ) async {
    emit(state.copyWith(currentAction: event.action));
  }
}
