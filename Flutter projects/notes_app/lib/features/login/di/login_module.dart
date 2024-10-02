import 'package:notes_app/core/di/core_module.dart';
import 'package:notes_app/features/login/presentation/bloc/login_bloc.dart';

void initLoginModule(){

  getIt.registerFactory(() => LoginBloc(authInteractor: getIt(), notesInteractor: getIt()));

}