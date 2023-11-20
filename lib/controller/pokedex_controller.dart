import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokedexController with ChangeNotifier {
  List<Pokemon> _pokeTeam = [];
  get pokeTeam => _pokeTeam;
  get pokeTeamCount => _pokeTeam.length;

  updatePokeTeam(Pokemon pokemon) {
    _pokeTeam.contains(pokemon)
        ? _pokeTeam.remove(pokemon)
        : _pokeTeam.length >= 5
            ? null
            : _pokeTeam.add(pokemon);
  }
}
