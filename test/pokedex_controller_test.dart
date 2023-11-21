import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/controller/pokedex_controller.dart';
import 'package:pokedex/model/pokemon_model.dart';

void main() {
  group("pruebas actualizacion de equipo", () {
    //variables
    final testController = PokedexController();

    Pokemon testPokemon = Pokemon(
      id: 1,
      name: "bulbasaur",
      image:
          "ttps://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
      types: ["grass"],
    );
    test('prueba para agregar a mi equipo', () async {
      //prueba
      testController.updatePokeTeam(testPokemon);

      //expectativa
      expect(testController.pokeTeamCount, 1);
    });
    test('prueba para quitar de mi equipo', () async {
      //prueba
      testController.updatePokeTeam(testPokemon);

      //expectativa
      expect(testController.pokeTeamCount, 0);
    });
  });
}
