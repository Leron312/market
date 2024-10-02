

import 'package:equatable/equatable.dart';

import '../../domain/models/note.dart';

sealed class NotesListEvent extends Equatable{

  @override
  List<Object?> get props => [];
}

class NotesDataLoaded extends NotesListEvent{
  NotesDataLoaded();
}

class NoteDeleted extends NotesListEvent{
  final Note note;

  NoteDeleted({required this.note});

  @override
  List<Object?> get props => [note];
}

class NotesListActionChanged extends NotesListEvent{

  final String? action;

  NotesListActionChanged({required this.action});

  @override
  List<Object?> get props => [action];
}