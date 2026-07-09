import 'package:flutter/material.dart';
import 'package:pokedex/services/pokemon_service.dart';
import '../models/pokemon.dart';
import '../widgets/info_pokemon.dart';
import 'pokemon_page.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  List<Pokemon> pokemons = [];
  bool carregando = true;

  Pokemon? pokemonSelecionado;

  @override
  void initState() {
    super.initState();
    carregarPokemons();
  }

  Future<void> carregarPokemons() async {
    pokemons = await PokemonService().buscarPokemons();

    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pokédex",
        ),
      ),
      body: Row(
        children: [
          SizedBox(
              width: 350,
              child: ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index];
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        pokemonSelecionado = pokemon;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: ListTile(
                      leading: Text(
                        pokemon.numero.toString().padLeft(3, '0'),
                      ),
                      title: Text(textAlign: TextAlign.end, pokemon.nome),
                    ),
                  );
                },
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 50),
              color: Colors.blue,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(width: 2, color: Colors.black)),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.8),
                      ),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            pokemonSelecionado?.nome ?? "Selecione um pokemon",
                          ),
                        ),
                      ),
                    ),
                  ),
                  pokemonSelecionado == null
                      ? const SizedBox()
                      : SizedBox(child: Image.network(pokemonSelecionado!.image, fit: BoxFit.fill,),
                      width: 200, height: 200,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
