import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/features/notes_list/presentation/bloc/notes_list_event.dart';
import '../../../../core/di/core_module.dart';
import '../../../../core/navigation/routes/note_route.dart';
import '../bloc/notes_list_bloc.dart';
import '../bloc/notes_list_state.dart';

class NotesListPage extends StatelessWidget {
  const NotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotesListBloc>()..add(NotesDataLoaded()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NOTE LIST'),
        ),
        body: const _Body(),
        floatingActionButton: const _CreateButton(),
      ),
    );
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton();

  @override
  Widget build(BuildContext context) {
    final notesListBloc = context.read<NotesListBloc>();
    return FloatingActionButton(
      child: const Icon(Icons.note_add_outlined),
      onPressed: () {
        context.push('/${NoteRoute.name}').then(
          (value) {
            if (value == true) {
              notesListBloc.add(NotesDataLoaded());
            }
          },
        );
      },
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final notesListBloc = context.read<NotesListBloc>();
    return BlocBuilder<NotesListBloc, NotesListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final notes = state.notes;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final note = notes[index];
            return Slidable(
              key: ValueKey(note.id),
              endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(
                    onDismissed: () {
                      notesListBloc.add(NoteDeleted(note: note));
                    },
                  ),
                  children: [
                    SlidableAction(
                      flex: 2,
                      onPressed: (context) {
                        notesListBloc.add(NoteDeleted(note: note));
                      },
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                    const SlidableAction(
                      onPressed: null,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.cancel,
                      label: 'Cancel',
                    ),
                  ]),
              child: ListTile(
                  leading: const Icon(Icons.note_outlined),
                  title: Text(
                    note.title,
                    style: const TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(note.content),
                  onTap: () {
                    final id = note.id;
                    debugPrint('$id');
                    context.push(NoteRoute.getRouteWithArgs(id)).then((value) {
                      if (value == true) {
                        notesListBloc.add(NotesDataLoaded());
                      }
                    });
                  } // onTap: () => context.push(),
                  ),
            );
          },
          itemCount: notes.length,
        );
      },
    );
  }
}
