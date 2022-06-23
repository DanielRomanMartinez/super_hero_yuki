import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTapSuperHero(WidgetTester tester, Widget widget) async {
  await tester.tap(find.byWidget(widget));
  await tester.pump();
}