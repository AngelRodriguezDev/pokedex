import 'package:flutter/material.dart';
import 'package:pokedex/controller/pokedex_controller.dart';
import 'package:pokedex/core/type_colors.dart';
import 'package:pokedex/model/pokemon_model.dart';
import 'package:provider/provider.dart';
import 'package:stroke_text/stroke_text.dart';

class PokeCard extends StatefulWidget {
  final pokemon;
  const PokeCard({required this.pokemon, super.key});

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = widget.pokemon;
    List<Pokemon> pokeTeam = context.watch<PokedexController>().pokeTeam;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(pokemon.image),
          Column(
            children: [
              Text(
                pokemon.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  for (var type in pokemon.types)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: typeColors[type],
                      ),
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      child: StrokeText(
                        text: type,
                        textColor: Colors.white,
                        strokeWidth: 2,
                        strokeColor: Colors.black,
                      ),
                    )
                ],
              ),
            ],
          ),
          pokeTeam.length >= 5
              ? Text(
                  "Tu equipo esta completo",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.blue[800], fontWeight: FontWeight.bold),
                )
              : pokeTeam.contains(pokemon)
                  ? Text(
                      "Ya es parte de tu equipo",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.bold),
                    )
                  : TextButton(
                      onPressed: () => context
                          .read<PokedexController>()
                          .updatePokeTeam(pokemon),
                      child: Column(
                        children: [
                          Text(
                            "Agregar a mi equipo",
                          ),
                          Icon(
                            Icons.add,
                          ),
                        ],
                      ),
                    ),
        ],
      ),
    );
  }
}
