import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_hero_yuki/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/services/super_hero_service.dart';

import '../../domain/model/objects/mock/super_hero_mock.dart';
import 'main_screen_bloc_test.mocks.dart';

@GenerateMocks([
  SuperHeroService,
])
void main() {
  final SuperHeroService superHeroService = MockSuperHeroService();

  group('Main Screen Bloc', () {

    final List<SuperHero> superHeroes = listSuperHeroMockGenerator(numSuperHeroes: 5);

    when(superHeroService.readAll()).thenAnswer((_) => Future.value(superHeroes));

    blocTest(
      'Creating Bloc',
      build: () => MainScreenBloc(
        superHeroService,
      ),
      expect: () => [
        MainScreenSuperHeroesLoaded(superHeroes: superHeroes),
      ],
      verify: (_) {
        verify(superHeroService.readAll()).called(1);
      },
    );

    blocTest(
      'Send Load Event',
      build: () => MainScreenBloc(
        superHeroService,
      )..add(const MainScreenEventLoadSuperHeroes()),
      expect: () => [
        MainScreenSuperHeroesLoaded(superHeroes: superHeroes),
      ],
      verify: (_) {
        verify(superHeroService.readAll()).called(2);
      },
    );
  });
}
