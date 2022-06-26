import 'package:super_hero_yuki/domain/exceptions/repository_error_exception.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';

abstract class SuperHeroRepository {
  Future<List<SuperHero>> readAll();
}

class SuperHeroesNotFoundException implements RepositoryErrorException {
  const SuperHeroesNotFoundException();
}