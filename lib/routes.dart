import 'package:flutter/material.dart';
import 'package:super_hero_yuki/ui/screens/main_screen.dart';
import 'package:super_hero_yuki/ui/screens/super_hero_details_screen.dart';

Map<String, WidgetBuilder> _routeGenerator() {
  final Map<String, WidgetBuilder> routes = {
    MainScreen.routeName: (_) => MainScreen(),
    SuperHeroDetailsScreen.routeName: (_) => const SuperHeroDetailsScreen(),
  };

  return routes;
}

final routes = _routeGenerator();

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
