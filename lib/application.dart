import 'package:flutter/material.dart';
import 'package:super_hero_yuki/routes.dart';
import 'package:super_hero_yuki/ui/screens/main_screen/main_screen.dart';

class SuperHeroYuki extends StatelessWidget {
  const SuperHeroYuki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.routeName,
      routes: routes,
    );
  }
}
