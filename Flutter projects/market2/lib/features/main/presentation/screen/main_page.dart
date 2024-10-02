import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:market2/core/ui/widgets/market_bottom_nav_bar.dart';

import '../bloc/main_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BlocProvider(
        create: (context) => HomeCubit(),
        child: MarketBottomNavBar(
          navigationShell: navigationShell,
        ),
      ),
    );

  }
}
