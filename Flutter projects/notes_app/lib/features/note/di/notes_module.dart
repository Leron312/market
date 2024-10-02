import 'package:notes_app/features/note/data/db/notes_db_service.dart';
import 'package:notes_app/features/note/data/mappers/notes_data_mapper.dart';
import 'package:notes_app/features/note/data/repository/notes_local_repository_impl.dart';
import 'package:notes_app/features/note/data/service/notes_firebase_service.dart';
import 'package:notes_app/features/note/presentation/cubit/note_cubit.dart';

import '../../../core/di/core_module.dart';
import '../data/repository/notes_remote_repository_impl.dart';
import '../domain/notes_interactor.dart';
import '../domain/repository/notes_local_repository.dart';
import '../domain/repository/notes_remote_repository.dart';

void initNotesModule() {
  getIt.registerLazySingleton(() => NotesDbService(notesDatabase: getIt()));
  getIt.registerLazySingleton(() => NotesFirebaseService());
  getIt.registerFactory(() => NotesDataMapper());

  getIt.registerLazySingleton<NotesLocalRepository>(() => NotesLocalRepositoryImpl(
        notesDbService: getIt(),
        notesDataMapper: getIt(),
      ));

  getIt.registerLazySingleton<NotesRemoteRepository>(() => NotesRemoteRepositoryImpl(
        notesFirebaseService: getIt(),
        notesDataMapper: getIt(),
      ));

  getIt.registerFactory(() => NotesInteractor(
        notesLocalRepository: getIt(),
        notesRemoteRepository: getIt(),
        authLocalRepository: getIt(),
        authRemoteRepository: getIt(),
      ));

  getIt.registerFactoryParam(
      (String? param1, param2) => NoteCubit(id: param1, notesInteractor: getIt()));
}
