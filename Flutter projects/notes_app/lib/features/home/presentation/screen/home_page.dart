import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_app/features/home/presentation/bloc/home_cubit.dart';

import '../../../../core/di/core_module.dart';
import '../../../../core/ui/widgets/notes_bottom_nav_bar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(AuthUserSubscribed()),
          lazy: false,
        ),
      ],
      child: _Body(navigationShell: navigationShell),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: navigationShell,
          bottomNavigationBar: NotesBottomNavBar(
            navigationShell: navigationShell,
          ),
        );
      },
    );
  }
}
