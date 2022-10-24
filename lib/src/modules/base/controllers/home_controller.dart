import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/core/infra/api.dart';
import 'package:pokedex/src/core/infra/api_endpoints.dart';
import 'package:pokedex/src/core/services/dio_services.dart';
import 'package:pokedex/src/modules/base/models/pokemon.dart';

class HomeController extends ChangeNotifier {
  HomeController() {
    init();
  }

  TextEditingController controllerSearch = TextEditingController();
  ValueNotifier<int> quantidadeDePokemons = ValueNotifier<int>(0);
  ValueNotifier<List> listaPokemon = ValueNotifier<List>([]);
  ValueNotifier<bool> isLoadList = ValueNotifier<bool>(false);
  List listaPokemonAux = [];

  int totalRequest = 50;

  loadListaPokemon() async {
    for (var i = 1; i < totalRequest; i++) {
      await DioServices.get('${Api.apiUrl}${ApiEndpoint.pokemon.name}/$i').then((value) async {
        await DioServices.get('${Api.apiUrl}${ApiEndpoint.pokemonSpecies.name}/${value.data['name']}').then((colorValue) {
          listaPokemon.value.add(Pokemon(
              id: value.data['id'],
              name: value.data['name'],
              sprite: value.data['sprites']['other']['dream_world']['front_default'],
              stats: value.data['stats'],
              types: value.data['types'],
              color: colorValue.data['color']['name']));
          listaPokemonAux.add(Pokemon(
              id: value.data['id'],
              name: value.data['name'],
              sprite: value.data['sprites']['other']['dream_world']['front_default'],
              stats: value.data['stats'],
              types: value.data['types'],
              color: colorValue.data['color']['name']));
          quantidadeDePokemons.value = listaPokemon.value.length;
        });
      });
      if (i == 25) {
        isLoadList.value = true;
      }
    }
  }

  searchPokemon() {
    if (controllerSearch.text.isNotEmpty) {
      listaPokemon.value =
          listaPokemonAux.where((element) => element.name.toLowerCase().contains(controllerSearch.text.toLowerCase())).toList();
      quantidadeDePokemons.value = listaPokemon.value.length;
      notifyListeners();
    } else {
      listaPokemon.value = listaPokemonAux;
      quantidadeDePokemons.value = listaPokemon.value.length;
      notifyListeners();
    }
  }

  init() {
    debugPrint('Init: Home controller');
    loadListaPokemon();
  }
}
