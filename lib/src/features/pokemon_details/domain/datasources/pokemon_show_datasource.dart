import 'package:tesys21_test/src/features/pokemon_details/data/models/show_pokemon_response_model.dart';

abstract class PokemonShowDataSource {
  Future<ShowPokemonResponseModel> getPokemon({required int id});
}