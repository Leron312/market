import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../features/main/presentation/bloc/main_cubit.dart';
import '../../../generated/l10n.dart';

class MarketBottomNavBar extends StatelessWidget {
  const MarketBottomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) {
            context.read<HomeCubit>().changeBottonNavItem(index);
            navigationShell.goBranch(index);
          },
          backgroundColor: Colors.black12,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.black26,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: S.of(context).explore,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: S.of(context).cart,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: S.of(context).account,
            ),
          ],
        );
      },
    );
  }
}
