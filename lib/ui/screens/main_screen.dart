import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:super_hero_yuki/application/bloc/main_screen/main_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_hero_yuki/ui/screens/super_hero_details_screen.dart';

import '../common/top_bar/common_top_bar.dart';

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
                    double bottom = 0;

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: state.superHeroes.length,
                        itemBuilder: (context, index) {
                          if (index == state.superHeroes.length - 1) {
                            bottom = 20;
                          }

                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffe04815), width: 1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x335f6368),
                                  offset: Offset(0, 2),
                                  blurRadius: 6,
                                  spreadRadius: 0,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            margin: EdgeInsets.only(
                                top: 18, right: 16, left: 16, bottom: bottom),
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  SuperHeroDetailsScreen.routeName,
                                  arguments: SuperHeroDetailParams(
                                    superHero: state.superHeroes[index],
                                  ),
                                );
                              },
                              contentPadding: const EdgeInsets.all(0),
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Image.network(
                                  state.superHeroes[index].image,
                                  width: 50,
                                  height: 50,
                                ),
                              ),
                              title: Text(state.superHeroes[index].name),
                            ),
                          );
                        });
                  }

                  return const Text('Loading...');
                }),
          ),
        ),
      ),
    );
  }
}
