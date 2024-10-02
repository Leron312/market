import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:notes_app/features/note/presentation/cubit/note_state.dart';
import 'package:uuid/uuid.dart';

import '../../../notes_list/domain/models/note.dart';
import '../../domain/notes_interactor.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit({
    String? id,
    required NotesInteractor notesInteractor,
  })  : _notesInteractor = notesInteractor,
        super(const NoteState(title: '', content: '')){
debugPrint('Cubit $id');
    if (id != null) _loadNoteById(id);
  }

  final NotesInteractor _notesInteractor;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  void updateTitle(String name) {
    emit(state.copyWith(title: name));
  }

  void updateContent(String content) {
    emit(state.copyWith(title: content));
  }

  void saveNote() async {
    final id = state.id ?? const Uuid().v4();
    final note = Note(id: id, title: titleController.text, content: contentController.text);
    await _notesInteractor.saveNote(note);
debugPrint('### noteCubit -> updateContent -> content: $id');
    emit(state.copyWith(needExit: true));
  }

  void _loadNoteById(String id) async{

   emit(state.copyWith(id: id, isLoading: true));
   await Future.delayed(const Duration(milliseconds: 300));
   final note = await _notesInteractor.getNoteById(id);
   titleController.text = note?.title ?? '';
   contentController.text = note?.content ?? '';
   emit(state.copyWith(isLoading: false));
   // emit(state.copyWith(title: note?.title, content: note?.content, shoudInit: true));
  }
}
