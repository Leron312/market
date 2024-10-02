import 'package:notes_app/core/di/core_module.dart';
import 'package:notes_app/features/notes_list/presentation/bloc/notes_list_bloc.dart';

void initNotesListModule() {
  getIt.registerFactory(() => NotesListBloc(
        notesInteractor: getIt(),
        authInteractor: getIt(),
      ));
}
