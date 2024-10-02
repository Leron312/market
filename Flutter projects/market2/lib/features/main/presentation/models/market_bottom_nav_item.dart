import 'package:market2/core/navigation/routes/route_account.dart';
import 'package:market2/core/navigation/routes/route_explore.dart';
import 'package:market2/core/navigation/routes/route_offer.dart';

import '../../../../core/navigation/routes/route_cart.dart';
import '../../../../core/navigation/routes/route_home.dart';

enum MarketBottomNavItem {
  home,
  explore,
  cart,
  offer,
  account;

  String getRoute() {
    return switch (this) {
      MarketBottomNavItem.home => RouteHome.name,
      MarketBottomNavItem.explore => RouteExplore.name,
      MarketBottomNavItem.cart => RouteCart.name,
      MarketBottomNavItem.offer => RouteOffer.name,
      MarketBottomNavItem.account => RouteAccount.name
    };
  }

  static MarketBottomNavItem? from(int index) {
    return MarketBottomNavItem.values.firstWhere(
      (e) => e.index == index,
      orElse: () => MarketBottomNavItem.home,
    );
  }
}
