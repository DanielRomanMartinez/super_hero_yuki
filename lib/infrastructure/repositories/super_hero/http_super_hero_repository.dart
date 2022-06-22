import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/repositories/super_hero_repository.dart';
import 'package:http/http.dart' as http;

@Injectable(as: SuperHeroRepository)
class HttpSuperHeroRepository implements SuperHeroRepository {
  static const String urlApi =
      'https://akabab.github.io/superhero-api/api/all.json';

  @override
  Future<List<SuperHero>> readAll() async {
    final List<SuperHero> superHeroes = [];

    final response = await http.get(Uri.parse(urlApi));

    if (response.statusCode == 200) {
      List<dynamic> superHeroesApiResponse = jsonDecode(response.body);

      for (var superHero in superHeroesApiResponse) {
        Map<String, dynamic> superHeroMap = {
          'id': superHero['id'],
          'name': superHero['name'],
          'fullName': superHero['biography']['fullName'],
          'placeOfBirth': superHero['biography']['placeOfBirth'],
          'image': superHero['images']['md'],
        };
        superHeroes.add(SuperHero.fromMap(superHeroMap));
      }

      return superHeroes;
    } else {
      throw Exception('Failed to load super heroes');
    }
  }
}
