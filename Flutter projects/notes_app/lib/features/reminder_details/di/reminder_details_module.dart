import '../../../core/di/core_module.dart';
import '../presentation/bloc/reminder_details_bloc.dart';

void initReminderDetailsModule() {

  getIt.registerFactoryParam((DateTime? param1, param2) => ReminderDetailsBloc(selectedDay: param1));
}