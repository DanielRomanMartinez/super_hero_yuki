import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/domain/services/super_hero_service.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

@lazySingleton
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  final SuperHeroService _superHeroService;

  MainScreenBloc(
    this._superHeroService,
  ) : super(const MainScreenInitial()) {
    on<MainScreenEventLoadSuperHeroes>(_handleLoadSuperHeroes);

    add(const MainScreenEventLoadSuperHeroes());
  }

  void _handleLoadSuperHeroes(
    MainScreenEventLoadSuperHeroes event,
    Emitter<MainScreenState> emit,
  ) async {
    try {
      emit(MainScreenSuperHeroesLoaded(
          superHeroes: await _superHeroService.readAll()));
    } on Exception catch (_, e) {
      // TODO: Try Catch --> Catch log error to somewhere eg firebase crashlytics
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
