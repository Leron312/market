
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                routes: [
                  GoRoute(
                    name: ReminderDetailsRoute.name,
                    path: ReminderDetailsRoute.name,
                    pageBuilder: (context, state) {
                      final stringDate = state.uri.queryParameters[ReminderDetailsRoute.dateKeyArg];
                      final date = DateTime.tryParse(stringDate ?? '');
                      print('ROUTER STRING_DATA => $stringDate');
                      print('ROUTER DATE => $date');
                      return MaterialPage(
                        child: ReminderDetailsPage(date: date),
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
