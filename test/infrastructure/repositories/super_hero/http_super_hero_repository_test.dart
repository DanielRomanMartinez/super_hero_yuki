import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/model/value_object/response.dart';
import 'package:super_hero_yuki/domain/repositories/super_hero_repository.dart';
import 'package:super_hero_yuki/domain/services/http_service.dart';
import 'package:super_hero_yuki/infrastructure/repositories/super_hero/http_super_hero_repository.dart';

import '../../../domain/model/value_object/mock/response_mock.dart';
import 'http_super_hero_repository_test.mocks.dart';

@GenerateMocks([HttpService])
void main() {
  group('Tests over Super HeroRepository', () {
    final HttpService httpService = MockHttpService();
    final HttpSuperHeroRepository repository =
        HttpSuperHeroRepository(httpService);

    test('Connection OK - Super Hero OK', () async {

      Response response = superHeroResponseMockGenerator();

      when(httpService.get(Uri.parse(HttpSuperHeroRepository.urlApi)))
          .thenAnswer((_) => Future.value(response));

      expect(await repository.readAll(), isA<List<SuperHero>>());
    });

    test('Connection OK - Super Hero NO OK', () async {
      final Faker faker = Faker();

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

      when(httpService.get(Uri.parse(HttpSuperHeroRepository.urlApi)))
          .thenAnswer((_) => Future.value(superHeroResponseMockGenerator(body: httpMockResponseKO)));

      expect(
        () async => await repository.readAll(),
        throwsA(
          predicate((e) => e is MalformedSuperHeroMapException),
        ),
      );
    });

    test('Connection KO', () async {
      when(httpService.get(Uri.parse(HttpSuperHeroRepository.urlApi)))
          .thenAnswer((_) => Future.value(superHeroResponseMockGenerator(statusCode: 500)));

      expect(
        () async => await repository.readAll(),
        throwsA(
          predicate((e) => e is SuperHeroesNotFoundException),
        ),
      );
    });
  });
}
