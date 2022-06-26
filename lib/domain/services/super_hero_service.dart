import 'package:injectable/injectable.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/repositories/super_hero_repository.dart';

@injectable
class SuperHeroService {
  final SuperHeroRepository _superHeroRepository;

  const SuperHeroService(
    this._superHeroRepository,
  );

  Future<List<SuperHero>> readAll() async {
    try {
      return await _superHeroRepository.readAll();
    } catch (_) {
      rethrow;
    }
  }
}
