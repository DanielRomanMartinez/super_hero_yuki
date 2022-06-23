// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:super_hero_yuki/injection.dart';

import './step/the_app_is_running.dart';
import './step/abomb.dart';
import './step/i_tap_widget.dart';
import './step/i_see_text.dart';
import './step/the_app_is_rendered.dart';
import './step/screenshot_verified.dart';

void main() {

  setUpAll(() async {
    configureDependencies();
  });

  group('''Counter''', () {
    testWidgets('''Initial Page''', (tester) async {
      await theAppIsRunning(tester);
      await abomb(tester);
    });
    testWidgets('''Tap the Super Hero''', (tester) async {
      await theAppIsRunning(tester);
      await iTapWidget(tester, ListTile);
      await iSeeText(tester, 'A-Bomb');
    });
    testGoldens('''Primary swatch color is blue''', (tester) async {
      await theAppIsRendered(tester);
      await screenshotVerified(tester, 'main_screen');
    });
  });
}
