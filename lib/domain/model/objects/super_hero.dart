import 'package:equatable/equatable.dart';
import 'package:super_hero_yuki/domain/exceptions/malformed_map_exception.dart';

class SuperHero extends Equatable {
  final int id;
  final String name;
  final String fullName;
  final String placeOfBirth;
  final String image;

  const SuperHero({
    required this.id,
    required this.name,
    required this.fullName,
    required this.placeOfBirth,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    fullName,
    placeOfBirth,
    image,
  ];

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'fullName': fullName,
    'placeOfBirth': placeOfBirth,
    'image': image,
  };

  factory SuperHero.fromMap(Map<String, dynamic> map) {
    if (map['id'] is! int ||
        map['name'] is! String ||
        map['fullName'] is! String ||
        map['placeOfBirth'] is! String ||
        map['image'] is! String) throw MalformedSuperHeroMapException(map);

    return SuperHero(
      id: map['id'],
      name: map['name'],
      fullName: map['fullName'],
      placeOfBirth: map['placeOfBirth'],
      image: map['image'],
    );
  }
}

class MalformedSuperHeroMapException implements MalformedMapException {
  @override
  final Map<String, dynamic> map;

  MalformedSuperHeroMapException(this.map);
}
