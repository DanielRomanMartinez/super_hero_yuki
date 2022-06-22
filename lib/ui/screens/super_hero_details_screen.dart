import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_hero_yuki/domain/model/objects/super_hero.dart';
import 'package:super_hero_yuki/ui/common/top_bar/common_top_bar.dart';

class SuperHeroDetailParams {
  final SuperHero superHero;

  SuperHeroDetailParams({
    required this.superHero,
  });
}

class SuperHeroDetailsScreen extends StatelessWidget {
  static const routeName = '/super-hero-screen-detail-screen';

  const SuperHeroDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as SuperHeroDetailParams;
    final SuperHero superHero = args.superHero;

    return Scaffold(
      appBar: const CommonTopAppBar(
        title: 'Super Hero Details',
        enableLeadingOption: true,
      ),
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value:
            SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  superHero.name,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.network(superHero.image),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
