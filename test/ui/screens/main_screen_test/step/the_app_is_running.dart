import 'package:flutter_test/flutter_test.dart';
import 'package:super_hero_yuki/application.dart';

Future<void> theAppIsRunning(WidgetTester tester) async {
  await tester.pumpWidget(const SuperHeroYuki());
}