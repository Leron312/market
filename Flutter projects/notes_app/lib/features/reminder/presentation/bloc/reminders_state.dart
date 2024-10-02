
part of 'reminders_bloc.dart';

class RemindersState extends Equatable{
  const RemindersState({required this.selectedDay});

final DateTime selectedDay;

RemindersState copyWith({
    DateTime? selectedDay,
}){
  return RemindersState(selectedDay: selectedDay ?? this.selectedDay);
}

  @override
  List<Object?> get props => [selectedDay];
}