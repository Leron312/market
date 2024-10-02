import '../../../core/di/core_module.dart';
import '../presentation/bloc/reminders_bloc.dart';

void initRemindersModule(){

  getIt.registerFactory(() => RemindersBloc());

}