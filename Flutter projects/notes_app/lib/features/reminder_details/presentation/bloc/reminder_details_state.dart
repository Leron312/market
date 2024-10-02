part of 'reminder_details_bloc.dart';

class ReminderDetailsState extends Equatable {
  const ReminderDetailsState({required this.type, required this.selectedDay});

  final DateTime selectedDay;
  final ReminderType type;

  ReminderDetailsState copyWith({
    DateTime? selectedDay,
    ReminderType? type,
  }) {
    return ReminderDetailsState(
      selectedDay: selectedDay ?? this.selectedDay,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [
        selectedDay,
        type,
      ];
}
