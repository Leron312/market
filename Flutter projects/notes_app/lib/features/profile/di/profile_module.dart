import 'package:notes_app/core/di/core_module.dart';
import 'package:notes_app/features/profile/presentation/bloc/profile_bloc.dart';

void initProfileModule() {
  getIt.registerFactory(() => ProfileBloc(authInteractor: getIt(), notesInteractor: getIt()));
}