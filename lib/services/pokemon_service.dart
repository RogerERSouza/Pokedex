import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> buscarPokemons() async {

    final response = await http.get(
      Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?limit=151',
      ),
    );

    final data = jsonDecode(response.body);

    final futures =
        (data['results'] as List).map<Future<Pokemon>>(
      (item) async {

        final detalhe = await http.get(
          Uri.parse(item['url']),
        );

        return Pokemon.fromJson(
          jsonDecode(detalhe.body),
        );
      },
    );

    return await Future.wait(futures);
  }
}