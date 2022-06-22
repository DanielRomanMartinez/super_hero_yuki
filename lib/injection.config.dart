// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/bloc/main_screen/main_screen_bloc.dart' as _i6;
import 'domain/repositories/super_hero_repository.dart' as _i3;
import 'domain/services/super_hero_service.dart' as _i5;
import 'infrastructure/repositories/super_hero/http_super_hero_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.SuperHeroRepository>(() => _i4.HttpSuperHeroRepository());
  gh.factory<_i5.SuperHeroService>(
      () => _i5.SuperHeroService(get<_i3.SuperHeroRepository>()));
  gh.lazySingleton<_i6.MainScreenBloc>(
      () => _i6.MainScreenBloc(get<_i5.SuperHeroService>()));
  return get;
}
