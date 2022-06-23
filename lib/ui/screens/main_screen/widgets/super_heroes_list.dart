part of '../main_screen.dart';

class SuperHeroesList extends StatelessWidget {
  final List<SuperHero> superHeroes;

  const SuperHeroesList({
    Key? key,
    required this.superHeroes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double bottom = 0;

    return ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: superHeroes.length,
        itemBuilder: (context, index) {
          if (index == superHeroes.length - 1) {
            bottom = 20;
          }

          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffe04815), width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
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
            margin:
                EdgeInsets.only(top: 18, right: 16, left: 16, bottom: bottom),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  SuperHeroDetailsScreen.routeName,
                  arguments: SuperHeroDetailParams(
                    superHero: superHeroes[index],
                  ),
                );
              },
              contentPadding: const EdgeInsets.all(0),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.network(
                  superHeroes[index].image,
                  width: 50,
                  height: 50,
                ),
              ),
              title: Text(superHeroes[index].name),
            ),
          );
        });
  }
}
