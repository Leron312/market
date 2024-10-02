import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/navigation/routes/reminder_details_route.dart';
import 'package:notes_app/core/ui/widgets/calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../core/di/core_module.dart';
import '../bloc/reminders_bloc.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RemindersBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('REMINDERS'),
        ),
        body: const _Body(),
        floatingActionButton: const _AddNewButton(),
      ),
    );
  }
}

class _AddNewButton extends StatelessWidget {
  const _AddNewButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final date = context.select((RemindersBloc bloc) => bloc.state.selectedDay);
    return FloatingActionButton(
      onPressed: () {
        final route = ReminderDetailsRoute.getRouteWithArgs(date);
        context.go(route);
      },
      child: const Icon(Icons.add_circle_outline),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RemindersBloc>();
    final selectedDay = context.select((RemindersBloc bloc) => bloc.state.selectedDay);
    return DateCalendarWidget(
      onDaySelected: (selectedDay) {
        bloc.add(RemindersDayTapped(selectedDay: selectedDay));
      },
      selectedDay: selectedDay,
    );
  }
}
