import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:super_hero_yuki/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/ui/common/top_bar/common_top_bar.dart';
import 'package:super_hero_yuki/ui/screens/super_hero_details_screen/super_hero_details_screen.dart';

part 'widgets/super_heroes_list.dart';

class MainScreen extends StatelessWidget {
  static const routeName = '/main-screen';

  final MainScreenBloc _mainScreenBloc = GetIt.instance.get<MainScreenBloc>();

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonTopAppBar(title: 'Main Screen'),
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:
            SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocBuilder<MainScreenBloc, MainScreenState>(
                bloc: _mainScreenBloc,
                builder: (context, state) {
                  if (state is MainScreenSuperHeroesLoaded) {
                    return SuperHeroesList(superHeroes: state.superHeroes);
                  }

                  return const Center(
                      child:
                          CircularProgressIndicator(color: Color(0xffe04815)));
                }),
          ),
        ),
      ),
    );
  }
}
