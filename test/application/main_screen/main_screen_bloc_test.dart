import 'package:bloc_test/bloc_test.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:super_hero_yuki/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/services/super_hero_service.dart';

import 'main_screen_bloc_test.mocks.dart';

@GenerateMocks([
  SuperHeroService,
])
void main() {
  final Faker faker = Faker();

  final SuperHeroService superHeroService = MockSuperHeroService();

  group('Main Screen Bloc', () {

    // TODO: Generate MockGenerator SuperHero

    final int id = faker.randomGenerator.integer(5);
    final String name = faker.lorem.words(1).join('');
    final String fullName = faker.lorem.words(2).join(' ');
    final String placeOfBirth = faker.lorem.words(2).join(' ');
    final String image = faker.lorem.words(2).join('');

    final List<SuperHero> superHeroes = [
      SuperHero(id: id, name: name, fullName: fullName, placeOfBirth: placeOfBirth, image: image),
    ];

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
