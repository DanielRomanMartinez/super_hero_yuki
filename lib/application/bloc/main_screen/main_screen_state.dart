part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState extends Equatable {
  const MainScreenState();
}

class MainScreenInitial extends MainScreenState {
  const MainScreenInitial();

  @override
  List<Object> get props => [];
}

class MainScreenSuperHeroesLoaded extends MainScreenState {
  final List<SuperHero> superHeroes;

  const MainScreenSuperHeroesLoaded({
    required this.superHeroes,
  });

  @override
  List<Object> get props => [superHeroes];
}