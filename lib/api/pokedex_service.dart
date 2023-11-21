import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PokedexAPI {
  String urlpokedex = dotenv.env['URL_POKEDEX']!;
  Dio request = Dio();

  Future<List<dynamic>> getList({int offset = 0}) async {
    //hacer peticion de los siguientes 10 pokemon
    List<dynamic> response = [];
    String finalUrl = "${urlpokedex}pokemon?limit=10&offset=$offset";

    try {
      await request
          .get(finalUrl)
          .then((value) => response.add(value.data["results"]));
    } catch (e) {
      print(e);
    }
    return response;
  }

  Future<Map<String, dynamic>> getPokemonInfo({required String url}) async {
    //hacer peticion de información pokemon

    Map<String, dynamic> response = {};
    try {
      await request.get(url).then((value) => response = value.data);
    } catch (e) {
      print(e);
    }
    return response;
  }
}
