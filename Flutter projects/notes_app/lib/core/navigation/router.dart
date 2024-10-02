import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/core/navigation/routes/login_route.dart';
import 'package:notes_app/core/navigation/routes/note_route.dart';
import 'package:notes_app/core/navigation/routes/profile_list_route.dart';
import 'package:notes_app/core/navigation/routes/registration_route.dart';
import 'package:notes_app/core/navigation/routes/reminders_route.dart';
import 'package:notes_app/features/registration/presentation/screen/registration_page.dart';

import '../../features/home/presentation/screen/home_page.dart';
import '../../features/login/presentation/screen/login_page.dart';
import '../../features/note/presentation/screen/note_page.dart';
import '../../features/notes_list/presentation/screen/notes_list_page.dart';
import '../../features/profile/presentation/screen/profile_page.dart';
import '../../features/reminder/presentation/screen/reminders_page.dart';
import 'routes/notes_list_route.dart';

class NotesRouter {
  final GoRouter _router = GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) => HomePage(navigationShell: child),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: NotesListRoute.name,
                pageBuilder: (context, state) => const MaterialPage(
                  child: NotesListPage(),
                ),
                routes: [
                  GoRoute(
                    name: NoteRoute.name,
                    path: NoteRoute.name,
                    pageBuilder: (context, state) {
                      final id = state.uri.queryParameters[NoteRoute.idKeyArg];
                      debugPrint('Router $id');
                      return MaterialPage(
                        child: NotePage(id: id),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RemindersRoute.name,
                pageBuilder: (context, state) => const MaterialPage(
                  child: RemindersPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: ProfileListRoute.name,
                  name: ProfileListRoute.name,
                  pageBuilder: (context, state) => const MaterialPage(
                        child: ProfilePage(),
                      ),
                  routes: [
                    GoRoute(
                        path: LoginRoute.name,
                        name: LoginRoute.name,
                        pageBuilder: (context, state) => const MaterialPage(
                              child: LoginPage(),
                            ),
                        routes: [
                          GoRoute(
                            path: RegistrationRoute.name,
                            name: RegistrationRoute.name,
                            pageBuilder: (context, state) => const MaterialPage(
                              child: RegistrationPage(),
                            ),
                          ),
                        ]),
                  ]),
            ],
          ),
        ],
      ),
    ],
  );

  GoRouter get router => _router;
}
