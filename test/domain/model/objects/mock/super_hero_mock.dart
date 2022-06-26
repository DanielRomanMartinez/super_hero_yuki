import 'package:faker/faker.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';

SuperHero superHeroMockGenerator({
  int? id,
  String? name,
  String? fullName,
  String? placeOfBirth,
  String? image,
}) {
  final Faker faker = Faker();

  return SuperHero(
    id: id ?? faker.randomGenerator.integer(5),
    name: name ?? faker.lorem.words(1).join(''),
    fullName: fullName ?? faker.lorem.words(2).join(' '),
    placeOfBirth: placeOfBirth ?? faker.lorem.words(2).join(' '),
    image: image ?? faker.lorem.words(2).join(''),
  );
}

List<SuperHero> listSuperHeroMockGenerator({
  required int numSuperHeroes,
  int? id,
  String? name,
  String? fullName,
  String? placeOfBirth,
  String? image,
}) {
  final List<SuperHero> superHeroes = [];

  for (int i = 0; i < numSuperHeroes; i++) {
    superHeroes.add(superHeroMockGenerator(
      id: id,
      name: name,
      fullName: fullName,
      placeOfBirth: placeOfBirth,
      image: image,
    ));
  }

  return superHeroes;
}
