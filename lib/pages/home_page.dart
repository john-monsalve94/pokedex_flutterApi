import 'package:flutter/material.dart';
import 'package:pokemon/services/pokedex_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  String _capitalizestring(String text) {

    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PokedexService().getPokemonsList(),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<dynamic> pokemons = snapshot.data['results'];
        return ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            String capitalizedPokemonName =
                _capitalizestring(pokemons[index]['name']);
            return ListTile(title: Text(capitalizedPokemonName),);
          }
          );
      }
          );
      }    
  }
  

