import 'package:notes_app/features/registration/presentation/bloc/registration_bloc.dart';

import '../../../core/di/core_module.dart';

void initRegistrationModule() {

  getIt.registerFactory(() => RegistrationBloc(authInteractor: getIt()));
}