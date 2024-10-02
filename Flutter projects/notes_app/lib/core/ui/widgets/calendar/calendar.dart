import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  final DateTime selectedDay;
  final Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: selectedDay,
      firstDay: DateTime(1900),
      currentDay: selectedDay,
      lastDay: DateTime(2000),
      onDaySelected: onDaySelected,
    );
  }
}

class DateCalendarWidget extends StatelessWidget {
  const DateCalendarWidget({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  final DateTime selectedDay;
  final Function(DateTime selectedDay) onDaySelected;

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
currentDate: selectedDay,
      onDateChanged: (selectedDay) => onDaySelected(selectedDay),
    );
  }
}

class TimePicker extends StatelessWidget {
  const TimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return TimePickerDialog(initialTime: TimeOfDay(hour: 0, minute: 0));
  }
}

