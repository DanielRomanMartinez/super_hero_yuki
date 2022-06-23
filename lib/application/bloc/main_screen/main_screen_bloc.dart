import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
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

  void _handleLoadSuperHeroes(_, Emitter<MainScreenState> emit) async {
    // TODO: Try Catch --> Catch log error to somewhere eg firebase crashlytics
    emit(MainScreenSuperHeroesLoaded(superHeroes: await _superHeroService.readAll()));
  }
}
