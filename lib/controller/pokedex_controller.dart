import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_service.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokedexController with ChangeNotifier {
  final List<Pokemon> _pokedex = [];
  final List<Pokemon> _pokeTeam = [];

  get pokedex => _pokedex;
  get pokedexCount => _pokedex.length;
  get pokeTeamCount => _pokeTeam.length;
  get pokeTeam => _pokeTeam;

  loadPokedex() async {
    List<dynamic> pokedexCurrentList =
        await PokedexAPI().getList(offset: _pokedex.length);

    for (var pokemon in pokedexCurrentList.elementAt(0)) {
      loadPokemonInfo(pokemon["url"]);
    }
  }

  loadPokemonInfo(String url) async {
    var auxInfo = await PokedexAPI().getPokemonInfo(url: url);
    Pokemon auxPokemon = Pokemon.fromJason(auxInfo);
    if (!_pokedex.contains(auxPokemon)) _pokedex.add(auxPokemon);
    _pokedex.sort((a, b) => a.id.compareTo(b.id));
    notifyListeners();
  }

  updatePokeTeam(Pokemon pokemon) {
    _pokeTeam.contains(pokemon)
        ? _pokeTeam.remove(pokemon)
        : _pokeTeam.length >= 5
            ? null
            : _pokeTeam.add(pokemon);
    print(_pokeTeam);
    notifyListeners();
  }
}
