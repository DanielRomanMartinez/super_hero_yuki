part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

class MainScreenEventLoadSuperHeroes extends MainScreenEvent {
  const MainScreenEventLoadSuperHeroes();

  @override
  List<Object?> get props => [];
}