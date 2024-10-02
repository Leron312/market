import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reminders_event.dart';

part 'reminders_state.dart';

class RemindersBloc extends Bloc<RemindersEvent, RemindersState> {
  RemindersBloc() : super(RemindersState(selectedDay: DateTime.now())) {
    on<RemindersDayTapped>(_onRemindersDayTapped);
  }

  void _onRemindersDayTapped(
    RemindersDayTapped event,
    Emitter<RemindersState> emit,
  ) {
    emit(state.copyWith(selectedDay: event.selectedDay));
  }
}
