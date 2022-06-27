import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:super_hero_yuki/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/model/value_object/response.dart';
import 'package:super_hero_yuki/domain/repositories/super_hero_repository.dart';
import 'package:super_hero_yuki/domain/services/super_hero_service.dart';
import 'package:super_hero_yuki/infrastructure/repositories/super_hero/http_super_hero_repository.dart';
import 'package:super_hero_yuki/injection.dart';
import 'package:super_hero_yuki/domain/services/http_service.dart';

import '../../../domain/model/objects/mock/super_hero_mock.dart';
import '../../../domain/model/value_object/mock/response_mock.dart';
import './step/the_app_is_running.dart';
import './step/i_tap_widget.dart';
import './step/i_see_text.dart';
import './step/the_app_is_rendered.dart';

class MockMainScreenBloc extends MockBloc<MainScreenEvent, MainScreenState> implements MainScreenBloc {}
class MockMainScreenState extends Fake implements MainScreenState {}
class MockMainScreenEvent extends Fake implements MainScreenEvent {}
class MockSuperHeroService extends Mock implements SuperHeroService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final SuperHeroService superHeroService = MockSuperHeroService();
  final MainScreenBloc mainScreenBloc = MockMainScreenBloc();

  setUpAll(() {
    configureDependencies();
    registerFallbackValue(MockMainScreenState());
    registerFallbackValue(MockMainScreenEvent());
  });

  tearDown(() {
    clearInteractions(superHeroService);
    reset(superHeroService);
  });

  group('''Super Hero''', () {
    testWidgets('''Main Screen''', (tester) async {
      final List<SuperHero> superHeroes = listSuperHeroMockGenerator(numSuperHeroes: 5);

      when(() => superHeroService.readAll()).thenAnswer((_) => Future.value(superHeroes));
      when(() => mainScreenBloc.state).thenReturn(
        MainScreenSuperHeroesLoaded(superHeroes: superHeroes), // the desired state
      );

      await theAppIsRunning(tester);
      await iSeeText(tester, 'Main Screen');
      await iSeeText(tester, superHeroes.first.name);

      verify(() => superHeroService.readAll()).called(1);
    });

    /*
    testWidgets('''Tap the Super Hero''', (tester) async {
      await theAppIsRunning(tester);
      await iTapWidget(tester, ListTile); // TODO: Make test
      await iSeeText(tester, 'Super Hero Details');
      await iSeeText(tester, 'A-Bomb');
    });
    testGoldens('''Screenshot verified''', (tester) async {
      await theAppIsRendered(tester);
      // await screenshotVerified(tester, 'main_screen'); // TODO: Make test
    });
    */
  });
}
