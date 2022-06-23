import 'package:golden_toolkit/golden_toolkit.dart';

Feature: Counter
  Scenario: Initial Page
    Given the app is running
    Then A-Bomb

  Scenario: Tap the Super Hero
    Given the app is running
    When I tap {ListTile} widget
    Then I see {'A-Bomb'} text

  @testMethodName: testGoldens
  Scenario: Main Screen screenshot verification
    Given the app is rendered
    And {'main_screen'} screenshot verified