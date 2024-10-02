import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/core_module.dart';
import '../bloc/reminder_details_bloc.dart';
import '../models/reminder_type.dart';

class ReminderDetailsPage extends StatelessWidget {
  const ReminderDetailsPage({super.key, this.date});

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    print('DATA => $date');
    return BlocProvider(
      create: (context) => getIt.get<ReminderDetailsBloc>(param1: date),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('REMINDER DETAILS'),
            bottom: TabBar(
              labelColor: Colors.black12,
              tabs: [
                Tab(text: 'EVENT'),
                Tab(text: 'TASK'),
              ],
              onTap: (index) {
                print(index);
              },
            ),
          ),
          body: _Body(
            date: date,
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({this.date});

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
  final reminderType = context.select((ReminderDetailsBloc bloc) => bloc.state.type);
   if(reminderType == ReminderType.event) {
     _EventBody();
   }else{
     _TaskBody();
   }
    return const TabBarView(
      children: [

      ],
    );
  }
}

class _EventBody extends StatelessWidget {
  const _EventBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('EVENT BODY'),
        SingleChildScrollView(
          child: Column(
            children: [
              _CurrentDate(),
              _CurrentTime(),
            ],
          ),
        ),
      ],
    );
  }
}

class _TaskBody extends StatelessWidget {
  const _TaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('TASK BODY'),
      ],
    );
  }
}

class _CurrentDate extends StatelessWidget {
  const _CurrentDate();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReminderDetailsBloc>();
    final date = context.select((ReminderDetailsBloc bloc) => bloc.state.selectedDay);
    final dateFormat = DateFormat.yMMMEd('ru');
    final formattedDate = dateFormat.format(date);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('Выбранная дата: '),
          SizedBox(
            width: 22,
          ),
          TextButton(
            onPressed: () async {
              final selectedDay = await showTimePicker(
                context: context,
                // firstDate: DateTime(1900),
                // lastDate: DateTime(2100),
                initialTime:TimeOfDay(hour: 0, minute: 0));
              bloc.add(RemindersDetailsTimeSelected(timeOfDay: selectedDay));
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return Dialog(
              //         // insetPadding: EdgeInsets.symmetric(vertical: 200, horizontal: 20),
              //         child: SizedBox(
              //           width: double.infinity,
              //           height: 400,
              //           child: CalendarWidget(
              //             onDaySelected: (selectedDay, focusedDay) {
              //               bloc.add(
              //                 RemindersDetailsDayTapped(
              //                     selectedDay: selectedDay, focusedDay: focusedDay),
              //               );
              //               context.pop();
              //             },
              //             selectedDay: date,
              //           ),
              //         ),
              //       );
              //     });
            },
            child: Text(formattedDate),
          ),
        ],
      ),
    );
  }
}

class _CurrentTime extends StatelessWidget {
  const _CurrentTime();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ReminderDetailsBloc>();
    final date = context.select((ReminderDetailsBloc bloc) => bloc.state.selectedDay);
    final dateFormat = DateFormat.Hm('ru');
    final formattedDate = dateFormat.format(date);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('Выбранное время: '),
          SizedBox(
            width: 22,
          ),
          TextButton(
            onPressed: () async {
              final timeOfDay = TimeOfDay.fromDateTime(date);
              final selectedtimeOfDay =
                  await showTimePicker(context: context, initialTime: timeOfDay);
              print('selectedTimeOfDay: $selectedtimeOfDay');
              bloc.add(RemindersDetailsTimeSelected(timeOfDay: selectedtimeOfDay));
            },
            child: Text(formattedDate),
          ),
        ],
      ),
    );
  }
}
