import 'package:faker/faker.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/model/value_object/response.dart';

import '../../objects/mock/super_hero_mock.dart';

Response superHeroResponseMockGenerator({
  List<SuperHero>? superHeroes,
  String? body,
  int? statusCode,
  Map<String, String>? headers,
}) {
  final Faker faker = Faker();


  final Map<String, String> headersResponse = headers ?? {faker.lorem.words(1).join(''): faker.lorem.words(1).join('')};
  final int statusCodeResponse = statusCode ?? 200;
  final String bodyResponse;

  if(body != null){
    bodyResponse = body;
  } else if(body == null && superHeroes != null){
    bodyResponse = _generateBodyResponseFromListSuperHeroes(superHeroes: superHeroes);
  } else {
    bodyResponse = _generateBodyResponseFromListSuperHeroes(superHeroes: listSuperHeroMockGenerator(numSuperHeroes: faker.randomGenerator.integer(5)));
  }

  return Response(body: bodyResponse, statusCode: statusCodeResponse, headers: headersResponse);

}

String _generateBodyResponseFromListSuperHeroes({ required List<SuperHero> superHeroes }){

  String bodyResponse = '[';
  String comma = ',';
  final len = superHeroes.length;
  int i = 0;

  for (SuperHero superHero in superHeroes) {

    i++;
    if(i == len) comma = '';

    bodyResponse += '''{
            "id": ${superHero.id},
        "name": "${superHero.name}",
        "biography": {
        "fullName": "${superHero.fullName}",
        "placeOfBirth": "${superHero.placeOfBirth}"
        },
        "images": {
        "md": "${superHero.image}"
        }
      }$comma''';
  }

  bodyResponse+=']';

  return bodyResponse;
}