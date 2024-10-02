import 'package:notes_app/core/navigation/routes/reminders_route.dart';

class ReminderDetailsRoute{
  static const String dateKeyArg = "date";

  static const String name = "reminder_details";

  static String getRouteWithArgs(DateTime date) {
    return '${RemindersRoute.name}/$name?$dateKeyArg=$date';
  }
}