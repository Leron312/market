import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:notes_app/features/reminder_details/presentation/models/reminder_type.dart';

part 'reminder_details_event.dart';

part 'reminder_details_state.dart';

class ReminderDetailsBloc extends Bloc<ReminderDetailsEvent, ReminderDetailsState> {
  ReminderDetailsBloc({
    DateTime? selectedDay,
  }) : super(
          ReminderDetailsState(
            selectedDay: selectedDay ?? DateTime.now(),
            type: ReminderType.event,
          ),
        ) {
    on<RemindersDetailsDayTapped>(_onRemindersDayTapped);
    on<RemindersDetailsTimeSelected>(_onRemindersTimeSelected);
  }

  void _onRemindersDayTapped(
    RemindersDetailsDayTapped event,
    Emitter<ReminderDetailsState> emit,
  ) {
    emit(state.copyWith(selectedDay: event.selectedDay));
  }

  void _onRemindersTimeSelected(
    RemindersDetailsTimeSelected event,
    Emitter<ReminderDetailsState> emit,
  ) {
    final timeOfDay = event.timeOfDay;
    if (timeOfDay == null) return;
    final currentDate = state.selectedDay.copyWith(hour: timeOfDay.hour, minute: timeOfDay.minute);
    emit(state.copyWith(selectedDay: currentDate));
  }
}
