import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:market2/core/navigation/routes/route_account.dart';
import 'package:market2/core/navigation/routes/route_cart.dart';
import 'package:market2/core/navigation/routes/route_explore.dart';
import 'package:market2/core/navigation/routes/route_home.dart';
import 'package:market2/features/home/presentation/screen/page_home.dart';

import '../../features/account/presentation/screen/page_account.dart';
import '../../features/cart/presentation/screen/page_cart.dart';
import '../../features/explore/presentation/screen/page_explore.dart';
import '../../features/main/presentation/screen/main_page.dart';

class MarketRouter {
  final GoRouter _router = GoRouter(
    routes: [
      StatefulShellRoute.indexedStack(
          builder: (context, state, child) => HomePage(
                navigationShell: child,
              ),
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: RouteHome.name,
                  pageBuilder: (context, state) => const MaterialPage(
                    child: PageHome(),
                  ),
                ),
              ],
            ),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RouteExplore.name,
                  pageBuilder: (context, state) => const MaterialPage(
                        child: PageExplore(),
                      ))
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RouteCart.name,
                  pageBuilder: (context, state) => const MaterialPage(
                        child: PageCart(),
                      ))
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                  path: RouteAccount.name,
                  pageBuilder: (context, state) => const MaterialPage(
                        child: PageAccount(),
                      ))
            ]),
          ]),
    ],
  );

  GoRouter get router => _router;
}
