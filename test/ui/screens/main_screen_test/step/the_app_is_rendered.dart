import 'package:super_hero_yuki/application.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> theAppIsRendered(WidgetTester tester) async {
  final builder = DeviceBuilder()
    ..addScenario(widget: const SuperHeroYuki());
  await tester.pumpDeviceBuilder(builder);
}