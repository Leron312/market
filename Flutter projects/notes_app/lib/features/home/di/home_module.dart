import 'package:notes_app/features/home/presentation/bloc/home_cubit.dart';

import '../../../core/di/core_module.dart';

void initHomeModule(){
  getIt.registerFactory(() => HomeCubit());
}