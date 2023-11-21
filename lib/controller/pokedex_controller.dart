import 'package:flutter/material.dart';
import 'package:pokedex/api/pokedex_service.dart';
import 'package:pokedex/model/pokemon_model.dart';

class PokedexController with ChangeNotifier {
  List<Pokemon> _pokedex = [];
  List<Pokemon> _pokeTeam = [];

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
    if (!_pokedex.contains(auxInfo)) _pokedex.add(Pokemon.fromJason(auxInfo));
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
