import 'package:flutter/material.dart';
import 'package:pokedex/controller/pokedex_controller.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:provider/provider.dart';

class PokeSmallCard extends StatefulWidget {
  final Pokemon pokemon;
  const PokeSmallCard({required this.pokemon, super.key});

  @override
  State<PokeSmallCard> createState() => _PokeSmallCardState();
}

class _PokeSmallCardState extends State<PokeSmallCard> {
  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = widget.pokemon;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(pokemon.image),
          Column(
            children: [
              Text(
                pokemon.name.toUpperCase(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () =>
                    context.read<PokedexController>().updatePokeTeam(pokemon),
                child: const Text("Quitar de mi equipo"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
