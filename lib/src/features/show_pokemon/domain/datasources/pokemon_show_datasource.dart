import 'package:tesys21_test/src/features/show_pokemon/data/models/show_pokemon_response_model.dart';

abstract class PokemonShowDataSource {
  Future<ShowPokemonResponseModel> getPokemon({required int id});
}