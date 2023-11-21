import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pokedex/controller/pokedex_controller.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/view/widget/pokemon_card.dart';
import 'package:pokedex/view/widget/team_dialog.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  Widget build(BuildContext context) {
    int countPoketeam = context.watch<PokedexController>().pokeTeamCount;
    List<Pokemon> pokedex = context.watch<PokedexController>().pokedex;

    if (pokedex.isEmpty) context.read<PokedexController>().loadPokedex();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/pokeball.png",
                ),
                Text(countPoketeam.toString(),
                    style: const TextStyle(
                        fontSize: 28,
                        shadows: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(3, 3),
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
            onPressed: () => showDialog(
                useSafeArea: true,
                context: context,
                builder: (context) => const TeamDialog()),
          ),
        ],
        title: const Text("POKEDEX"),
        backgroundColor: Colors.redAccent.shade700,
        foregroundColor: Colors.white,
      ),
      body: pokedex.length < 10
          ? Center(
              child: JumpingText(
                "...Cargando Pokedex...",
                style: TextStyle(color: Colors.red, fontSize: 24),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(4.0),
              child: LazyLoadScrollView(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      PokeCard(pokemon: pokedex[index]),
                  itemCount: pokedex.length,
                ),
                onEndOfPage: () =>
                    context.read<PokedexController>().loadPokedex(),
              ),
            ),
    );
  }
}
