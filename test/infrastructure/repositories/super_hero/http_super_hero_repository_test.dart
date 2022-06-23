import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/model/value_object/response.dart';
import 'package:super_hero_yuki/domain/services/http_service.dart';
import 'package:super_hero_yuki/infrastructure/repositories/super_hero/http_super_hero_repository.dart';

import 'http_super_hero_repository_test.mocks.dart';

@GenerateMocks([HttpService])

void main() {
  group('Tests over Super HeroRepository', () {
    final Faker faker = Faker();
    final HttpService httpService = MockHttpService();
    final HttpSuperHeroRepository repository = HttpSuperHeroRepository(httpService);

    // TODO: Generate mock generator

    final int id = faker.randomGenerator.integer(5);
    final String stringId = faker.lorem.words(1).join('');
    final String name = faker.lorem.words(1).join('');
    final String fullName = faker.lorem.words(2).join(' ');
    final String placeOfBirth = faker.lorem.words(2).join(' ');
    final String image = faker.lorem.words(2).join('');

    final String httpMockResponseKO = '''
          [{
        "id": "$stringId",
        "name": "$name",
        "biography": {
          "fullName": "$fullName",
          "placeOfBirth": "$placeOfBirth"
        },
        "images": {
          "md": "$image"
        }
      }]''';

    final String httpMockResponseOK = '''
          [{
        "id": $id,
        "name": "$name",
        "biography": {
          "fullName": "$fullName",
          "placeOfBirth": "$placeOfBirth"
        },
        "images": {
          "md": "$image"
        }
      }]''';

    test('Connection OK - Super Hero OK', () async {

      when(httpService.get(Uri.parse(HttpSuperHeroRepository.urlApi)))
          .thenAnswer((_) => Future.value(Response(body: httpMockResponseOK, statusCode: 200, headers: const {'header': 'mock'} )));

      expect(await repository.readAll(), isA<List<SuperHero>>());
    });

    test('Connection OK - Super Hero NO OK', () async {
      when(httpService.get(Uri.parse(HttpSuperHeroRepository.urlApi)))
          .thenAnswer((_) => Future.value(Response(body: httpMockResponseKO, statusCode: 200, headers: const {'header': 'mock'} )));

      expect(
            () async => await repository.readAll(),
        throwsA(
          predicate((e) => e is MalformedSuperHeroMapException),
        ),
      );
    });

    test('Connection KO', () async {
      // TODO: Make Test
      when(httpService.get(Uri.parse(HttpSuperHeroRepository.urlApi)))
          .thenAnswer((_) => Future.value(Response(body: httpMockResponseOK, statusCode: 500, headers: const {'header': 'mock'} )));

      expect(
            () async => await repository.readAll(),
        throwsA(
          predicate((e) => e is Exception),
        ),
      );
    });
  });
}
