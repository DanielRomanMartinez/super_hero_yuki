import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_hero_yuki/application.dart';

import 'injection.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const SuperHeroYuki());
}