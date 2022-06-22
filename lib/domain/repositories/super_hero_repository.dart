import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';

abstract class SuperHeroRepository {
  Future<List<SuperHero>> readAll();
}