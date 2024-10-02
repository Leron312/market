
import 'package:get_it/get_it.dart';
import 'package:notes_app/core/database/notes_database.dart';
import 'package:notes_app/core/navigation/router.dart';

final getIt = GetIt.instance;

void initCoreModule() {

  getIt.registerSingleton(NotesDatabase());
  getIt.registerSingleton(NotesRouter());

}