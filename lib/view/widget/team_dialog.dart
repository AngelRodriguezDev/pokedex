import 'package:flutter/material.dart';
import 'package:pokedex/controller/pokedex_controller.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:pokedex/view/widget/pokemon_small_card.dart';
import 'package:provider/provider.dart';

class TeamDialog extends StatefulWidget {
  const TeamDialog({super.key});

  @override
  State<TeamDialog> createState() => _TeamDialogState();
}

class _TeamDialogState extends State<TeamDialog> {
  @override
  Widget build(BuildContext context) {
    List<Pokemon> pokeTeam = context.watch<PokedexController>().pokeTeam;
    return Center(
      child: AlertDialog(
        title: const Text("Mi equipo Pokemon"),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          for (Pokemon pokemon in pokeTeam) PokeSmallCard(pokemon: pokemon)
        ]),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cerrar"))
        ],
      ),
    );
  }
}
