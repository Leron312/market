part of 'reminder_details_bloc.dart';

sealed class ReminderDetailsEvent extends Equatable{
  const ReminderDetailsEvent();

}

class RemindersDetailsDayTapped extends ReminderDetailsEvent {

  final DateTime selectedDay;
  // final DateTime focusedDay;

  const RemindersDetailsDayTapped({required this.selectedDay});

  @override
  List<Object?> get props => [selectedDay];
}

class RemindersDetailsTimeSelected extends ReminderDetailsEvent {

  final TimeOfDay? timeOfDay;

  const RemindersDetailsTimeSelected({required this.timeOfDay});

  @override
  List<Object?> get props => [timeOfDay];
}